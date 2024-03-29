import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Responsive/responsive.dart';
import 'State/drawerController.dart';

class SidebarDrawer extends StatefulWidget {
  final Widget body;
  final Widget drawer;
  SidebarDrawer({
    required this.body,
    required this.drawer,
  });

  @override
  State<SidebarDrawer> createState() => _SidebarDrawerState();
}

class _SidebarDrawerState extends State<SidebarDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool status =
    //     Provider.of<DrawerControllerStateCustom>(context, listen: true)
    //         .getDrawerStatus;

    return ChangeNotifierProvider(
      create: (context) => DrawerControllerStateCustom(),
      child: Consumer<DrawerControllerStateCustom>(
          builder: (context, model, child) {
        if (Responsive.isDesktop(context)) {
          if (!model.getDrawerStatus && !model.isLayoutWeb) {
            model.setDrawerStatus();
          }
          model.setLayoutAsWeb(true);

          ///
          return Row(
            children: [
              if (model.getDrawerStatus)
                SizedBox(
                  width: 300,
                  child: widget.drawer,
                ),
              Expanded(child: widget.body),
            ],
          );
        } else {
          return Stack(
            children: [
              widget.body,
              if (model.getDrawerStatus && !model.isLayoutWeb)
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65 > 300
                          ? 300
                          : MediaQuery.of(context).size.width * 0.65,
                      child: widget.drawer,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          model.setDrawerStatus();
                        },
                        child: Container(
                          color: Colors.black12.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          );
        }
      }),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Provider.of<DrawerControllerStateCustom>(context, listen: false)
            .setDrawerStatus();

        ///
        Provider.of<DrawerControllerStateCustom>(context, listen: false)
            .setLayoutAsWeb(Responsive.isDesktop(context));
      },
      icon: const Icon(Icons.menu),
    );
  }
}
