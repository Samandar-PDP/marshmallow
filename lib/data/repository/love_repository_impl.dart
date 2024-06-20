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
      final number = await apiService.getLoveRandom();
      return LoveRandom(random: number[0]);
    //   final response = await http.get(Uri.parse("https://www.randomnumberapi.com/api/v1.0/random?min=0&max=100"));
    //   final number = response.body as List<int>;
    //   final number = Random().nextInt(100);
    //    return LoveRandom(random: number);
    } catch(e) {
      debugPrint("@@@$e");
      return null;
    }
  }
}