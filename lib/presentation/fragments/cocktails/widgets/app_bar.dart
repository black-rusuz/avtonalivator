part of '../cocktails.dart';

class _CocktailsAppBar extends StatelessWidget {
  final Widget? background;
  final ValueChanged<String>? search;

  const _CocktailsAppBar({this.search, this.background});

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final height = query.size.height * 0.4;

    return SliverAppBar(
      pinned: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: AppTheme.background,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: AppTheme.borderRadius,
        ),
        child: Text(
          Strings.cocktails,
          style: AppTheme.pageTitle,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            if (background != null) Positioned.fill(child: background!),
          ],
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
