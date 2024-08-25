// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:draw/view/edit_canva.dart';
import 'package:flutter/cupertino.dart';

class ContextMenuExample extends StatelessWidget {
  final String canvas;
  final int id;
  const ContextMenuExample({super.key, required this.canvas, required this.id});

  // Or just do this inline in the builder below?
  static Animation<Decoration> _boxDecorationAnimation(
      Animation<double> animation) {
    return _tween.animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(
          0.0,
          CupertinoContextMenu.animationOpensAt,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CupertinoContextMenu.builder(
            actions: <Widget>[
              CupertinoContextMenuAction(
                onPressed: () {
                  //
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return CupertinoFullscreenDialogTransition(
                          primaryRouteAnimation: animation,
                          secondaryRouteAnimation: secondaryAnimation,
                          child: EditCanva(id: id),
                          linearTransition: false,
                        );
                      },
                    ),
                  );
                          // Get.to(() => CanvasDetailPage(canvasIndex: id));
                  // Navigator.push(
                  //   context, 
                  //   CupertinoPageRoute(builder: (context) {
                  //     return CanvasDetailPage(canvasIndex: id);
                  //   },),
                  // );
                },
                isDefaultAction: true,
                trailingIcon: CupertinoIcons.pencil,
                child: const Text('Edit'),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDefaultAction: true,
                trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                child: const Text('Copy'),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                trailingIcon: CupertinoIcons.share,
                child: const Text('Share'),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                trailingIcon: CupertinoIcons.heart,
                child: Text(canvas),
              ),
              CupertinoContextMenuAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
                trailingIcon: CupertinoIcons.delete,
                child: const Text('Delete'),
              ),
            ],
            builder: (BuildContext context, Animation<double> animation) {
              final Animation<Decoration> boxDecorationAnimation =
                  _boxDecorationAnimation(animation);

              return Container(
                decoration:
                    animation.value < CupertinoContextMenu.animationOpensAt
                        ? boxDecorationAnimation.value
                        : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(canvas),
                  ),
                  // child: const FlutterLogo(size: 500.0),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

final DecorationTween _tween = DecorationTween(
  begin: BoxDecoration(
    color: CupertinoColors.systemYellow,
    boxShadow: const <BoxShadow>[],
    borderRadius: BorderRadius.circular(20.0),
  ),
  end: BoxDecoration(
    color: CupertinoColors.systemYellow,
    boxShadow: CupertinoContextMenu.kEndBoxShadow,
    borderRadius: BorderRadius.circular(20.0),
  ),
);
