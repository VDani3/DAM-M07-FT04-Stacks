import 'package:flutter/material.dart';

/*
  Exemple de com usar 'WidgetSidebars'

  WidgetSidebars(
    isSidebarLeftVisible: appData.isSidebarLeftVisible,
    left: const LayoutPartLeft(),
    central: const LayoutPartCentral());
  }
*/

class WidgetSidebars extends StatefulWidget {
  final bool isSidebarLeftVisible;
  final bool isSidebarRightVisible;
  final Widget? left;
  final Widget? right;
  final Widget central;

  const WidgetSidebars({
    Key? key,
    required this.isSidebarLeftVisible,
    required this.isSidebarRightVisible,
    this.left,
    this.right,
    required this.central,
  }) : super(key: key);

  @override
  WidgetSidebarsState createState() => WidgetSidebarsState();
}

class WidgetSidebarsState extends State<WidgetSidebars> {
  @override
  Widget build(BuildContext context) {
    const width = 200.0;
    const millis = 300;

    bool isSidebarRightVisible = widget.isSidebarRightVisible;
    bool isSidebarLeftVisible = widget.isSidebarLeftVisible;

    if (widget.left == null) {
      isSidebarLeftVisible = false;
    } 

    return Stack(
      children: [
        if (widget.isSidebarLeftVisible)
          Container(
            color: Color.fromRGBO(228, 234, 226, 1),
            child: widget.left,
            width: width,
          ),

        AnimatedPositioned(
          duration: const Duration(milliseconds: millis),
          left: widget.isSidebarLeftVisible ? width : 0,
          right: widget.isSidebarRightVisible ? width : 0,
          top: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: widget.central,
          ),
        ),
        if (widget.isSidebarRightVisible)
          Container(
            color: Color.fromRGBO(234, 228, 226, 1),
            child: widget.right,
            width: width,
          ),
      ],
);
  }
}
