import 'dart:math';

import '../model/cocktail_model.dart';
import 'repository.dart';

class RepositoryLocal extends Repository {
  @override
  List<CocktailModel> get cocktails {
    return [
      CocktailModel(
        id: 1,
        name: 'Белый русский',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Водка',
        drinkB: 'Кофейный ликёр',
        drinkC: 'Нежирные сливки',
        volumeA: 30,
        volumeB: 30,
        volumeC: 30,
      ),
      CocktailModel(
        id: 1,
        name: 'Джин тоник',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Джин',
        drinkB: 'Тоник',
        volumeA: 50,
        volumeB: 150,
      ),
      CocktailModel(
        id: 1,
        name: 'Кровавая Мэри',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Водка',
        drinkB: 'Томатный сок',
        drinkC: 'Лимонный сок',
        volumeA: 50,
        volumeB: 120,
        volumeC: 10,
      ),
      CocktailModel(
        id: 1,
        name: 'Дайкири',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Белый ром',
        drinkB: 'Лаймовый сок',
        volumeB: 60,
        volumeC: 30,
      ),
      CocktailModel(
        id: 1,
        name: 'Голубая лагуна',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Водка',
        drinkB: 'Ликер',
        drinkC: 'Спрайт',
        volumeA: 50,
        volumeB: 20,
        volumeC: 150,
      ),
    ];
  }
}
