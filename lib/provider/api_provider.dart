
import 'package:gpt/provider/token.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id_v3/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/urls.dart';
import '../data/models/plan_model.dart';
import '../services/global_services.dart';

class ApiProvider {
  void splash() async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().postRequestMapReturn(
        token,
        GlobalURL.splashUri,
        {});
    if(response.containsKey('expired')){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('expired', response['expired']);
      prefs.setString('username', response['username']);
    }else{
      login();
    }
  }

  Future<bool> login() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    
    // String deviceId = '';
    Map response = await GlobalService()
        .login(GlobalURL.loginUri, {
          'device_id': deviceId.toString(),
          'package_name': packageName
        });
    if(response.containsKey('token')){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Token', response['token']);
      prefs.setBool('expired', response['expired']);
      prefs.setString('username', response['username']);
      prefs.setBool('yearly', response['yearly']);
      List admob = response['admob'];
      for(var i=0 ; i<admob.length ; i++){
        prefs.setString(admob[i]['type'], admob[i]['code']);
      }
      return true;
    }else{
      return false;
    }
  }

  Future<Map> getString(Uri uri) async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().getRequestMapReturn(token, uri);
    return response;
  }

  Future<List<Plan>> getPlans(Uri uri, Map body) async{
    List<Plan> plans = [];
    String token = await TokenService().getToken();
    List response = await GlobalService().postRequestListReturn(token, uri, body);
    for(var i=0 ; i<response.length ; i++){
      plans.add(Plan.fromJson(response[i]));
    }
    return plans;
  }

  Future<String> getZarinpalUrl(int plan) async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().postRequestMapReturnAuth(
        token,
        GlobalURL.getZarinpalUrl,
        {'plan': plan.toString()});
    return response['purchase_url'];
  }

  Future<String> getInstagram() async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().getRequestMapReturn(
        token,
        GlobalURL.getInstagram);
    return response['url'];
  }

  Future<String> getEmail() async{
    String token = await TokenService().getToken();
    Map response = await GlobalService().getRequestMapReturn(
        token,
        GlobalURL.getEmail);
    return response['email'];
  }

}
