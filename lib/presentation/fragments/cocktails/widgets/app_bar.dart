part of '../cocktails.dart';

class _CocktailsAppBar extends StatelessWidget {
  final ValueChanged<String>? search;

  const _CocktailsAppBar({this.search});

  @override
  Widget build(BuildContext context) {
    const height = kToolbarHeight + SearchField.height;

    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.white,
      title: const Text(Strings.cocktails, style: AppTheme.pageTitle),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SearchField(onChanged: search),
      ),
    );
  }
}
