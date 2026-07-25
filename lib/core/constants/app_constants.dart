/// Application-wide constants for the Fastaval app.
///
/// This class contains configuration values, contact information,
/// and operational data used throughout the application.
///
/// Example usage:
/// ```dart
/// final wifiName = AppConstants.wifiNetworkName;
/// final email = AppConstants.safeFastavalEmail;
/// ```
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
}
