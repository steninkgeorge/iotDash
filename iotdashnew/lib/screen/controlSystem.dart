import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlSystem extends StatelessWidget {
  final RxBool isSwitched = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control System'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => SwitchListTile(
                title: Text(
                  isSwitched.value ? 'System is ON' : 'System is OFF',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                value: isSwitched.value,
                onChanged: (value) {
                  isSwitched.value = value;
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Notice:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'To control the system, you need to generate an API key and connect your device.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('Generate API Key & Connect Device'),
            ),
          ],
        ),
      ),
    );
  }
}


