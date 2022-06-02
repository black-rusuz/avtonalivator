part of 'cocktails_bloc.dart';

abstract class CocktailsState extends Equatable {
  const CocktailsState();

  @override
  List<Object> get props => [];
}

class CocktailsInitialState extends CocktailsState {}

class CocktailsFetchedState extends CocktailsState {
  final List<CocktailModel> cocktails;

  const CocktailsFetchedState({required this.cocktails});

  @override
  List<Object> get props => [cocktails];
}
