import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';

//indecator model
class IndecatorModel {
  bool backgroundFlag;

  IndecatorModel({
    this.backgroundFlag = false,
  });

  List<IndecatorModel> indecatorList() {
    return List.generate(8, (index) => IndecatorModel());
  }
}

//item of ListTouchBrumButtonItem
class TouchDrumButtonItem {
  String name;
  Color color;
  String? fileName;

  TouchDrumButtonItem({
    required this.name,
    required this.color,
    this.fileName,
  });
}

//list which used for rendering drum button in bottom of screen
class ListTouchDrumButtonItem {
  final drumColors = DrunMachineColors();

  late List<TouchDrumButtonItem> list = [
    TouchDrumButtonItem(
        name: 'Kick',
        color: drumColors.lime,
        fileName: 'sounds/bass-bochka.mp3'),
    TouchDrumButtonItem(
        name: 'Snare', color: drumColors.red, fileName: 'sounds/snare.mp3'),
    TouchDrumButtonItem(
        name: 'hi-hat',
        color: drumColors.amber,
        fileName: 'sounds/Hi-Hat-Closed.mp3'),
    TouchDrumButtonItem(name: 'tom-h', color: drumColors.green),
    TouchDrumButtonItem(name: 'tom-m', color: drumColors.pink),
    TouchDrumButtonItem(
        name: 'tom-l', color: drumColors.blue, fileName: 'sounds/tom-low.mp3'),
    TouchDrumButtonItem(
        name: 'crash', color: drumColors.purpule, fileName: 'sounds/crash.mp3'),
    TouchDrumButtonItem(
        name: 'ride', color: drumColors.orange, fileName: 'sounds/ride.mp3'),
  ];

  get getList => list;
}

class TrackItemModel {
  int jIndex;
  int iIndex;
  bool borderFlag;
  bool backgrounFlag;
  bool indecator;
  Color color;

  TrackItemModel({
    required this.borderFlag,
    required this.jIndex,
    required this.iIndex,
    required this.backgrounFlag,
    required this.indecator,
    required this.color,
  });
}

class TrakcModel {
  List<TrackItemModel> trackList;

  TrakcModel({required this.trackList});
}

class Matrix {
  List<TrakcModel> get getMatrix => List.generate(
        8,
        (i) => TrakcModel(
          trackList: List.generate(
            8,
            (j) => TrackItemModel(
              jIndex: j,
              backgrounFlag: false,
              borderFlag: false,
              indecator: false,
              iIndex: i,
              color: j % 2 == 0
                  ? Colors.transparent
                  : const Color.fromARGB(15, 255, 255, 255),
            ),
          ),
        ),
      );
}
