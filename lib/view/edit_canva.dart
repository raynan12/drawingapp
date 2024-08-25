// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:draw/view/widgets/dimensions_canva.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/proprieties_canva.dart';

class EditCanva extends StatefulWidget {
  final int id;
  const EditCanva({super.key, required this.id});

  @override
  State<EditCanva> createState() => _EditCanvaState();
}

class _EditCanvaState extends State<EditCanva> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  '       Custom Canvas',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 20),
                CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.sidebar_left,
                    color: Colors.grey.shade400,
                  ),
                  title: Text(
                    'Dimensions',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(height: 10),
                CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.circle_grid_hex_fill,
                    color: Colors.grey.shade400,
                  ),
                  title: Text(
                    'Canvas Properties',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: PageView(
              controller: _pageController,
              children: [
                DimensionsCanva(canvasIndex: widget.id),
                ProprietiesCanva(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
