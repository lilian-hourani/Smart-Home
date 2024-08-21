// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class SmartDevice extends StatefulWidget {
  final String imagePath;
  final String deviceName;
  bool isON;

  SmartDevice({
    Key? key,
    required this.imagePath,
    required this.deviceName,
    required this.isON,
  }) : super(key: key);

  @override
  State<SmartDevice> createState() => _SmartDeviceState();
}

class _SmartDeviceState extends State<SmartDevice> {
  TorchController torchController = TorchController();
  @override
  void initState() {
    torchController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
          color: widget.isON ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Image.asset(
            widget.imagePath,
            height: 60,
            color: widget.isON ? Colors.white : Colors.grey[800],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.deviceName,
                  style: TextStyle(
                      color: widget.isON ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: CupertinoSwitch(
                  value: widget.isON,
                  onChanged: (value) {
                    setState(() {
                      widget.isON = !widget.isON;
                      if (widget.imagePath == "assets/light-bulb.png") {
                        torchController.toggle();
                      }
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
