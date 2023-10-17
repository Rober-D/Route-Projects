import 'package:flutter/material.dart';
import '../constants/colors_const.dart';

class ChannelsView extends StatefulWidget {
  ChannelsView({super.key,required this.name,required this.index});
  int index;
  String name;
  @override
  State<ChannelsView> createState() => _ChannelsViewState();
}

class _ChannelsViewState extends State<ChannelsView> {

  bool articleClicked = false;

  @override
  Widget build(BuildContext context) {

    print("Channel = ${widget.index}");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.index != -1 ? ColorsConstants.primeGreen : Colors.white,
        border: Border.all(
            width: 2, color: ColorsConstants.primeGreen),
      ),
      child: Center(
        child: Text(
          "    ${widget.name}    ",
          style:  TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: widget.index != -1 ? Colors.white : ColorsConstants.primeGreen
          ),
        ),
      ),
    );
  }
}
