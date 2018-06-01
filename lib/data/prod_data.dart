import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:linger/data/data.dart';
import 'package:linger/data/repo.dart';

class ProdRepo implements Repo{
  static const URL = '';
  @override
  Future<List> fetchData(http.Client client) async {
    final response = 
        client.get(URL)
        .then((res) => res.body)
        .then(json.decode)
        .then((result) => result.map(
          (item) => Data.fromJson(item)
        ))
        .then((result) => result.toList());
    
    return response;
  }
}