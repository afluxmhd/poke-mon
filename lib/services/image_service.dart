import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:poke_man/widgets/text_widget.dart';

class ImageService {
  String imagePath = '/storage/emulated/0/Pictures/'; //concatenate with pokemon name and .jpg

  Future<String> saveNetworkImageToGallery(String url, String pathName) async {
    try {
      var response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data), quality: 60, name: pathName);
      return result['filePath'];
    } catch (err) {
      return 'Error $err';
    }
  }

  Image getImageFromLocalStorage(String name) {
    return Image.file(File('$imagePath$name.jpg'), errorBuilder: (context, error, stackTrace) {
      return const Center(
        child: TextWidget(
          label: 'Image not found in Files',
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      );
    });
  }

  Future<void> deleteImageFromGallery(String imageName) async {
    try {
      File file = File('$imagePath$imageName.jpg');
      if (await file.exists()) {
        await file.delete();
      } else {
        print('File No found');
      }
    } catch (e) {
      print(e);
    }
  }
}
