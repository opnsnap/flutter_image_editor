import 'package:flutter/material.dart';
import 'package:image_editor_dove/widget/editor_panel_controller.dart';
import 'dart:io';

import 'image_editor.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File image;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget backWidget({VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () {
        Navigator.pop(context);
      },
      child: ImageEditor.uiDelegate.buildBackWidget(),
    );
  }

  ///reset button
  Widget resetWidget({VoidCallback? onTap}) {
    return const Text("Back");
    // return Padding(
    //   padding: EdgeInsets.only(top: 6, bottom: 6 , right: 16),
    //   child: ValueListenableBuilder<OperateType>(
    //     valueListenable: realState?._panelController.operateType ?? ValueNotifier(OperateType.non),
    //     builder: (ctx, value, child) {
    //       return Offstage(
    //         offstage: value != OperateType.rotated,
    //         child: GestureDetector(
    //           onTap: onTap,
    //           child: ImageEditor.uiDelegate.resetWidget,
    //         ),);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color:  Colors.black,
        child: Listener(
            onPointerHover: (details) {
              // TODO: ?
            },
            child: Stack(
              children: [
                Opacity(
                    opacity: 0,
                    child: AppBar(
                      iconTheme: IconThemeData(color: Colors.white, size: 16),
                      leading: backWidget(),
                      backgroundColor: Colors.transparent,
                      actions: [
                        // resetWidget(onTap: resetCanvasPlate)
                      ],
                    )),
              ],
            )
        )
    );
  }
}