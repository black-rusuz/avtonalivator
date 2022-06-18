import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/connect/connect_cubit.dart';
import '../../../model/cocktail_model.dart';
import '../common/base_divider.dart';
import 'cocktail_detail.dart';

class CocktailsListItem extends StatelessWidget {
  final CocktailModel cocktail;

  const CocktailsListItem({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  void showCocktailModal(BuildContext context) {
    ConnectCubit cubit = BlocProvider.of<ConnectCubit>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.8,
        child: CocktailDetail(cocktail: cocktail, connectCubit: cubit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseDivider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 20,
          ),
          leading: Center(
            widthFactor: 1,
            child: CachedNetworkImage(
              fadeInCurve: Curves.easeInSine,
              fadeOutCurve: Curves.easeOutSine,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
              imageUrl: cocktail.imageUrl ?? '',
              placeholder: (_, __) => const Icon(Icons.liquor_rounded),
              imageBuilder: (_, img) => CircleAvatar(foregroundImage: img),
            ),
          ),
          title: Text(cocktail.name),
          onTap: () => showCocktailModal(context),
        ),
        const BaseDivider(),
      ],
    );
  }
}
