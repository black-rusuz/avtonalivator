import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/lightning_mode.dart';
import '../../../pages/home/connection_provider.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';

class LightningDialog extends StatelessWidget {
  const LightningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.lightningMode),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: LightingMode.values.map((e) => _ModeItem(e)).toList(),
        ),
      ),
    );
  }
}

class _ModeItem extends StatelessWidget {
  final LightingMode mode;

  const _ModeItem(this.mode);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConnectionProvider>();
    // TODO: LightningMode strings
    final title = mode.name;

    return BasicCard(
      onTap: () => provider.setLightningMode(mode),
      color: AppTheme.background,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(title),
    );
  }
}
