import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Responsive/responsive.dart';
import 'State/drawerController.dart';

class SidebarDrawer extends StatelessWidget {
  Widget body;
  Widget drawer;
  SidebarDrawer({
    required this.body,
    required this.drawer,
  });
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
          return Row(
            children: [
              if (model.getDrawerStatus)
                Container(
                  width: 300,
                  child: drawer,
                ),
              Expanded(child: body),
            ],
          );
        } else {
          return Stack(
            children: [
              body,
              if (model.getDrawerStatus)
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65 > 300
                            ? 300
                            : MediaQuery.of(context).size.width * 0.65,
                        child: drawer,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            drawerController(context);
                          },
                          child: Container(
                            color: Colors.black12.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      },
      icon: const Icon(Icons.menu),
    );
  }
}
