import 'package:linger/models/data/repo.dart';

import 'mock_data.dart';
import 'prod_data.dart';

enum RepoType { MOCK, PROD }

class Injector {
  static final Injector _singleton = Injector._internal();
  Injector._internal();

  static RepoType _type;

  static void configure(RepoType repoType) {
    _type = repoType;
  }

  factory Injector() {
    return _singleton;
  }

  Repo get repo {
    switch(_type){
      case RepoType.MOCK:
        return MockRepo();
      // case RepoType.PROD:
      default:
        return ProdRepo();
    }
  }
}