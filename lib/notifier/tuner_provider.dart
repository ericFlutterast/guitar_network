import 'package:flutter/foundation.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

import '../models/map_item_to_tunes.dart';
import '../models/note_round.dart';
import '../services/tuner.dart';

class TunerProvider with ChangeNotifier {
  double selectedPitch = 0.0;
  String label = 'Настроить гитару';
  String note = '';
  String plus = '';
  String minus = '';
  bool flagForPressButtn = true;
  bool flagToBackground = false;
  int selectIndex = -1;
  final _recorder = FlutterAudioCapture();
  final pitchDetector = PitchDetector(44100, 2000);
  Tuner guitar = Tuner.standartE();
  List<double> _audioSample = [];

  final List<String> _listOfSelectTune = [
    'Standart E',
    'Standart D',
    'Drop D',
    'Drop C',
  ];

  final List<NoteRound> _listWithNotes = ListOfNoteRound.listWithNotes;

  List<NoteRound> get getListWithNotes => _listWithNotes;
  List<String> get getListOfSelectTune => _listOfSelectTune;

  //start or stop tuner button
  void pressButton() {
    if (flagForPressButtn) {
      flagForPressButtn = false;
      label = 'Остановить настройку';
      _start();
    } else {
      flagForPressButtn = true;
      label = 'Настроить гитару';
      note = '';
      plus = '';
      minus = '';
      flagToBackground = false;
      _stop();
    }

    notifyListeners();
  }

  //selectString
  void selectString(int index, double pitch, String newNote) {
    //print('$index $newNote $pitch');

    for (var element in _listWithNotes) {
      element.borderFlag = false;
    }

    selectIndex = index;

    _listWithNotes[index].borderFlag = true;
    note = newNote;
    selectedPitch = pitch;
    flagToBackground = false;
    notifyListeners();
  }

  //start recording grom microphone
  Future<void> _start() async {
    await _recorder.start(_listener, _onError,
        sampleRate: 44100, bufferSize: 3000);
  }

  //stop recording grom microphone
  Future<void> _stop() async {
    await _recorder.stop();
  }

  //_listener returned data whitch resevies mirophone
  void _listener(dynamic obj) {
    var buffer = Float64List.fromList(obj.cast<double>());
    _audioSample = buffer.toList();

    var res = pitchDetector.getPitch(_audioSample).pitch.toStringAsFixed(2);

    //hard code
    isTune(guitar.noteDefinitions(double.parse(res), selectedPitch));
  }

  // check it the note the tunes
  void isTune(List newNoteList) {
    if (note.isEmpty) return;

    if (newNoteList[1] as bool) {
      flagToBackground = true;
      _listWithNotes[selectIndex].backgroundFlag = true;
      return;
    }

    if (newNoteList[0] as String == '+') {
      plus = newNoteList[0];
    } else {
      plus = '';
    }

    if (newNoteList[0] as String == '-') {
      minus = newNoteList[0];
    } else {
      minus = '';
    }
    notifyListeners();
  }

  void _onError(Object e) {
    print(e);
  }

  void selectTune(String value) {
    switch (value) {
      case 'Standart E':
        guitar = Tuner.standartE();
        _updateListOfStringsQuantity(guitar);
        break;
      case 'Drop D':
        guitar = Tuner.dropD();
        _updateListOfStringsQuantity(guitar);
        break;
      case 'Standart D':
        guitar = Tuner.standartD();
        _updateListOfStringsQuantity(guitar);
        break;
      case 'Drop C':
        guitar = Tuner.dropC();
        _updateListOfStringsQuantity(guitar);
        break;
    }

    notifyListeners();
  }

  void _updateListOfStringsQuantity(Tuner guitar) {
    final Map<String, double> listOfNameString = guitar.getTune;
    List<MapIntem> tempLits = [];

    listOfNameString.forEach((key, value) {
      tempLits.add(MapIntem(key, value));
    });

    for (int index = 0; index < _listWithNotes.length; index++) {
      _listWithNotes[index].backgroundFlag = false;
      _listWithNotes[index].borderFlag = false;
      _listWithNotes[index].index = index;
      _listWithNotes[index].pitch = tempLits[index].value;
      _listWithNotes[index].note = tempLits[index].key;
    }
  }
}
