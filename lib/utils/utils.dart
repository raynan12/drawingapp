// ignore_for_file: depend_on_referenced_packages, unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../view/colors/pallete_view.dart';
import '../view/drawing_maker.dart';

void showColorWheel(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Pick a color!'),
        content: ColorPicker(
          pickerColor: Colors.amber,
          onColorChanged: (value) {},
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Done'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

void _showAddCanvasDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('Brush Library'),
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
              // Logic to create a new canvas
              // Navigator.of(context).pop();
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute<Widget>(
              //     builder: (BuildContext context) {
              //       return DrawingMaker();
              //     },
              //   ),
              // );
            },
          ),
        ],
      );
    },
  );
}

void openLayers(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 48,
          ),
          child: SizedBox(
            width: 400,
            height: 550,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        // openSelectedLayer(context);
                      },
                      child: CupertinoListTile(
                        title: Text(
                          'Layers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        trailing: Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CupertinoScrollbar(
                        child: ListView.builder(
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: const ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: null,
                                    icon: CupertinoIcons.lock,
                                  ),
                                  SlidableAction(
                                    onPressed: null,
                                    backgroundColor: Colors.red,
                                    icon: CupertinoIcons.delete,
                                  ),
                                ],
                              ),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.white,
                                title: Text(
                                  'Layer 1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                ),
                                children: [
                                  CupertinoListTile(
                                    title: Text(
                                      'Darken',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Icon(
                                      CupertinoIcons.moon_fill,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  CupertinoListTile(
                                    title: Text(
                                      'Lighten',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Icon(
                                      CupertinoIcons.sun_min_fill,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  CupertinoListTile(
                                    title: Text(
                                      'Screen',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Icon(
                                      CupertinoIcons.collections_solid,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void openActions(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.topLeft,
        child: Card(
          color: Color(0xFF2C2C2E),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              height: 550,
              child: CupertinoListSection(
                backgroundColor: Colors.transparent,
                header: Text(
                  'Actions',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                children: [
                  CupertinoListTile(
                    backgroundColor: Color(0xFF2C2C2E),
                    leading: Icon(
                      CupertinoIcons.doc_fill,
                      color: Colors.grey.shade400,
                    ),
                    title: Text(
                      'Insert a file',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  CupertinoListTile(
                    backgroundColor: Color(0xFF2C2C2E),
                    leading: Icon(
                      CupertinoIcons.photo_fill_on_rectangle_fill,
                      color: Colors.grey.shade400,
                    ),
                    title: Text(
                      'Insert a photo',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  CupertinoListTile(
                    backgroundColor: Color(0xFF2C2C2E),
                    leading: Icon(
                      CupertinoIcons.photo_camera_solid,
                      color: Colors.grey.shade400,
                    ),
                    title: Text(
                      'Take a photo',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  CupertinoListTile(
                    backgroundColor: Color(0xFF2C2C2E),
                    leading: Icon(
                      CupertinoIcons.scissors,
                      color: Colors.grey.shade400,
                    ),
                    title: Text(
                      'Cut',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  CupertinoListTile(
                    backgroundColor: Color(0xFF2C2C2E),
                    leading: Icon(
                      CupertinoIcons.doc_on_clipboard_fill,
                      color: Colors.grey.shade400,
                    ),
                    title: Text(
                      'Copy',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  CupertinoListTile(
                    backgroundColor: Color(0xFF2C2C2E),
                    leading: Icon(
                      CupertinoIcons.share,
                      color: Colors.grey.shade400,
                    ),
                    title: Text(
                      'Share',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  Material(
                    child: ExpansionTile(
                      title: Text(
                        'Download',
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      backgroundColor: Color(0xFF2C2C2E),
                      collapsedBackgroundColor: Color(0xFF2C2C2E),
                      collapsedIconColor: Colors.grey.shade400,
                      iconColor: Colors.grey.shade400,
                      children: [
                        CupertinoListTile(
                          backgroundColor: Color(0xFF2C2C2E),
                          leading: Icon(
                            CupertinoIcons.photo_fill,
                            color: Colors.grey.shade400,
                          ),
                          title: Text(
                            'PNG',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                        CupertinoListTile(
                          backgroundColor: Color(0xFF2C2C2E),
                          leading: Icon(
                            CupertinoIcons.photo_fill,
                            color: Colors.grey.shade400,
                          ),
                          title: Text(
                            'JPEG',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showTabScaffoldDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 50,
          bottom: 50,
          left: 900,
          right: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.circle),
                  label: 'Wheel',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_fill),
                  label: 'Classic',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.alt),
                  label: 'Harmonia',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chart_bar_fill),
                  label: 'Value',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_grid_3x2_fill),
                  label: 'Pallete',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Card(
                    child: CupertinoTabView(
                      builder: (context) {
                        return CupertinoPageScaffold(
                          navigationBar: CupertinoNavigationBar(
                            middle: Text('Home'),
                          ),
                          child: Center(child: Text('Home Tab Content')),
                        );
                      },
                    ),
                  );
                case 1:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text('Search'),
                        ),
                        child: Center(child: Text('Search Tab Content')),
                      );
                    },
                  );
                case 2:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text('Profile'),
                        ),
                        child: Center(child: Text('Profile Tab Content')),
                      );
                    },
                  );
                  case 3:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text('Profile'),
                        ),
                        child: Center(child: Text('Profile Tab Content')),
                      );
                    },
                  );
                  case 4:
                  return CupertinoTabView(
                    builder: (context) {
                      return PalleteView();
                    },
                  );
                default:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text('Default'),
                        ),
                        child: Center(child: Text('Default Tab Content')),
                      );
                    },
                  );
              }
            },
          ),
        ),
      );
    },
  );
}

// void openSelectedLayer(BuildContext context) {
//   showCupertinoDialog(
//     context: context,
//     builder: (context) {
//       return Padding(
//         padding: EdgeInsets.only(
//           bottom: 50,
//           top: 6,
//         ),
//         child: SizedBox(
//           // height: 550,
//           width: 200,
//           child: Container(
//             color: Color(0xFF2C2C2E),
//             child: Column(
//               children: [
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//                 CupertinoButton(
//                   child: Text('Rename'),
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
