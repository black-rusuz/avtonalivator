import 'package:flutter/material.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: красивый экран с выбором устройства
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(expandedHeight: 360.0),
        ],
      ),
    );
  }
}
