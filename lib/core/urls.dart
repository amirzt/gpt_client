
class GlobalURL{

  static const String host = '193.36.84.224';
  // static const String host = 'addstory.website';

  static const String scheme = 'http';
  static const int port = 8001;



  // user
  static Uri loginUri = Uri(scheme: scheme,port: port, host: host, path: '/api/users/login/');
  static Uri splashUri = Uri(scheme: scheme,port: port, host: host, path: '/api/users/splash/');

  // support
  static Uri getInstagram = Uri(scheme: scheme,port: port, host: host, path: '/api/support/get_instagram/');
  static Uri getEmail = Uri(scheme: scheme, port: port,host: host, path: '/api/support/get_email/');
  static Uri getTelegram = Uri(scheme: scheme,port: port, host: host, path: '/api/support/get_telegram/');

  // shops
  static Uri getZarinpalPlan = Uri(scheme: scheme, port: port,host: host, path: '/api/shop/get_zarinpal_plan/');
  static Uri getGooglePlayPlan = Uri(scheme: scheme,port: port, host: host, path: '/api/shop/get_googleplay_plan/');
  static Uri getAppstorePlan = Uri(scheme: scheme, port: port,host: host, path: '/api/shop/get_appstore_plan/');
  static Uri getGooglePlayCode = Uri(scheme: scheme,port: port, host: host, path: '/api/shop/get_googleplay_code/');
  static Uri getAppstoreCode = Uri(scheme: scheme,port: port, host: host, path: '/api/shop/get_appstore_code/');
  static Uri getZarinpalUrl = Uri(scheme: scheme,port: port, host: host, path: '/api/shop/get_zarinpal_url/');

  // conversation
  static Uri createConversation = Uri(scheme: scheme,port: port, host: host, path: '/api/conversation/create_conversation/');
  static Uri getConversation = Uri(scheme: scheme, port: port,host: host, path: '/api/conversation/get_conversation/');
  static Uri updateConversation = Uri(scheme: scheme,port: port, host: host, path: '/api/conversation/update_conversation/');
  static Uri deleteConversation = Uri(scheme: scheme,port: port, host: host, path: '/api/conversation/delete_conversation/');
  static Uri addMessage = Uri(scheme: scheme, port: port,host: host, path: '/api/conversation/add_message/');
  static Uri getMessage = Uri(scheme: scheme, port: port,host: host, path: '/api/conversation/get_message/');
  static Uri updateMessage = Uri(scheme: scheme, port: port,host: host, path: '/api/conversation/update_message/');

  // items
  static Uri getItems = Uri(scheme: scheme,port: port, host: host, path: '/api/items/get_items/');
  static Uri getCategories = Uri(scheme: scheme,port: port, host: host, path: '/api/items/get_categories/');
}