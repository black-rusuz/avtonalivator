import 'package:flutter/cupertino.dart';

import '../../../../core/theme.dart';
import '../../../assets_image.dart';
import '../../../utils.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';

// TODO: брать с бека
const _recommended = ['hc05, hc-05', 'hc', '05'];

class DeviceCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const DeviceCard({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  bool get recommended => _recommended.any(title.has);

  bool get singleLine => subtitle?.isNotEmpty != true;

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      onTap: onTap,
      color: AppTheme.background,
      padding: AppTheme.padding,
      child: SizedBox(
        height: 46,
        child: Row(
          children: [
            if (recommended) ...[
              BasicImage(
                AssetsIcon.barmen_grey.path,
                height: 46,
                width: 46,
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: singleLine
                  ? Text(title)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: AppTheme.text,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle!,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: AppTheme.textLight.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
            ),
            const SizedBox(width: 16),
            const Icon(CupertinoIcons.bluetooth)
          ],
        ),
      ),
    );
  }
}
