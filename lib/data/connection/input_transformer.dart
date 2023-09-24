import 'dart:async';
import 'dart:typed_data';

// ignore_for_file: unused_element

const _cr = 10;
const _lf = 13;

/// Находит среди байтов перенос строки и выдаёт массивы строк
class InputTransformer extends StreamTransformerBase<int, Uint8List> {
  @override
  Stream<Uint8List> bind(Stream<int> stream) async* {
    final collector = <int>[];

    await for (final byte in stream) {
      if (byte == _cr) {
        yield Uint8List.fromList(collector);
        collector.clear();
      } else {
        collector.add(byte);
      }
    }
  }
}
