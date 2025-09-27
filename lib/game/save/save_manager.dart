import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SaveManager {
  static const String saveFileName = 'zombie_survival_save.json';

  Future<String> get _localPath async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    } catch (e) {
      print('Error getting local path: $e');
      rethrow;
    }
  }

  Future<File> get _localFile async {
    try {
      final path = await _localPath;
      return File('$path/$saveFileName');
    } catch (e) {
      print('Error getting local file: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> readSave() async {
    try {
      final file = await _localFile;
      
      // Check if file exists
      if (!await file.exists()) {
        print('Save file does not exist, returning default values');
        return _getDefaultSaveData();
      }
      
      // Read the file
      final contents = await file.readAsString();
      
      // Decode JSON
      return jsonDecode(contents);
    } catch (e) {
      print('Error reading save file: $e');
      // If there's an error (file doesn't exist, corrupted, etc.), return default values
      return _getDefaultSaveData();
    }
  }

  Future<File> writeSave(Map<String, dynamic> saveData) async {
    try {
      final file = await _localFile;
      
      // Ensure directory exists
      final directory = file.parent;
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      
      // Encode and write to file
      return file.writeAsString(jsonEncode(saveData));
    } catch (e) {
      print('Error writing save file: $e');
      rethrow;
    }
  }

  Future<void> saveGame({
    required double playerHealth,
    required Map<String, dynamic> playerPosition,
    required Map<String, int> resources,
    required int weaponLevel,
    required Map<String, int> roomUpgrades,
    required int currentWave,
  }) async {
    try {
      final saveData = {
        'player': {
          'health': playerHealth,
          'position': playerPosition,
        },
        'resources': resources,
        'upgrades': {
          'weaponLevel': weaponLevel,
          'roomUpgrades': roomUpgrades,
        },
        'wave': currentWave,
      };
      
      await writeSave(saveData);
      print('Game saved successfully');
    } catch (e) {
      print('Error saving game: $e');
      rethrow;
    }
  }
  
  Map<String, dynamic> _getDefaultSaveData() {
    return {
      'player': {
        'health': 100.0,
        'position': {'x': 100.0, 'y': 100.0},
      },
      'resources': {
        'coins': 0,
        'wood': 0,
        'metal': 0,
        'food': 0,
      },
      'upgrades': {
        'weaponLevel': 1,
        'roomUpgrades': {
          'storage': 1,
          'workshop': 1,
          'barricades': 1,
        }
      },
      'wave': 1,
    };
  }
}