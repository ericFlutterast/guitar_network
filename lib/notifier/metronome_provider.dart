import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/metronome_page/widgets/item_of_dot.dart';

class MetronomProvider with ChangeNotifier {
  int index = 0;
  double bpm = 130;
  double volume = 50;
  bool flagOfPlay = false;
  String timeSignature = '4/4';
  double interval = 1000 / (130 / 60);
  int tapCounter = 0;
  final playerOne = AudioPlayer();
  final stopwatch = Stopwatch();
  Timer? timer;

  List<ItemOfDotList> dotList =
      List.generate(4, (index) => const ItemOfDotList(flag: false));

  double calculateInterval() {
    return 1000 / (bpm / 60);
  }

  void increment() {
    if (bpm == 256) {
      return;
    }
    bpm++;

    interval = calculateInterval();
    notifyListeners();
  }

  void decrement() {
    if (bpm == 0) {
      return;
    }
    bpm--;
    interval = calculateInterval();
    notifyListeners();
  }

  void tapTempo() {
    double tempBpm = 0;

    if (stopwatch.isRunning) {
      tempBpm = 60000 / stopwatch.elapsedMilliseconds;
      stopwatch.reset();
      stopwatch.stop();
    }

    if (tempBpm < 20) {
      bpm = 20;
      interval = calculateInterval();
    } else if (tempBpm > 256) {
      bpm = 256;
      interval = calculateInterval();
    } else {
      bpm = tempBpm;
      interval = calculateInterval();
    }
    stopwatch.start();

    notifyListeners();
  }

  void updateSlider(double newValue) {
    bpm = newValue;
    interval = calculateInterval();

    notifyListeners();
  }

  void updateVolume(double value) {
    volume = value;
    notifyListeners();
  }

  void playStop() {
    if (flagOfPlay) {
      flagOfPlay = false;
      timer!.cancel();
    } else {
      flagOfPlay = true;
      _startTimer();
    }

    notifyListeners();
  }

  void _playSound(double timeOfPlay) async {
    await playerOne.stop();

    await playerOne.setVolume(volume);

    await playerOne.setPlaybackRate(1);
    await playerOne.play(AssetSource('sounds/bass-bochka.mp3'));
  }

  void _startTimer() {
    double timeOfPlay;
    String timeOfPlayString = '';
    timeOfPlayString = (interval / 100).toStringAsFixed(1);
    timeOfPlay = double.parse(timeOfPlayString);

    playerOne.setSource(AssetSource('sounds/MetronomOne.mp3'));

    timer =
        Timer.periodic(Duration(milliseconds: interval.toInt()), (timer) async {
      _playSound(timeOfPlay);
      stopwatch.stop();

      _updateDotColor(index);

      _outdateDotColor(index - 1);

      index++;
      if (index == dotList.length) {
        index = 0;
      }
    });
  }

  void _outdateDotColor(int index) {
    if (index >= 0) {
      dotList[index] = const ItemOfDotList(flag: false);
    }

    notifyListeners();
  }

  void _updateDotColor(int index) {
    dotList[index] = const ItemOfDotList(flag: true);

    if (index == 0) {
      dotList[dotList.length - 1] = const ItemOfDotList(flag: false);
    }

    notifyListeners();
  }

  void updateTimeSignature(int value) {
    switch (value) {
      case 0:
        timeSignature = '4/4';
        break;
      case 1:
        timeSignature = '3/4';
        break;
      case 2:
        timeSignature = '5/6';
        break;
      case 3:
        timeSignature = '6/8';
        break;
      case 4:
        timeSignature = '7/8';
        break;
      default:
        break;
    }
    index = 0;
    int lenght = int.parse(timeSignature[0]);
    dotList =
        List.generate(lenght, (index) => const ItemOfDotList(flag: false));
    notifyListeners();
  }
}
