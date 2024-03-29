part of '../stats.dart';

class _StatsAppBar extends StatelessWidget {
  const _StatsAppBar();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.4;

    return SliverAppBar(
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.background,
      title: Text(Strings.stats, style: AppTheme.pageTitle),
      flexibleSpace: const FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 60),
            child: StatsCounter(liters: 0.92),
          ),
        ),
      ),
    );
  }
}
