import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box _box;

  /// Initializes Hive and opens the box
  static Future<void> initialize() async {
    await Hive.initFlutter(); // Initialize Hive for Flutter
    _box = await Hive.openBox('Sohail'); // Open the box correctly
  }

  /// Getter for showOnboarding with a default value
  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true) ?? true;

  /// Setter for showOnboarding
  static set showOnboarding(bool value) => _box.put('showOnboarding', value);
}
