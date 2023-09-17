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
    return BasicSliverBar(
      color: AppTheme.accent,
      maxHeight: height,
      title: const Text(Strings.connection, style: AppTheme.pageTitle),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BarmenCard(isConnecting: isConnecting),
      ),
      trailing: StreamBuilder<bool>(
        stream: context.read<ScanCubit>().isDiscovering,
        initialData: false,
        builder: (_, snapshot) => Center(
          child: snapshot.data != true
              ? null
              : Center(
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.all(12),
                    child: const CircularProgressIndicator(
                      color: AppTheme.black,
                      strokeWidth: 3,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
