import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../data/connection/fbs_adapter.dart';
import '../../../injection.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final adapter = get<FbsAdapter>();
  final logController = TextEditingController();
  final sendController = TextEditingController();
  final data = [];

  void sendCommand() {
    final text = sendController.text;
    data.add(text);

    final list = utf8.encode(text);
    final bytes = Uint8List.fromList(list);
    adapter.send(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppRoutes.debug),
      ),
      body: Ink(
        height: 382,
        padding: AppTheme.padding / 3,
        child: StreamBuilder<String>(
          stream: adapter.input.map(utf8.decode),
          builder: builder,
        ),
      ),
      bottomSheet: Padding(
        padding: AppTheme.padding,
        child: TextField(
          controller: sendController,
          onEditingComplete: sendCommand,
        ),
      ),
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot<String> snapshot) {
    setData(snapshot.data);
    return TextField(
      readOnly: true,
      minLines: 33,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: logController,
      style: GoogleFonts.sourceCodePro(
        fontSize: 7,
        color: const Color(0xFF00C89C),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1E1F22),
        contentPadding: const EdgeInsets.all(4),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  void setData(String? snapshot) {
    if (snapshot == null) return;
    data.add(snapshot);

    if (data.length >= 34) data.removeAt(0);
    final text = data.join('\n');

    // TODO скролл не работает, надо сделать 400 строк
    logController.text = text;
    logController.selection = TextSelection.collapsed(offset: text.length);
  }
}
