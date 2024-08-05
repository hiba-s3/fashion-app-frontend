
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/try_virtual_controller.dart';
import 'home.dart';

class TryVirtual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = Get.put(CameraController());

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/excited-well-dressed-young-woman-posing-light-wall-attractive-brunette-girl-pink-fur-coat-playing-with-her-hair-laughing.jpg'), // Add your image asset here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Try Virtual text
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Try Virtual',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          // Bottom buttons
          Positioned(
            bottom: 140,
            left: 20,
            right: 0,
            child: Row(
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      cameraController.pickImageFromCamera();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Colors.white,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 105,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    ),
                    child: Text(
                      'Upload',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 90,
              height: 40,
              child: CustomBottomNavBar(),
            ),
          ),
        ],
      ),
    );
  }
}
