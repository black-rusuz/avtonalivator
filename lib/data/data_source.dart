import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'model/cocktail.dart';
import 'model/config.dart';

const _host = 'avtonalivator.ru';

const _cocktailsPath = '/catalog/json/cocktails.json';
const _configPath = '/catalog/json/config.json';

typedef Json = Map<String, dynamic>;

@injectable
class DataSource {
  final Dio _dio;

  DataSource(this._dio);

  final _baseUri = Uri(scheme: 'https', host: _host);

  Future<List<ApiCocktail>> getCocktails() async {
    final uri = _baseUri.replace(path: _cocktailsPath);
    final response = await _get(uri);
    final data = response.data;

    List<ApiCocktail> result = [];
    try {
      final list = data['data'];
      result = list.map((e) => ApiCocktail.fromJson(e)).toList();
    } catch (_) {
      // TODO: log
    }
    return result;
  }

  Future<ApiConfig> getConfig() async {
    final uri = _baseUri.replace(path: _configPath);
    final response = await _get(uri);
    final data = response.data;

    ApiConfig result = const ApiConfig();
    if (data is Json) result = ApiConfig.fromJson(data);
    return result;
  }

  // * Private

  Future<Response> _get(Uri uri) async {
    final response = await _dio.getUri(uri);
    return response;
  }
}
