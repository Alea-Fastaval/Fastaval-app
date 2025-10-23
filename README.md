# Fastaval App

A Flutter project for Alea's Fastaval

> **Note:** The app has been recently modernized with improved architecture, centralized theming, and comprehensive testing. See [MODERNIZATION.md](MODERNIZATION.md) for details.

## Requirements

To run this project, you need to have the following installed on your computer:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) (for Android development)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development)
- A web browser (Chrome, Firefox, Safari, etc.) for web development

## Project Structure

```
lib/
├── core/              # Core functionality (theme, constants)
├── controllers/       # GetX controllers
├── helpers/          # Helper functions
├── models/           # Data models
├── screens/          # UI screens
├── services/         # Business logic services
└── widgets/          # Reusable widgets
```

## Commands

| Command                                                    | Description                                                                                                |
| ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `flutter run`                                              | Starts the project in a local browser or connected device                                                  |
| `flutter clean`                                            | Cleans all project files. Good before building release                                                     |
| `dart pub get`                                             | Download packages from pubspec.yaml                                                                        |
| `dart format .`                                            | Formats the Dart code according to the Dart style guide                                                    |
| `dart analyze`                                             | Analyzes the code for issues                                                                               |
| `flutter test`                                             | Runs all unit and widget tests                                                                             |
| `flutter build appbundle --no-tree-shake-icons --release` | Builds a release bundle of Android. This is the recommended format for publishing to the Google Play Store |
| `flutter build ipa`                                        | Builds a release file for iOS                                                                              |
| `pod update`                                               | Run inside ios folder to update CocoaPods dependencies                                                     |

## Deploy to iOS

When you want to deploy the app, build it using the above command, open the app "Transporter" and upload it through there.

## Flutter Documentation

For help getting started with Flutter, view our [online documentation](https://flutter.dev/docs),
which offers tutorials, samples, guidance on mobile development, and a full API reference.
