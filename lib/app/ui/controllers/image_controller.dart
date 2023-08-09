import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? image;
  RxString imagePath = "".obs;
  final _picker = ImagePicker();

  getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      debugPrint('image------$image');
      imagePath(pickedFile.path);
      debugPrint(imagePath as String?);
      update();
    } else {}
  }
}
