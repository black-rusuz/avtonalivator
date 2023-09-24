part of '../scan.dart';

class ScanAppBar extends StatelessWidget {
  final double height;
  final bool isConnecting;

  const ScanAppBar({
    super.key,
    required this.height,
    required this.isConnecting,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      backgroundColor: AppTheme.accent,
      title: Text(Strings.connection, style: AppTheme.pageTitle),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: BarmenCard(isConnecting: isConnecting),
          ),
        ),
      ),
      actions: [
        StreamBuilder<bool>(
          stream: context.read<ScanCubit>().isDiscovering,
          initialData: false,
          builder: (_, snapshot) => Center(
            child: snapshot.data != true
                ? null
                : Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 16),
                    child: const CircularProgressIndicator(
                      color: AppTheme.black,
                      strokeWidth: 3,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
