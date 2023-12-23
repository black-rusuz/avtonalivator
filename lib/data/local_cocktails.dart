import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/logger.dart';
import 'model/cocktail.dart';

@injectable
class LocalCocktails {
  static const _fileName = 'cocktails';

  const LocalCocktails();

  Future<List<ApiCocktail>> getCocktails() async {
    final file = await _getFile();
    final data = await file.readAsString();

    try {
      final json = jsonDecode(data);
      final list = json[_fileName] as List;

      final result =
          list.cast<Map<String, dynamic>>().map(ApiCocktail.fromJson).toList();
      return result;
    } catch (e) {
      Logger.log(e);
      return [];
    }
  }

  Future<void> saveCocktail(ApiCocktail cocktail) async {
    final cocktails = await getCocktails();
    cocktails.add(cocktail);
    return _write(cocktails);
  }

  Future<void> deleteCocktail(ApiCocktail cocktail) async {
    final cocktails = await getCocktails();
    cocktails.removeWhere((c) => c.id == cocktail.id);
    return _write(cocktails);
  }

  Future<File> _getFile() async {
    final directory = await getApplicationCacheDirectory();
    final file = File('${directory.path}/$_fileName');

    final exists = await file.exists();
    if (!exists) await file.create();
    return file;
  }

  Future<void> _write(List<ApiCocktail> cocktails) async {
    final file = await _getFile();
    final json = {_fileName: cocktails};
    final data = jsonEncode(json);
    await file.writeAsString(data);
  }
}
