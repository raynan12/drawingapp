import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/text_info_model.dart';

class EditImageController extends GetxController {
  RxList<TextInfo> texts = <TextInfo>[].obs;
  RxInt currentIndex = 0.obs;
  TextEditingController creatorText = TextEditingController();

  void removeText(BuildContext context) {
    if (texts.isNotEmpty) {
      texts.removeAt(currentIndex.value);
      Get.snackbar('Deleted', '', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void setCurrentIndex(BuildContext context, int index) {
    currentIndex.value = index;
    Get.snackbar('Selected For Styling', '',
        snackPosition: SnackPosition.BOTTOM);
  }

  void addNewText(BuildContext context, String text) {
    texts.add(
      TextInfo(
        text: text, 
        left: 0, 
        top: 0, 
        color: Colors.black,
        fontFamily: 'Quicksand',
        fontSize: 21,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w100,
        textAlign: TextAlign.center,
      ),
    );
    Get.back();
  }

  void addNewDialog(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Add New Text'),
        content: CupertinoTextField(
          controller: textEditingController,
          maxLines: 5,
          placeholder: 'Your Text Here..',
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: const Text('Add'),
            onPressed: () {
              addNewText(context, textEditingController.text);
            },
          ),
        ],
      ),
    );
  }
}
