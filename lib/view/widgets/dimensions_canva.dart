// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, override_on_non_overriding_member

import 'package:draw/controllers/canvas_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DimensionsCanva extends StatefulWidget {
  final int canvasIndex;
  // final String canvas;
  DimensionsCanva({required this.canvasIndex});

  @override
  State<DimensionsCanva> createState() => _DimensionsCanvaState();
}

class _DimensionsCanvaState extends State<DimensionsCanva> {
  final CanvasController canvasController = Get.find();
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: canvasController.canvases[widget.canvasIndex],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // final CanvasController canvasController = Get.put(CanvasController());
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              // Expanded(child: Obx(() {
              //   return CupertinoTextField(
              //     controller: _nameController,
              //     style: TextStyle(fontSize: 25, color: Colors.white),
              //     decoration: BoxDecoration(color: Colors.transparent),
              //     placeholder: 'Canvas Name',
              //     placeholderStyle: TextStyle(color: Colors.white),
              //     cursorColor: Colors.white,
              //   );
              // })),
              Expanded(child: CupertinoTextField(
                  controller: _nameController,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  decoration: BoxDecoration(color: Colors.transparent),
                  // placeholder: canvasController.selectedCanvasName,
                  placeholder: _nameController.text,
                  placeholderStyle: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoButton(
                  child: Text('Save'),
                  onPressed: () {
                    canvasController.updateCanvasNameByIndex(
                      widget.canvasIndex,
                      _nameController.text,
                    );
                    print(_nameController.text);
                  },
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 50,
              right: 50,
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4.darkColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Width'),
                    Spacer(),
                    Text('12°'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
              top: 1,
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4.darkColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Heigth'),
                    Spacer(),
                    Text('12°'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 50,
              right: 50,
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4.darkColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('DPI'),
                    Spacer(),
                    Text('300'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
              top: 1,
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4.darkColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Maximum Layers'),
                    Spacer(),
                    Text('60'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
