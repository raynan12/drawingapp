// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProprietiesCanva extends StatefulWidget {
  const ProprietiesCanva({super.key});

  @override
  State<ProprietiesCanva> createState() => _ProprietiesCanvaState();
}

class _ProprietiesCanvaState extends State<ProprietiesCanva> {
  bool isBack = false;
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Column(
        children: [
          SizedBox(height: 50),
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
                    Text('Background Colour'),
                    Spacer(),
                    CupertinoSwitch(
                      value: isBack,
                      onChanged: (value) {},
                    ),
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
                    Text('Background Hidden'),
                    Spacer(),
                    CupertinoSwitch(
                      value: isHidden,
                      onChanged: (value) {},
                    ),
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
