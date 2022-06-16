part of 'cocktails_cubit.dart';

abstract class CocktailsState extends Equatable {
  final bool filtered;

  const CocktailsState(this.filtered);

  @override
  List<Object> get props => [];
}

class CocktailsInitial extends CocktailsState {
  const CocktailsInitial([bool? filtered]) : super(filtered ?? false);
}

class CocktailsFetched extends CocktailsState {
  final List<CocktailModel> cocktails;

  const CocktailsFetched({
    required this.cocktails,
    bool? filtered,
  }) : super(filtered ?? false);

  @override
  List<Object> get props => [cocktails];
}
