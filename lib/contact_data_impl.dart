import 'dart:async';
import 'dart:convert';

// http请求框架
import 'package:http/http.dart' as http;

import 'contact_data.dart';

class RandomUserRepository implements ContactRepository {
  // 请求地址
  static const _kRandomUserUrl = 'http://api.randomuser.me/?results=15';
  final _jsonDecoder = const JsonDecoder();

  @override
  Future<List<Contact>> fetch() async {
    var response = await http.get(_kRandomUserUrl as Uri);
    var jsonBody = response.body;
    var statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300) {
      throw FetchException(
          "Error while getting contacts. status:$statusCode, Error:${response.reasonPhrase}");
    }

    final container = _jsonDecoder.convert(jsonBody);
    final List contactItems = container['results'];
    return contactItems
        .map((contactItem) => Contact.fromMap(contactItem))
        .toList();
  }
}
