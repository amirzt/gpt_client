
class GlobalURL{

  // static const String host = '193.36.84.224';
  static const String host = 'addstory.website';

  static const String scheme = 'https';
  static const int port = 80;



  // user
  static Uri loginUri = Uri(scheme: scheme, host: host, path: '/api/users/login/');
  static Uri splashUri = Uri(scheme: scheme, host: host, path: '/api/users/splash/');

  // support
  static Uri getInstagram = Uri(scheme: scheme, host: host, path: '/api/support/get_instagram/');
  static Uri getEmail = Uri(scheme: scheme, host: host, path: '/api/support/get_email/');
  static Uri getTelegram = Uri(scheme: scheme, host: host, path: '/api/support/get_telegram/');

  // stickers
  static Uri getStickerCategories = Uri(scheme: scheme, host: host, path: '/api/stickers/get_sticker_categories/');
  static Uri getStickers = Uri(scheme: scheme, host: host, path: '/api/stickers/get_stickers/');
  static Uri addFavoriteStickers = Uri(scheme: scheme, host: host, path: '/api/stickers/add_favorite_stickers/');
  static Uri getFavoriteStickers = Uri(scheme: scheme, host: host, path: '/api/stickers/get_favorite_stickers/');
  static Uri getStoryBackgroundCategories = Uri(scheme: scheme, host: host, path: '/api/stickers/get_story_background_categories/');
  static Uri getStoryBackgrounds = Uri(scheme: scheme, host: host, path: '/api/stickers/get_story_backgrounds/');
  static Uri addFavoriteStoryBackgrounds = Uri(scheme: scheme, host: host, path: '/api/stickers/add_favorite_story_backgrounds/');
  static Uri getFavoriteStoryBackgrounds = Uri(scheme: scheme, host: host, path: '/api/stickers/get_favorite_story_backgrounds/');

  // fonts
  static Uri getLanguages = Uri(scheme: scheme, host: host, path: '/api/fonts/get_languages/');
  static Uri getFonts = Uri(scheme: scheme, host: host, path: '/api/fonts/get_fonts/');
  static Uri getBackgrounds = Uri(scheme: scheme, host: host, path: '/api/fonts/get_backgrounds/');
  static Uri addMyFont = Uri(scheme: scheme, host: host, path: '/api/fonts/add_my_font/');
  static Uri getMyFont = Uri(scheme: scheme, host: host, path: '/api/fonts/get_my_font/');
  static Uri removeMyFont = Uri(scheme: scheme, host: host, path: '/api/fonts/remove_my_font/');
  static Uri pinFont = Uri(scheme: scheme, host: host, path: '/api/fonts/pin_font/');
  static Uri addCustomFont = Uri(scheme: scheme, host: host, path: '/api/fonts/add_custom_font/');


  // shops
  static Uri getZarinpalPlan = Uri(scheme: scheme, host: host, path: '/api/shop/get_zarinpal_plan/');
  static Uri getGooglePlayPlan = Uri(scheme: scheme, host: host, path: '/api/shop/get_googleplay_plan/');
  static Uri getAppstorePlan = Uri(scheme: scheme, host: host, path: '/api/shop/get_appstore_plan/');
  static Uri getGooglePlayCode = Uri(scheme: scheme, host: host, path: '/api/shop/get_googleplay_code/');
  static Uri getAppstoreCode = Uri(scheme: scheme, host: host, path: '/api/shop/get_appstore_code/');
  static Uri getZarinpalUrl = Uri(scheme: scheme, host: host, path: '/api/shop/get_zarinpal_url/');

}