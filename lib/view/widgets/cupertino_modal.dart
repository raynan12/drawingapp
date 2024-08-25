// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoModal extends StatefulWidget {
  final TextEditingController creatorText;
  final VoidCallback onTap;

  const CupertinoModal({required this.creatorText, required this.onTap});

  @override
  State<CupertinoModal> createState() => _CupertinoModalState();
}

class _CupertinoModalState extends State<CupertinoModal> {
  String _selectedFont = 'Caveat'; 
  String _inputText = '';

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
  void initState() {
    super.initState();
    _inputText = widget.creatorText.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    onPressed: widget.onTap,
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
                onPressed: () {},
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
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_alignleft,
                            ), 
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              CupertinoIcons.text_alignright,
                            ), 
                            onPressed: () {},
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
}
