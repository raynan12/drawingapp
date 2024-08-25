// ignore_for_file: prefer_const_constructors, unused_import
import 'package:draw/test.dart';
import 'package:draw/view/drawing_maker.dart';
import 'package:draw/view/edit_canva.dart';
import 'package:draw/view/home.dart';
import 'package:draw/view/widgets/dimensions_canva.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/drawing_page.dart';

void main() {
  runApp(MyApp());
}

const Color kCanvasColor = Color(0xfff2f3f7);
const String kGithubRepo = 'https://github.com/JideGuru/flutter_drawing_board';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Let\'s Draw',
    //   theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
    //   debugShowCheckedModeBanner: false,
    //   home: EditImageScreen(),
    // );
    return CupertinoApp(
        theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
          fontFamily: 'Quicksand',
        ))),
        debugShowCheckedModeBanner: false,
        title: 'App',
        home: GetMaterialApp(home: DrawingMaker())
      );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Procreate-like Text Input',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Procreate-like Text Input'),
//         ),
//         body: DrawingArea(),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  void _showFullScreenDialog(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            child: FullScreenDialog(),
            linearTransition: false,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home Page'),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          onPressed: () => _showFullScreenDialog(context),
          child: Text('Show Full Screen Dialog'),
        ),
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Full Screen Dialog'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Done'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: Center(
        child: Text('This is a full screen dialog.'),
      ),
    );
  }
}
