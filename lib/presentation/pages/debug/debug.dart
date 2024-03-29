import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../data/connection/fbs_adapter.dart';
import '../../../domain/storage/commands.dart';
import '../../../injection.dart';
import '../../widgets/basic_card.dart';

const _maxLines = 32;
const double _gap = 8;
const double _commandSize = 12;

final _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
);

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final adapter = get<FbsAdapter>();
  final commands = get<CommandsBox>();

  final logController = TextEditingController();
  final sendController = TextEditingController();

  final data = [];

  void sendCommand() {
    final text = sendController.text;
    final list = utf8.encode(text);
    final bytes = Uint8List.fromList(list);
    adapter.send(bytes).then((_) => data.add(text));
  }

  void saveCommand() {
    setState(() {
      commands.save(sendController.text);
    });
  }

  void setCommand(String command) {
    sendController.text = command;
  }

  void deleteCommand(String command) {
    setState(() {
      commands.delete(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    final commands = this.commands.all;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppRoutes.debug),
      ),
      body: Padding(
        padding: AppTheme.padding / 3,
        child: StreamBuilder<String>(
          stream: adapter.input.map(utf8.decode),
          builder: builder,
        ),
      ),
      bottomSheet: Ink(
        color: Color.lerp(AppTheme.background, AppTheme.accent, 0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (commands.isNotEmpty)
              SizedBox(
                height: _gap * 3 + _commandSize,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(_gap).copyWith(bottom: 0),
                  itemCount: commands.length,
                  itemBuilder: commandBuilder,
                  separatorBuilder: separatorBuilder,
                ),
              ),
            Padding(
              padding: AppTheme.padding,
              child: TextField(
                controller: sendController,
                onEditingComplete: sendCommand,
                decoration: InputDecoration(
                  icon: IconButton(
                    onPressed: saveCommand,
                    icon: const Icon(Icons.save_rounded),
                  ),
                  suffixIcon: IconButton(
                    onPressed: sendCommand,
                    icon: const Icon(Icons.send_outlined),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot<String> snapshot) {
    setData(snapshot.data);
    return TextField(
      readOnly: true,
      minLines: _maxLines,
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
        enabledBorder: _border,
        focusedBorder: _border,
      ),
    );
  }

  void setData(String? snapshot) {
    if (snapshot == null) return;
    data.add(snapshot);

    if (data.length > _maxLines) data.removeAt(0);
    final text = data.join('\n');

    // TODO скролл не работает, надо сделать 400 строк
    logController.text = text;
    logController.selection = TextSelection.collapsed(offset: text.length);
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(width: 8);
  }

  Widget commandBuilder(BuildContext context, int index) {
    final command = commands.all[index];
    return GestureDetector(
      onLongPress: () => deleteCommand(command),
      child: BasicCard(
        onTap: () => setCommand(command),
        color: AppTheme.accent,
        padding: const EdgeInsets.all(_gap),
        child: Text(
          command,
          style: const TextStyle(fontSize: _commandSize, height: 1),
        ),
      ),
    );
  }
}
