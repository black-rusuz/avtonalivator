part of 'stats_cubit.dart';

abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object> get props => [];
}

class StatsInitial extends StatsState {}

class StatsValues extends StatsState {
  final double liters;
  final Map<CocktailModel, int> cocktailsCounts;
  final Map<CocktailModel, int> cocktailsDays;

  const StatsValues({
    required this.liters,
    required this.cocktailsCounts,
    required this.cocktailsDays,
  });

  @override
  List<Object> get props => [liters, cocktailsCounts, cocktailsDays];
}
