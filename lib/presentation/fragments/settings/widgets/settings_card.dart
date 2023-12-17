import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/param.dart';
import '../../../widgets/basic_card.dart';

class SettingsCard<T> extends StatelessWidget {
  final Param<T> param;

  const SettingsCard({
    super.key,
    required this.param,
  });

  void setValue(BuildContext context, T newValue) {
    // TODO: setter
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      padding: AppTheme.padding,
      color: AppTheme.background,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(param.title),
                if (param.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    param.description!,
                    style: AppTheme.additional,
                  ),
                ],
                if (param.value is num) ...[
                  const SizedBox(height: 8),
                  _ParamValue<T>.long(
                    param.value,
                    (v) => setValue(context, v),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          _ParamValue<T>.short(
            param.value,
            (v) => setValue(context, v),
          ),
        ],
      ),
    );
  }
}

class _ParamValue<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T> setValue;
  final bool _isShort;

  const _ParamValue.short(this.value, this.setValue) : _isShort = true;

  const _ParamValue.long(this.value, this.setValue) : _isShort = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: _isShort ? shortType : _longType);
  }

  Widget shortType(BuildContext context) {
    if (value is bool) {
      return Checkbox(
        value: value as bool,
        onChanged: (v) => setValue((v ?? false) as T),
      );
    }
    return Text(value.toString());
  }

  Widget _longType(BuildContext context) {
    if (value is num) {
      return Slider(
        min: 0,
        max: 12,
        value: (value as num).toDouble(),
        onChanged: (v) => setValue(v.round() as T),
      );
    }
    return const SizedBox();
  }
}
