import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class HomePage extends StatelessWidget {
  final BluetoothConnection connection;

  const HomePage({Key? key, required this.connection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: красивый домашний экран
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            String text = "nudes";
            text = text.trim();
            connection.output.add(Uint8List.fromList(utf8.encode(text + "\r")));
            await connection.output.allSent;
          },
          child: Text("Send nudes"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Напитки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/home');
              break;
          }
        },
      ),
    );
  }
}
