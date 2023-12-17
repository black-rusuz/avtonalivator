part of '../settings.dart';

class _SettingsList extends StatelessWidget {
  const _SettingsList();

  @override
  Widget build(BuildContext context) {
    final params = _Params(context).list;

    return ListView.separated(
      shrinkWrap: true,
      controller: PrimaryScrollController.maybeOf(context),
      padding: AppTheme.listPadding,
      itemCount: params.length,
      itemBuilder: (context, index) {
        final item = params[index];
        return SettingsCard.fromParam(item);
      },
      separatorBuilder: separatorBuilder,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}

class _Params {
  final BuildContext context;
  late final List<Param> list;

  _Params(this.context) {
    final provider = context.watch<SettingsProvider>();

    list = [
      Param.stored(
        provider: provider,
        key: ParamKey.autoConnect,
        title: Strings.autoConnectTitle,
        description: Strings.autoConnectDescription,
        defaultValue: true,
      ),
      Param.stored(
        provider: provider,
        key: ParamKey.pumpsQuantity,
        title: Strings.pumpsQuantityTitle,
        defaultValue: 6,
        onChanged: (v) => context.read<TuningProvider>().generatePumps(v),
      ),
      Param.tap(
        title: Strings.calibrateTitle,
        onTap: calibrate,
      ),
    ];
  }

  void calibrate() {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text('Title'),
        );
      },
    );
  }
}
