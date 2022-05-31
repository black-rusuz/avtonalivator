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
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Btn(connection, "a10"),
            Btn(connection, "b10"),
            Btn(connection, "c10"),
            Btn(connection, "d10"),
            Btn(connection, "e10"),
            Btn(connection, "f10"),
            Btn(connection, "y1"),
            Btn(connection, "z1"),
          ],
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

// TODO: Temp
class Btn extends StatelessWidget {
  final String text;
  final BluetoothConnection connection;

  const Btn(this.connection, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        connection.output.add(
          Uint8List.fromList(utf8.encode(text.trim() + "\r")),
        );
        await connection.output.allSent;
      },
      child: Text(text),
    );
  }
}
