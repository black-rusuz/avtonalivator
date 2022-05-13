import 'package:flutter/material.dart';

class ConnectionPage extends StatelessWidget {
  ConnectionPage({Key? key}) : super(key: key);

  final devs = [
    'Yandex.Mini',
    'JBL E40BT',
    'Razer Barracuda X',
    'Avtobarmen',
    'Yandex.Mini',
    'JBL E40BT',
    'Razer Barracuda X',
    'Avtobarmen',
    'Yandex.Mini',
    'JBL E40BT',
    'Razer Barracuda X',
    'Avtobarmen',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: красивый экран с выбором устройства
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Подключение'),
            pinned: true,
            collapsedHeight: 60,
            expandedHeight: 360,
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              devs.map((e) => DeviceItem(title: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceItem extends StatelessWidget {
  final String title;
  final String? subtitle;

  const DeviceItem({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const Center(child: Icon(Icons.device_unknown), widthFactor: 1),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.connect_without_contact),
    );
  }
}
