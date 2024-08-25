// ignore_for_file: prefer_const_constructors, unused_import, unused_field, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

enum Sky { midnight, viridian }

class PalleteView extends StatefulWidget {
  const PalleteView({super.key});

  @override
  State<PalleteView> createState() => _PalleteViewState();
}

class _PalleteViewState extends State<PalleteView> {
  Sky _selectedSegment = Sky.midnight;
  Color selectedColor = Colors.red;

  final List<Color> paletteColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.white,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.lime,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.blueGrey,
    Colors.indigoAccent,
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.cyanAccent,
    Colors.amberAccent,
    Colors.yellowAccent,
    Colors.limeAccent,
  ];

  final ImagePicker _picker = ImagePicker();
  List<Color> _extractedColors = [];
  Uint8List? _imageData;

  Future<void> _pickImageAndExtractColors() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final Uint8List imageData = await pickedFile.readAsBytes();
      setState(() {
        _imageData = imageData;
      });

      final imageProvider = MemoryImage(imageData);

      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        imageProvider,
        size: Size(200, 200),
        maximumColorCount: 10,
      );

      setState(() {
        _extractedColors = paletteGenerator.colors.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      navigationBar: CupertinoNavigationBar(
        trailing: IconButton(
          onPressed: _pickImageAndExtractColors,
          icon: Icon(CupertinoIcons.add),
        ),
        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey2,
          thumbColor: Colors.blue,
          groupValue: _selectedSegment,
          onValueChanged: (Sky? value) {
            if (value != null) {
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          children: const <Sky, Widget>{
            Sky.midnight: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Compact',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.viridian: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Cards',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          },
        ),
      ),
      child: _selectedSegment == Sky.midnight
          ? SingleChildScrollView(
              child: Column(
                children: [
                  if (_extractedColors.isNotEmpty)
                    SizedBox(
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, 
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1.0, 
                          ),
                          itemCount: _extractedColors.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: _extractedColors[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 800,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: paletteColors.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, 
                        // mainAxisSpacing: 10.0,
                        // crossAxisSpacing: 10.0,
                        // childAspectRatio: 1.0, 
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = paletteColors[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: paletteColors[index],
                              border: Border.all(
                                color: selectedColor == paletteColors[index]
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Container(color: Colors.red),
    );
  }
}
