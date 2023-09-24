import 'dart:convert';

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
  final controller = TextEditingController();
  final data = [];

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
          stream: get<FbsAdapter>().input.map(utf8.decode),
          builder: builder,
        ),
      ),
      bottomSheet: const Padding(
        padding: AppTheme.padding,
        child: TextField(),
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
      controller: controller,
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
    // TODO 400
    if (data.length >= 34) data.removeAt(0);

    final text = data.join('\n');
    // TODO скролл не работает
    controller.text = text;
    controller.selection = TextSelection.collapsed(offset: text.length);
  }
}
