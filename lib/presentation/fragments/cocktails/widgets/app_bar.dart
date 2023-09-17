part of '../cocktails.dart';

class _CocktailsAppBar extends StatelessWidget {
  final ValueChanged<String>? search;

  const _CocktailsAppBar({this.search});

  @override
  Widget build(BuildContext context) {
    const height = kToolbarHeight + SearchField.height;
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: topPadding + 13),
          child: const Text(
            Strings.cocktails,
            textAlign: TextAlign.center,
            style: AppTheme.pageTitle,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SearchField(onChanged: search),
      ),
    );
  }
}
