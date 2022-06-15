part of 'cocktails_cubit.dart';

abstract class CocktailsState extends Equatable {
  const CocktailsState();

  @override
  List<Object> get props => [];
}

class CocktailsInitial extends CocktailsState {}

class CocktailsFetched extends CocktailsState {
  final List<CocktailModel> cocktails;

  const CocktailsFetched({required this.cocktails});

  @override
  List<Object> get props => [cocktails];
}
