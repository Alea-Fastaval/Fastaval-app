/// Application-wide constants for the Fastaval app
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // WiFi Configuration
  static const String wifiNetworkName = 'ITCN-Hotspot';
  static const String wifiUser = 'mfg-guest@mf-gym.dk';
  static const String wifiPassword = 'Fjernvarme2022';

  // Contact Information
  static const String safeFastavalEmail = "safe@fastaval.dk";
  
  static const Map<String, String> taxi1PhoneNumber = {
    "value": "+4598525354",
    "name": "98 52 53 54",
  };
  
  static const Map<String, String> taxi2PhoneNumber = {
    "value": "+4598512300",
    "name": "98 51 23 00",
  };
  
  static const Map<String, String> heroForcePhoneNumber = {
    "value": "+4593903568",
    "name": "93 90 35 68",
  };
  
  static const Map<String, String> dutyGeneralPhoneNumber = {
    "value": "+4593903569",
    "name": "93 90 35 69",
  };
  
  static const Map<String, String> safetyHostPhoneNumber = {
    "value": "+4593903567",
    "name": "93 90 35 67",
  };

  // Service Opening Hours
  static const Map<String, Map<String, String>> serviceOpeningHours = {
    "bar": {
      "day1": "17:00 - 02:00",
    },
    "boardGames": {
      "day1": "09:00 - 02:00",
      "day2": "09:00 - 15:00",
    },
    "coffeeCafe": {
      "day1": "11:00 - 01:00",
      "day2": "09:00 - 01:00",
      "day3": "09:00 - 15:00",
    },
    "information": {
      "day1": "15:00 - 20:30",
      "day2": "09:30 - 20:30",
      "day3": "09:30 - 17:00",
    },
    "kiosk": {
      "day1": "08:00 - 00:00",
      "day2": "08:00 - 16:00",
    },
    "ottosLivingRoom": {
      "day1": "15:00 - 01:00",
    },
  };

  // Store Opening Hours
  static const Map<String, Map<String, String>> storeOpeningHours = {
    "store1": {
      "day1": "15:00 - 23:00",
      "day2": "10:00 - 23:00",
      "day3": "10:00 - 15:00",
    },
    "store2": {
      "day1": "11:00 - 18:00",
      "day2": "13:00 - 17:00",
      "day3": "14:00 - 17:00",
    },
    "store3": {
      "day1": "15:00 - 20:00",
      "day2": "09:30 - 20:00",
      "day3": "09:30 - 18:00",
    },
    "store4": {
      "day1": "10:00 - 22:00",
    },
    "store5": {
      "day1": "12:00 - 18:00",
    },
  };
}
