import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:urfunavigator_mobile/utils/API/responses/audiences.dart';

class ApiFetcher {
  String host = "";
  static final ApiFetcher instance = ApiFetcher._();

  ApiFetcher._();

  factory ApiFetcher.host(String host) {
    instance.host = host;
    return instance;
  }

  static Future<http.Response> baseFetch(String address, String query) {
    final uri = Uri.https(
      instance.host,
      address
    );

    return http.post(
      uri, 
      headers: {
        HttpHeaders.authorizationHeader: 'JWT 4c2182c841eba6b8d0bd9fda',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: jsonEncode({
        'query': query
      })
    );
  }

  // static Future<http.Response> fetchGraph(String institute, int floor) {
  //   var query = 'query { Floors (where: { institute: {equals:"$institute"}, floor: {equals:$floor} }) { docs { graph { id x y links types names floor institute time menuId isPassFree stairId } } } }';
  //   return baseFetch('/api/graphql', query);
  // }

  static Future<MapObject> fetchAudiences(String institute, int floor) async {
    var query = 'query { Floors(where: { institute: { equals: "$institute" }, floor: { equals: $floor } }) { docs { width height audiences service } } }';
    final response = await baseFetch('/api/graphql', query);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data']['Floors']['docs'][0] as Map<String, dynamic>;
      return MapObject.fromJson(responseData);
    } else {
      throw Exception('Failed to execute reequest getchAudiences');
    }
  }
}