part of '../scan.dart';

class ScanAppBar extends StatelessWidget {
  const ScanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: 60,
      expandedHeight: 260,
      title: Text(
        Strings.connection,
        style: AppTheme.pageTitle,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: const SizedBox(),
          // child: BlocBuilder<ScanCubit, ScanState>(
          //   buildWhen: ((prev, next) => next is ScanConnecting),
          //   builder: (context, state) {
          //     return BarmenCard(
          //       margin: const EdgeInsets.fromLTRB(30, 50, 30, 10),
          //       isConnecting: state is ScanConnecting,
          //     );
          //   },
          // ),
        ),
      ),
      actions: [
        StreamBuilder<bool>(
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
        )
      ],
    );
  }
}
