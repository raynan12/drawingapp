// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_final_fields, unused_element, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:draw/controllers/edit_image_controller.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import '../main.dart';
import '../test.dart';
import '../utils/utils.dart';
import 'widgets/cupertino_modal.dart';
import 'widgets/text_on_image.dart';

class DrawingMaker extends StatefulWidget {
  const DrawingMaker({super.key});

  @override
  State<DrawingMaker> createState() => _DrawingMakerState();
}

class _DrawingMakerState extends EditImageViewModel {
  double _currentSliderValue = 0.0;
  String? _sliderStatus;

  String _selectedFont = 'Caveat'; 

   final List<String> _fonts = [
    'Caveat',
    'IndieFlower',
    'Matemasie',
    'Montserrat',
    'NewAmsterdan',
    'Quicksand',
    'QwitcherGrypen',
    'Roboto',
  ];

  @override
  Widget build(BuildContext context) {
    Color _currentColor = Colors.blue;

    void _openColorPicker() {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 450,
              height: 550,
              child: CupertinoAlertDialog(
                title: Text('Pick a Color'),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleColorPicker(
                    onChanged: (Color color) {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                    strokeWidth: 3.0,
                    colorCodeBuilder: (context, color) {
                      return Text(
                        'RGB(${color.red},${color.green},${color.blue})',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return CupertinoPageScaffold(
      backgroundColor: kCanvasColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey5.darkColor,
        middle: Row(
          children: [
            CupertinoButton(
              child: Text(
                'Gallery',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              padding: EdgeInsets.only(left: 10, right: 5),
            ),
            IconButton(
              onPressed: () {
                openActions(context);
              },
              icon: Icon(
                CupertinoIcons.wrench_fill,
                color: Colors.white,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                showTabScaffoldDialog(context);
              },
              icon: Icon(
                CupertinoIcons.paintbrush_fill,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                openLayers(context);
              },
              icon: Icon(
                CupertinoIcons.square_fill,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    // return CupertinoModal(
                    //   creatorText: creatorText,
                    // );
                    return myWidget;
                  },
                );
              },
              icon: Icon(
                CupertinoIcons.hand_draw_fill,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => addNewDialog(context),
              icon: Icon(
                CupertinoIcons.pen,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                _openColorPicker();
              },
              child: SvgPicture.asset(
                'assets/svgs/color_wheel.svg',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
            for (int i = 0; i < texts.length; i++)
              Positioned(
                left: texts[i].left,
                top: texts[i].top,
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      currentIndex = i;
                      removeText(context);
                    });
                  },
                  onTap: () => setCurrentIndex(context, i),
                  child: Draggable(
                    feedback: ImageText(textInfo: texts[i]),
                    child: ImageText(textInfo: texts[i]),
                    onDragEnd: (drag) {
                      final renderBox = context.findRenderObject() as RenderBox;
                      Offset off = renderBox.globalToLocal(drag.offset);
                      setState(() {
                        texts[i].top = off.dy - 96;
                        texts[i].left = off.dx;
                      });
                    },
                  ),
                ),
              ),
            creatorText.text.isNotEmpty
                ? Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      creatorText.text,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(
                            0.3,
                          )),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      // child: DrawingArea(),
    );
  }

  Widget get myWidget => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xCCF2F2F2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.keyboard,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.scissors,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.add_circled_solid,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.arrowtriangle_down_square_fill,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CupertinoButton(
                padding: EdgeInsets.zero,
                color: Colors.transparent,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                color: Colors.transparent,
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoListTile(
                        title: Text(
                          'Style',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Caveat',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedFont = _fonts[0];
                          });
                        },
                      ),
                      CupertinoListTile(
                        title: Text(
                          'IndieFlower',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedFont = _fonts[1];
                          });
                        },
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Matemasie',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedFont = _fonts[2];
                          });
                        },
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Montserrat',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'NewAmsterdan',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Quicksand',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'QwitcherGrypen',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Roboto',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoListTile(
                        title: Text(
                          'Style',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Regular',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'RegularItalic',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Light',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'LightItalic',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'SemiBold',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'SemiboldItalic',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Bold',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          'BoldItalic',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Atributes',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_aligncenter,
                            ), 
                            onPressed: alignCenter,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_alignleft,
                            ), 
                            onPressed: alignLeft,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_alignright,
                            ), 
                            onPressed: alignCenter,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_justify,
                            ), 
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.info_circle_fill,
                            ), 
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.circle,
                            ), 
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.italic,
                            ), 
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_cursor,
                            ), 
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
}



/*
Center(
          child: CupertinoButton(
            child: Text('data'),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return Container(
                    child: CupertinoAlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Copy & Past',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              CupertinoIcons.xmark_circle_fill,
                            ),
                          ),
                        ],
                      ),
                      content: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.scissors_alt,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.add_circled_solid,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons
                                      .rectangle_fill_on_rectangle_fill,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.delete,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
 */