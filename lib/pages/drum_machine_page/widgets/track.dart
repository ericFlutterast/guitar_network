import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/pages/drum_machine_page/widgets/track_item.dart';

import '../../../models/drum_machine_model.dart';

class Track extends StatelessWidget {
  final List<TrackItemModel> trackList;
  const Track({
    required this.trackList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width / 6.7;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.amber,
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: trackList.length,
        itemBuilder: (context, index) => TrackItem(
          borderFlag: trackList[index].borderFlag,
          backgroundFlag: trackList[index].backgrounFlag,
          color: trackList[index].color,
          iIndex: trackList[index].iIndex,
          jIndex: trackList[index].jIndex,
          indecator: trackList[index].indecator,
        ),
      ),
    );
  }
}
