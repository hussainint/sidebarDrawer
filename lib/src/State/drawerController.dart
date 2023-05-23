import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerControllerStateCustom with ChangeNotifier {
  bool isOpen = true;

  bool get getDrawerStatus {
    print('getting statua');
    return isOpen;
  }

  void setDrawerStatus() {
    print('changes in state');
    isOpen = !isOpen;
    notifyListeners();
  }
}

void drawerController(BuildContext context) {
  Provider.of<DrawerControllerStateCustom>(context, listen: false)
      .setDrawerStatus();
}
