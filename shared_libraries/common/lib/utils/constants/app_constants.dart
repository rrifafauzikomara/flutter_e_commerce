class AppConstants {
  const AppConstants();

  static CachedKey cachedKey = const CachedKey();
  static AppApi appApi = const AppApi();
  static ErrorKey errorKey = const ErrorKey();
  static ErrorMessage errorMessage = const ErrorMessage();
  static FCMServerKey fcmServerKey = const FCMServerKey();
}

class CachedKey {
  const CachedKey();

  String get onBoardingKey => 'onBoardingKey';

  String get tokenKey => 'tokenKey';

  String get fcmToken => 'fcmToken';
}

class AppApi {
  const AppApi();

  String get baseUrl => 'https://aurel-store.herokuapp.com/v1/';

  String get signUp => 'user/customer/register';

  String get signIn => 'user/login';

  String get user => 'user';

  String get updateUserImage => 'user/image';

  String get banner => 'customer/product/banner';

  String get product => 'customer/product?per_page=5';

  String get category => 'category';
}

class ErrorKey {
  const ErrorKey();

  String get username => 'username';

  String get password => 'password';

  String get confirmPassword => "confirmPassword";

  String get message => "message";

  String get fullName => "fullName";

  String get address => "address";

  String get userProfileNotEmpty => "userProfileNotEmpty";
}

class ErrorMessage {
  const ErrorMessage();

  String get usernameEmpty => "username must not empty";

  String get passwordEmpty => "password must not empty";

  String get confirmPasswordEmpty => "confirm password must not empty";

  String get confirmPasswordMustSame =>
      "password and confirm password must same";

  String get formNotEmpty => "username and password must not empty";

  String get failedGetOnBoarding => 'failed get onboarding status';

  String get failedGetToken => 'failed get onboarding status';

  String get fullNameEmpty => "full name must not empty";

  String get addressEmpty => "address must not empty";

  String get userProfileNotEmpty => "full name and address must not empty";
}

class FCMServerKey {
  const FCMServerKey();

  String get fcmServerKey =>
      "AAAAmdmaPOA:APA91bGG4DE4o2sZbf53aYKP11quEQ5z_Nj-_X3L1AYi5M-ng6kgK5p6QxumBpWb8lpyGxyUBbDtNTT8ngb2qmVnvOW68C2XkB06JdplxRYNJ3Ki5s6mXilI-IX_cTSQl2Ug9rgCoPHI";
}
