import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iotdashnew/constant/ip.dart';

class ApiKeyGeneration extends StatefulWidget {
  @override
  _ApiKeyGenerationState createState() => _ApiKeyGenerationState();
}

class _ApiKeyGenerationState extends State<ApiKeyGeneration> {
  final TextEditingController apiKeyController =
      TextEditingController(text: '$ipAddress/');
  final RxBool isEditing = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Key Generation'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Obx(
            () {
                return TextField(
                  controller: apiKeyController,
                  enabled: isEditing.value,
                  decoration: InputDecoration(
                    hintText: '$ipAddress/',
                  ),
                );
              }
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                     Get.snackbar(
                      'API Key Generated',
                      'Your API key is: ${apiKeyController.text}',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black,
                      colorText: Colors.white,
                    );
                  },
                  child: Text('Generate API Key'),
                ),
                Row(
                  children: [
                    Text('Edit'),
                    Obx(
                      () => Switch(
                        value: isEditing.value,
                        onChanged: (value) {
                          isEditing.value = value;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    GetMaterialApp(
      home: ApiKeyGeneration(),
    ),
  );
}
