import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';

class LayoutPartRight extends StatefulWidget {
  const LayoutPartRight({Key? key}) : super(key: key);

  @override
  LayoutPartRightState createState() => LayoutPartRightState();
}

class LayoutPartRightState extends State<LayoutPartRight> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Container(
      width: double.infinity, // Expandeix l'ample
      height: double.infinity, // Expandeix l'alt
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinea els elements a la esquerra
        children: [Text("He probat moltes coses pero ninguna ha funcionat per posar-lo a la dreta")],
      ),
    );
  }
}
