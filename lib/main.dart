import 'package:avtonalivator/presentation/connection/connection_page.dart';
import 'package:avtonalivator/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isAvailable;
  bool? isEnabled;

  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.isAvailable
        .then((value) => setState(() => isAvailable = value ?? false));
    requestEnable();
  }

  void requestEnable() {
    FlutterBluetoothSerial.instance
        .requestEnable()
        .then((value) => setState(() => isEnabled = value ?? false));
  }

  @override
  Widget build(BuildContext context) {
    return isAvailable == null || isEnabled == null
        ? SimpleApp(center: const CircularProgressIndicator())
        : !isAvailable!
            ? SimpleApp(
                center: const Text('Bluetooth is not supported by your device'))
            : !isEnabled!
                ? SimpleApp(
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Bluetooth is not enabled.'),
                        TextButton(
                            onPressed: requestEnable,
                            child: const Text('Enable Bluetooth')),
                      ],
                    ),
                  )
                : MaterialApp(
                    title: 'Автобармен',
                    theme: ThemeData(primarySwatch: Colors.green),
                    initialRoute: '/',
                    routes: {
                      '/': (_) => ConnectionPage(),
                      '/home': (_) => const HomePage(),
                    },
                  );
  }
}

class SimpleApp extends MaterialApp {
  final Widget center;

  SimpleApp({Key? key, required this.center})
      : super(
          key: key,
          title: 'Автобармен',
          theme: ThemeData(primarySwatch: Colors.green),
          home: Scaffold(body: Center(child: center)),
        );
}
