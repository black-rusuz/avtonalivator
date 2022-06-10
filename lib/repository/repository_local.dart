import 'dart:math';

import '../model/cocktail_model.dart';
import 'repository.dart';

class RepositoryLocal extends Repository {
  @override
  Future<List<CocktailModel>> getCocktails() async {
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
        id: 2,
        name: 'Джин тоник',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Джин',
        drinkB: 'Тоник',
        volumeA: 50,
        volumeB: 150,
      ),
      CocktailModel(
        id: 3,
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
        id: 4,
        name: 'Дайкири',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Белый ром',
        drinkB: 'Лаймовый сок',
        volumeB: 60,
        volumeC: 30,
      ),
      CocktailModel(
        id: 5,
        name: 'Голубая лагуна',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Водка',
        drinkB: 'Ликер',
        drinkC: 'Спрайт',
        volumeA: 50,
        volumeB: 20,
        volumeC: 150,
      ),
      CocktailModel(
        id: 6,
        name: 'Б-52',
        imageUrl: 'https://source.unsplash.com/random/{${Random().nextInt(99)}',
        drinkA: 'Водка',
        drinkB: 'Ликер',
        drinkC: 'Спрайт',
        drinkD: 'Водка',
        drinkE: 'Ликер',
        drinkF: 'Спрайт',
        volumeA: 50,
        volumeB: 20,
        volumeC: 150,
        volumeD: 50,
        volumeE: 20,
        volumeF: 150,
      ),
      CocktailModel(
          id: 7,
          name: 'Манхэттен',
          imageUrl:
              'https://source.unsplash.com/random/{${Random().nextInt(99)}',
          drinkA: 'Водка',
          drinkB: 'Ликер',
          drinkC: 'Спрайт',
          drinkD: 'Водка',
          drinkE: 'Ликер',
          drinkF: 'Спрайт',
          volumeA: 50,
          volumeB: 20,
          volumeC: 150,
          volumeD: 50,
          volumeE: 20,
          volumeF: 150,
          description: 'Добавить лёд 130гр.'),
    ];
  }
}
