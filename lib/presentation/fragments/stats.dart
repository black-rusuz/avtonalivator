import 'package:flutter/cupertino.dart';

import '../strings.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Strings.stats),
    );
  }
}
