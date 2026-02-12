import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const String appName = 'Pinterest Clone';
  static String get pexelsApiKey => dotenv.env['PEXELS_API_KEY'] ?? '';
  static const String pexelsBaseUrl = 'https://api.pexels.com/v1';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double cardRadius = 16.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
}
