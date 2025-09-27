class ResourceManager {
  // Player resources
  int coins = 0;
  int wood = 0;
  int metal = 0;
  int food = 0;

  // Weapon upgrades
  int weaponLevel = 1;
  double weaponDamage = 10.0;

  // Room upgrades
  Map<String, int> roomUpgrades = {
    'storage': 1,
    'workshop': 1,
    'barricades': 1,
  };

  void addCoins(int amount) {
    try {
      if (amount < 0) {
        throw ArgumentError('Amount must be positive');
      }
      coins += amount;
    } catch (e) {
      print('Error adding coins: $e');
    }
  }

  void addWood(int amount) {
    try {
      if (amount < 0) {
        throw ArgumentError('Amount must be positive');
      }
      wood += amount;
    } catch (e) {
      print('Error adding wood: $e');
    }
  }

  void addMetal(int amount) {
    try {
      if (amount < 0) {
        throw ArgumentError('Amount must be positive');
      }
      metal += amount;
    } catch (e) {
      print('Error adding metal: $e');
    }
  }

  void addFood(int amount) {
    try {
      if (amount < 0) {
        throw ArgumentError('Amount must be positive');
      }
      food += amount;
    } catch (e) {
      print('Error adding food: $e');
    }
  }

  bool canAfford(int coinCost, int woodCost, int metalCost, int foodCost) {
    try {
      return coins >= coinCost && 
             wood >= woodCost && 
             metal >= metalCost && 
             food >= foodCost;
    } catch (e) {
      print('Error checking affordability: $e');
      return false;
    }
  }

  bool spendResources(int coinCost, int woodCost, int metalCost, int foodCost) {
    try {
      if (canAfford(coinCost, woodCost, metalCost, foodCost)) {
        coins -= coinCost;
        wood -= woodCost;
        metal -= metalCost;
        food -= foodCost;
        return true;
      }
      return false;
    } catch (e) {
      print('Error spending resources: $e');
      return false;
    }
  }

  void upgradeWeapon() {
    try {
      if (weaponLevel <= 0) {
        throw StateError('Weapon level must be positive');
      }
      
      if (canAfford(weaponLevel * 50, weaponLevel * 10, weaponLevel * 5, 0)) {
        spendResources(weaponLevel * 50, weaponLevel * 10, weaponLevel * 5, 0);
        weaponLevel++;
        weaponDamage += 5.0;
        print('Weapon upgraded to level $weaponLevel');
      } else {
        print('Not enough resources to upgrade weapon');
      }
    } catch (e) {
      print('Error upgrading weapon: $e');
    }
  }

  void upgradeRoom(String roomType) {
    try {
      if (!roomUpgrades.containsKey(roomType)) {
        throw ArgumentError('Invalid room type: $roomType');
      }
      
      final currentLevel = roomUpgrades[roomType] ?? 1;
      final upgradeCost = currentLevel * 100;
      
      if (canAfford(upgradeCost, currentLevel * 20, currentLevel * 10, 0)) {
        spendResources(upgradeCost, currentLevel * 20, currentLevel * 10, 0);
        roomUpgrades[roomType] = currentLevel + 1;
        print('Room $roomType upgraded to level ${roomUpgrades[roomType]}');
      } else {
        print('Not enough resources to upgrade room $roomType');
      }
    } catch (e) {
      print('Error upgrading room: $e');
    }
  }
}