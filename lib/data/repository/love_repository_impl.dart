import 'package:flutter/widgets.dart';
import 'package:marshmallow/data/network/api_service.dart';
import 'package:marshmallow/domain/repository/love_repository.dart';

import '../model/love_random.dart';

class LoveRepositoryImpl extends LoveRepository {
  final ApiService apiService;
  LoveRepositoryImpl(this.apiService); // dependency inversion

  @override
  Future<LoveRandom?> getRandom(String boyName, String girlName) async {
    try {
      return await apiService.getLoveRandom();
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
}