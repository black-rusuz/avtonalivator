import 'dart:async';
import 'dart:typed_data';

class InputTransformer extends StreamTransformerBase<int, Uint8List> {
  List<int> collector = [];

  @override
  Stream<Uint8List> bind(Stream<int> stream) async* {
    await for (final byte in stream) {
      if (byte == 10) {
        yield Uint8List.fromList(collector);
        collector.clear();
      } else {
        collector.add(byte);
      }
    }
  }
}
