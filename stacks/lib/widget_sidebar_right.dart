import 'package:flutter/material.dart';

/*
  Exemple de com usar 'WidgetSidebars'

  WidgetSidebars(
    isSidebarLeftVisible: appData.isSidebarLeftVisible,
    left: const LayoutPartLeft(),
    central: const LayoutPartCentral());
  }
*/

class WidgetSidebarsRight extends StatefulWidget {
  final bool isSidebarRightVisible;
  final Widget? right;
  final Widget central;

  const WidgetSidebarsRight({
    Key? key,
    required this.isSidebarRightVisible,
    this.right,
    required this.central,
  }) : super(key: key);

  @override
  WidgetSidebarsRightState createState() => WidgetSidebarsRightState();
}

class WidgetSidebarsRightState extends State<WidgetSidebarsRight> {
  @override
  Widget build(BuildContext context) {
    const width = 200.0;
    const millis = 300;

    bool isSidebarRightVisible = widget.isSidebarRightVisible;

    if (widget.right == null) {
      isSidebarRightVisible = false;
    }

    return Stack(
      children: [
        //Rigth SideBar
        Container(
          color: Color.fromRGBO(234, 228, 226, 1),
          child: widget.right,
          width: width,
        ),
        // Contingut Principal (central)
        AnimatedPositioned(
          duration: const Duration(milliseconds: millis),
          left: 0,
          right: isSidebarRightVisible ? width : 0,
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
      ],
      
    );
  }
}
