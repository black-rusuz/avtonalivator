part of '../cocktails.dart';

class _CocktailsAppBar extends StatelessWidget {
  final Widget? background;
  final ValueChanged<String>? search;
  final TabController? controller;

  const _CocktailsAppBar({this.search, this.background, this.controller});

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final height = query.size.height * 0.4;

    return DefaultTabController(
      length: 3,
      child: SliverAppBar(
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
          /// Подобранное значение без оверфлоу
          preferredSize: const Size.fromHeight(59),
          child: Column(
            children: [
              SearchField(onChanged: search),
              TabBar(
                controller: controller,
                labelPadding: AppTheme.padding / 2,
                tabs: const [
                  Text(Strings.cocktails),
                  Text(Strings.favorite),
                  Text(Strings.myRecipe),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
