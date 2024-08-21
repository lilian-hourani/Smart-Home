import 'package:flutter/material.dart';
import 'package:smart_home/utils/smart_device.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mySmartDevices = [
    // [imagePath, deviceName, isOn]
    ["assets/light-bulb.png", "Smart Light", false],
    ["assets/air-conditioner.png", "Smart AC", false],
    ["assets/smart-tv.png", "Smart TV", false],
    ["assets/fan.png", "Smart Fan", false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6D4D4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // custom app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/menu.png",
                    height: 25,
                  ),
                  Image.asset(
                    "assets/user.png",
                    height: 25,
                  )
                ],
              ),
              // Welcome Home Lilian Hourani
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome Home",
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.w500),
              ),
              const Text(
                "LILIAN HOURANI",
                style: TextStyle(fontFamily: "BebasNeue", fontSize: 40),
              ),
              const SizedBox(
                height: 25,
              ),
              // divider
              const Divider(
                color: Colors.grey,
                thickness: .5,
              ),
              const SizedBox(
                height: 25,
              ),
              // Smart Devices
              Text(
                "Smart Devices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 25,
              ),
              // GridView
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return SmartDevice(
                      imagePath: mySmartDevices[index][0],
                      deviceName: mySmartDevices[index][1],
                      isON: mySmartDevices[index][2],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
