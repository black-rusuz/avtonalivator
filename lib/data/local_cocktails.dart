import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import 'model/cocktail.dart';

@singleton
class LocalCocktails {
  static const _fileName = 'cocktails';

  LocalCocktails() {
    _getCocktails().then(stream.add);
  }

  final stream = BehaviorSubject<List<ApiCocktail>>();

  Future<void> saveCocktail(ApiCocktail cocktail) async {
    final file = await _getFile();
    final cocktails = await _getCocktails();

    cocktails.add(cocktail);
    stream.add(cocktails);

    final json = {_fileName: cocktails};
    final data = jsonEncode(json);
    await file.writeAsString(data);
  }

  Future<File> _getFile() async {
    final directory = await getApplicationCacheDirectory();
    final file = File('${directory.path}/$_fileName');

    final exists = await file.exists();
    if (!exists) await file.create();
    return file;
  }

  Future<List<ApiCocktail>> _getCocktails() async {
    final file = await _getFile();
    final data = await file.readAsString();

    final json = jsonDecode(data);
    final list = json[_fileName];

    final result = list.map((e) => ApiCocktail.fromJson(e)).toList();
    return result;
  }
}
