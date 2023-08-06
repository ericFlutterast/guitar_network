import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/drum_machine_model.dart';
import '../pages/drum_machine_page/drum_machine_page.dart';
import '../pages/drum_machine_page/widgets/select_bpm.dart';

class DrumMachineProvider extends ChangeNotifier {
  double interval = 1000 / (100 / 60);
  int bpm = 100;
  Timer? timer;
  int indecatorIndex = 0;
  bool onActive = false;
  final player = AudioPlayer();
  final playerTwo = AudioPlayer();
  final List<String?> soundBank =
      ListTouchDrumButtonItem().list.map((e) => e.fileName).toList();

  final List<IndecatorModel> indecatorList = IndecatorModel().indecatorList();
  List<TrakcModel> matrix = Matrix().getMatrix;

  final List<Widget> stackList = [
    const Content(titleOfAppBar: 'Семплер'),
    //SelectBpm(),
  ];

  get getStackList => stackList;
  get getBpm => bpm;

  void selectBpmBatton() {
    stackList.add(const SelectBpm());

    notifyListeners();
  }

  void switchBpm(int newBpm) {
    bpm = newBpm;
    interval = 1000 / (newBpm / 60);
    stackList.removeLast();
    notifyListeners();
  }

  //add drum on screen
  void selectPosition(int iIdex, int jIndex) {
    bool flag = matrix[iIdex].trackList[jIndex].borderFlag;

    flag = flag ? false : true;

    matrix[iIdex].trackList[jIndex].borderFlag = flag;

    notifyListeners();
  }

  void addItem() {
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].trackList.length; j++) {
        if (matrix[i].trackList[j].borderFlag) {
          matrix[i].trackList[j].borderFlag = false;
          matrix[i].trackList[j].backgrounFlag = true;
        }
      }
    }
    notifyListeners();
  }

  void deleteItem() {
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].trackList.length; j++) {
        matrix[i].trackList[j].borderFlag = false;
        matrix[i].trackList[j].backgrounFlag = false;
      }
    }

    notifyListeners();
  }

  //play
  void play() {
    if (!onActive) {
      onActive = true;
      _startTimer();
    }
  }

  //stop
  void stop() {
    if (onActive) {
      timer!.cancel();
      if (indecatorIndex == 0) {
        _removeSettings(indecatorList.length - 1);
      } else {
        _removeSettings(indecatorIndex - 1);
      }

      onActive = false;
    }
  }

  void _removeSettings(int index) {
    indecatorList[index].backgroundFlag = false;

    for (int i = 0; i < matrix.length; i++) {
      matrix[i].trackList[index].indecator = false;
    }

    indecatorIndex = 0;
    notifyListeners();
  }

  void _playSound(String name) async {
    await player.stop();

    await player.setVolume(1);

    await player.setPlaybackRate(1);
    await player.play(AssetSource(name));
  }

  void _startTimer() {
    timer = Timer.periodic(
      Duration(milliseconds: interval.toInt()),
      (timer) {
        for (int i = 0; i < matrix.length; i++) {
          if (matrix[i].trackList[indecatorIndex].backgrounFlag) {
            if (soundBank[i] != null) {
              _playSound(soundBank[i].toString());
            }
          }
        }

        _updateIndecator(indecatorIndex);

        _outdateIndecator(indecatorIndex - 1);

        indecatorIndex++;
        if (indecatorIndex == indecatorList.length) {
          indecatorIndex = 0;
        }
      },
    );
  }

  void _outdateIndecator(int index) {
    if (index >= 0) {
      indecatorList[index].backgroundFlag = false;
      for (int i = 0; i < matrix.length; i++) {
        matrix[i].trackList[index].indecator = false;
      }
    }

    notifyListeners();
  }

  void _updateIndecator(int index) {
    indecatorList[index].backgroundFlag = true;

    for (int i = 0; i < matrix.length; i++) {
      matrix[i].trackList[index].indecator = true;
    }

    if (index == 0) {
      indecatorList[indecatorList.length - 1].backgroundFlag = false;
      for (int i = 0; i < matrix.length; i++) {
        matrix[i].trackList[indecatorList.length - 1].indecator = false;
      }
    }

    notifyListeners();
  }
}
