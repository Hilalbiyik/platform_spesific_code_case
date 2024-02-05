import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_cpesific_code_case/constant/constant.dart';

class BatterLevel extends StatefulWidget {
  const BatterLevel({super.key});
  
  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  State<BatterLevel> createState() => _BatterLevelState();
}

class _BatterLevelState extends State<BatterLevel> {
  String _batteryLevel = 'Unknown batteryc level.';
  String _systemDetail = 'Unknown system details';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result =
          await BatterLevel.platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _getSystemDetail() async {
    String systemDetail;
    try {
      final result = await BatterLevel.platform.invokeMethod('getSystemDetail');
      systemDetail = '------System Detail------ \n $result .';
    } on PlatformException catch (e) {
      systemDetail = "Failed to get system details : '${e.message}'.";
    }
    setState(() {
      _systemDetail = systemDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: ConstantsColor.lightPurpleColor,
        appBar: AppBar(
          backgroundColor: ConstantsColor.purpleColor,
          title: Text(
            ConstantsAdress.platformTitle,
            style: TextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _batteryLevel,
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: _getBatteryLevel,
                      child: const Text('Get Battery Level'),
                    ),
                    
                    Text(_systemDetail,
                    style: TextStyle(fontSize: 20),),
                    ElevatedButton(
                      onPressed: _getSystemDetail,
                      child: const Text('Get System Detail'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}




