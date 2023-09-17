part of '../settings.dart';

class _SettingsAppBar extends StatelessWidget {
  const _SettingsAppBar();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.4;

    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.background,
      title: Text(Strings.settings, style: AppTheme.pageTitle),
      // TODO: фон
      flexibleSpace: const FlexibleSpaceBar(),
    );
  }
}
