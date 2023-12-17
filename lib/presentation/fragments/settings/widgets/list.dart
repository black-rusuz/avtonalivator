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
        return SettingsCard(param: item);
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
        title: 'Подключаться автоматически',
        description:
            'Автоматически подключаться к последнему известному устройству',
        defaultValue: true,
      ),
      Param.stored(
        provider: provider,
        key: ParamKey.pumpsQuantity,
        title: 'Количество ингредиентов',
        defaultValue: 6,
      ),
      Param.action(
        title: 'Калибровка',
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
