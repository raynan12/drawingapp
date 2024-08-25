// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/canvas_controller.dart';
import 'package:get/get.dart';
import 'widgets/context_cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CanvasController canvasController = Get.put(CanvasController());

  @override
  Widget build(BuildContext context) {
  void _showAddCanvasDialog(BuildContext context, CanvasController canvasController) {
  TextEditingController canvasNameController = TextEditingController();

  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('New Canvas'),
        content: Column(
          children: [
            CupertinoTextField(
              controller: canvasNameController,
              placeholder: 'Canvas Name',
            ),
            SizedBox(height: 10),
            CupertinoTextField(
              placeholder: 'Canvas Size',
              // Você pode adicionar o controlador e lógica aqui para o tamanho do canvas
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Create'),
            onPressed: () {
              canvasController.addCanvas(canvasNameController.text);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey4.darkColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey5.darkColor,
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Procreate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                CupertinoButton(
                  child: Text(
                    'Whats New',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                  },
                  padding: EdgeInsets.only(left: 10, right: 5),
                ),
                CupertinoButton(
                  child: Text(
                    'Select',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 10, right: 5),
                ),
                CupertinoButton(
                  child: Text(
                    'Import',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 10, right: 5),
                ),
                CupertinoButton(
                  child: Text(
                    'Photo',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 10, right: 5),
                ),
                IconButton(
                  onPressed: () {
                    _showAddCanvasDialog(context, canvasController);
                  },
                  icon: Icon(
                    CupertinoIcons.add,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      child: Obx(() {
      return CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var canvas = canvasController.canvases[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContextMenuExample(canvas: canvas, id: index),
                );
              },
              childCount: canvasController.canvases.length,
            ),
          ),
        ],
      );
    }),
    );
  }
}
