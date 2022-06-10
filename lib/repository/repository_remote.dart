import 'package:dio/dio.dart';

import '../model/cocktail_model.dart';
import 'repository.dart';

class RepositoryRemote extends Repository {
  @override
  Future<List<CocktailModel>> getCocktails() async {
    Dio dio = Dio();
    // Response response = await dio.get('192.168.1.103/api/cocktails');
    Response response =
        await dio.get('http://avtobarmen.choodoo.team/api/cocktails');
    return response.statusCode == 200
        ? response.data as List<CocktailModel>
        : [];
  }
}
