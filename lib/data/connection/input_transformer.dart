import 'dart:async';
import 'dart:typed_data';

// ignore_for_file: unused_element

const _cr = 10;
const _lf = 13;

final inputTransformer = InputTransformer();

/// Находит среди байтов перенос строки и выдаёт массивы строк
class InputTransformer extends StreamTransformerBase<Uint8List, Uint8List> {
  final collector = <int>[];

  @override
  Stream<Uint8List> bind(Stream<Uint8List> stream) async* {
    await for (final bytes in stream) {
      for (final byte in bytes) {
        if (byte == _cr) {
          yield Uint8List.fromList(collector);
          collector.clear();
        } else {
          collector.add(byte);
        }
      }
    }
  }
}
