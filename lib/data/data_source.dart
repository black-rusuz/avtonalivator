import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'model/cocktail.dart';
import 'model/config.dart';

const _host = 'avtonalivator.ru';

const _config = '/catalog/json/config.json';
const _cocktails = '/catalog/json/cocktails.json';

typedef Json = Map<String, dynamic>;

@injectable
class DataSource {
  final Dio _dio;

  DataSource(this._dio);

  final _baseUri = Uri(scheme: 'https', host: _host);

  Future<ApiConfig> getConfig() async {
    final uri = _baseUri.replace(path: _config);
    final response = await _get(uri);
    final data = response.data;

    ApiConfig result = const ApiConfig();
    if (data is Json) result = ApiConfig.fromJson(data);
    return result;
  }

  Future<List<ApiCocktail>> getCocktails() async {
    final uri = _baseUri.replace(path: _cocktails);
    final response = await _get(uri);
    final data = response.data;

    final list = data['data'];
    final result =
        list.map<ApiCocktail>((e) => ApiCocktail.fromJson(e)).toList();
    return result;
  }

  // * Private

  Future<Response> _get(Uri uri) async {
    final response = await _dio.getUri(uri);
    return response;
  }
}
