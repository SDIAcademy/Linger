import 'dart:async';

import 'package:http/http.dart' as http;

abstract class Repo{
  Future<List> fetchData(http.Client client);
}