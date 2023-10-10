import 'package:cupertino_base/widget_popover.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

class LayoutPartCentralState extends State<LayoutPartCentral> {
  GlobalKey _settingsButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: appData.toggleSidebarLeft,
                  child: Icon(
                    CupertinoIcons.sidebar_left,
                    color: appData.isSidebarLeftVisible
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.black,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),
              const SizedBox(width: 16),
            ],
          ),

          
          trailing : CupertinoButton(
            key: _settingsButtonKey,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              WidgetPopover.showPopover(
                context: context,
                key: _settingsButtonKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                      onTap: () {
                        print("Opció 1 premuda");
                        WidgetPopover.hidePopover();
                      },
                    child: Text('Opció 1'),
                    ),
                      GestureDetector(
                      onTap: () {
                        print("Opció 2 premuda");
                        WidgetPopover.hidePopover();
                    },
                    child: Text('Opció 2'),
                      ),
                    ],
                  ),
                ));
    },
    child: const Icon(
      CupertinoIcons.settings,
      color: CupertinoColors.black,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
  ),
          middle: Text("hola"),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Central")],
          ),
        ));
  }
}
