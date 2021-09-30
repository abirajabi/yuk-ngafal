import 'dart:io' show Platform;

class Secret {
  static const IOS_CLIENT_ID =
      '922145341995-1ghpqub36ck35mtne5hmaj62vkvdnjgg.apps.googleusercontent.com';
  static const ANDROID_CLIENT_ID =
      '922145341995-ca1qe8ouubg4de05ugk28e46jlaiqae4.apps.googleusercontent.com';
  static const WEB_CLIENT_ID = '';

  static String getId() =>
      Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
