import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class GlobalService{

  Future<List> getRequestListReturn(String? token, Uri uri) async{
    final response =  await http.get(
        uri,
        // headers: {
        //   HttpHeaders.authorizationHeader : token.toString()
        // }
    );
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<List> getRequestListReturnAuth(String? token, Uri uri) async{
    final response =  await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader : token.toString()
      }
    );
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<Map> getRequestMapReturn(String? token, Uri uri) async{
    final response = await http.get(
      uri,
      // headers: {
      //   HttpHeaders.authorizationHeader: token.toString(),
      // },
    );

    return json.decode(utf8.decode(response.bodyBytes));
  }


  Future<Map> postRequestMapReturn(String? token, Uri uri, Map body) async{
    final response = await http.post(
        uri,
        // headers: {
        //   HttpHeaders.authorizationHeader: token.toString(),
        // },
        body: body
    );

    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<Map> postRequestMapReturnAuth(String? token, Uri uri, Map body) async{
    final response = await http.post(
        uri,
        headers: {
          HttpHeaders.authorizationHeader: token.toString(),
        },
        body: body
    );

    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<List> postRequestListReturn(String? token, Uri uri, Map body) async{
    final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          // HttpHeaders.authorizationHeader: token.toString()
        },
        body: jsonEncode(body)
    );

    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<int> postRequestIntReturn(String? token, Uri uri, Map body) async{
    final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: token.toString()
        },
        body: jsonEncode(body)
    );

    return response.statusCode;
  }

  Future<Map> login(Uri uri, Map body) async {
    final response = await http.post(
        uri,
        // headers: {
        //   HttpHeaders.authorizationHeader: token.toString(),
        // },
        body: body
    );
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<int> addCustomFont(String filepath, Uri uri, String token) async {
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', filepath));
    // request.fields.addAll(body);
    request.headers.addAll({HttpHeaders.authorizationHeader: token.toString()});
    var response = await request.send();
    return response.statusCode;
  }

  Future<Uint8List> downloadAndConvertImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.bodyBytes);
      } else {
        throw Exception('Failed to download image');
      }
    } catch (e) {
      // print('Error: $e');
      rethrow;
    }
  }

  static Future<bool> isUserInIran() async {
    final response = await http.get(Uri.parse('https://ipinfo.io/json'));
    if (response.statusCode == 403) {
      return true;
    } else {
      return false;
    }
  }


}