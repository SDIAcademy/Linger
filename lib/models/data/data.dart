class Data {
  String name;
  Data({this.name});

  factory Data.fromJson(Map json) {
    return Data(name: json['name']);
  }
}
