import 'dart:math';

class MakeId {
  final String _loverAlphabet = 'abcdefghijklmnopqrstuvwsyz';
  final String _upperAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWQYZ';
  final String _numbers = '0123456789';

  String? makeIdFrom28() {
    StringBuffer buffer = StringBuffer();

    List tempArr = _synchronousCreatSymbolsForId().toList();

    for (var element in tempArr) {
      buffer.write(element);
    }

    return buffer.toString();
  }

  Iterable<String> _synchronousCreatSymbolsForId() sync* {
    String allSymbols = _loverAlphabet + _upperAlphabet + _numbers;

    int k = 0;

    while (k < 28) {
      yield allSymbols[Random().nextInt(allSymbols.length).toInt()];
      k++;
    }
  }
}
