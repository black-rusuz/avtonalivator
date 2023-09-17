part of '../cocktails.dart';

class _CocktailsAppBar extends StatelessWidget {
  final ValueChanged<String>? search;

  const _CocktailsAppBar({this.search});

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final height = query.size.height * 0.4;
    // const height = kToolbarHeight + SearchField.height;
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.background,
      // TODO: фон
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
        /// Подобрал рандомное значение без оверфлоу
        preferredSize: const Size.fromHeight(22),
        child: SearchField(onChanged: search),
      ),
    );
  }
}
