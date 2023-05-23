import 'package:example/style.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuild custom drawer');
    return Container(
      color: clr_secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                // Image.asset(
                //   'asset/logo1.png',
                //   width: 130,
                // ),
                SizedBox(height: 30),
                const Text(
                  'MY INCONN',
                  style: st_lable_f12_white,
                ),
                const Divider(
                  color: Colors.black45,
                ),
              ],
            ),
          ),

          DrawerTile(
            title: 'My Actions',
            icn: Icons.safety_check,
            subOptions: [
              DrawerTile(
                title: 'My Work Order',
                icn: Icons.safety_check,
                // route: WorkOrderView.routeName,
              ),
              DrawerTile(title: 'My Assigned Tickets', icn: Icons.safety_check),
              DrawerTile(
                  title: 'My Pending Approvals', icn: Icons.safety_check),
              DrawerTile(title: 'My Store Tasks', icn: Icons.safety_check),
            ],
          ),

          ///
          DrawerTile(title: 'My requests & Approvals', icn: Icons.safety_check),

          ///
          DrawerTile(title: 'Attendance', icn: Icons.safety_check, subOptions: [
            DrawerTile(title: 'My Attendance', icn: Icons.safety_check),
            DrawerTile(title: 'My Schedule', icn: Icons.safety_check),
          ]),

          ///
          DrawerTile(title: 'Teams', icn: Icons.safety_check, subOptions: [
            DrawerTile(title: 'My Teams', icn: Icons.safety_check),
            DrawerTile(title: 'Teams Attendance', icn: Icons.safety_check),
          ]),

          ///
          DrawerTile(title: 'Reports', icn: Icons.safety_check, subOptions: [
            DrawerTile(title: 'My Reports', icn: Icons.safety_check),
            DrawerTile(title: 'My Store Stocks', icn: Icons.safety_check),
          ]),
        ],
      ),
    );
  }
}

class DrawerTile extends StatefulWidget {
  String title;
  IconData icn;
  String route;

  List<DrawerTile>? subOptions;
  DrawerTile({
    required this.title,
    required this.icn,
    this.subOptions,
    this.route = '',
  });

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  bool showChildren = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          if (widget.subOptions != null) {
            setState(() {
              showChildren = !showChildren;
            });
          } else {
            // context.go(widget.route);
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 35, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        widget.icn,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      FittedBox(
                        child: Text(
                          widget.title,
                          style: st_lable_f14_white,
                        ),
                      ),
                    ],
                  ),
                  if (widget.subOptions != null)
                    showChildren
                        ? const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 20,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                ],
              ),
              if (widget.subOptions != null && showChildren)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.subOptions!.length,
                  itemBuilder: (ctx, i) {
                    return widget.subOptions![i];
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
