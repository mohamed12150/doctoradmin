class AppConstants {
  // API Constants
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = 'v1';
  static const int timeoutDuration = 30; // seconds
  
  // Storage Keys
  static const String userDataKey = 'user_data';
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String themeKey = 'theme';
  static const String languageKey = 'language';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Animation Durations
  static const int animationDurationFast = 200; // milliseconds
  static const int animationDurationNormal = 300; // milliseconds
  static const int animationDurationSlow = 500; // milliseconds
  
  // Debounce Duration
  static const int debounceDuration = 500; // milliseconds
  
  // Image Constants
  static const String defaultAvatar = 'assets/images/mm.png';
  static const String placeholderImage = 'assets/images/placeholder.png';
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  static const int minBioLength = 10;
  static const int maxBioLength = 500;
  
  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayTimeFormat = 'h:mm a';
  static const String displayDateTimeFormat = 'MMM dd, yyyy h:mm a';
  
  // App Limits
  static const int maxAppointmentsPerPage = 20;
  static const int maxNotificationsPerPage = 50;
  static const int maxSearchResults = 100;
  
  // Feature Flags
  static const bool enableNotifications = true;
  static const bool enableDarkMode = true;
  static const bool enableAnimations = true;
  static const bool enableLogging = true;
  
  // Error Codes
  static const String errorCodeNetwork = 'NETWORK_ERROR';
  static const String errorCodeTimeout = 'TIMEOUT_ERROR';
  static const String errorCodeServer = 'SERVER_ERROR';
  static const String errorCodeValidation = 'VALIDATION_ERROR';
  static const String errorCodeUnauthorized = 'UNAUTHORIZED_ERROR';
  static const String errorCodeNotFound = 'NOT_FOUND_ERROR';
  static const String errorCodeUnknown = 'UNKNOWN_ERROR';
}
