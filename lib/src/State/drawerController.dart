import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerControllerStateCustom with ChangeNotifier {
  bool isOpen = true;

  bool get getDrawerStatus {
    return isOpen;
  }

  void setDrawerStatus() {
    isOpen = !isOpen;
    notifyListeners();
  }
}

void drawerController(BuildContext context) {
  Provider.of<DrawerControllerStateCustom>(context, listen: false)
      .setDrawerStatus();
}
