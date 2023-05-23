import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerControllerStateCustom with ChangeNotifier {
  bool isOpen = true;
  bool isLayoutWeb = true;

  bool get getDrawerStatus {
    return isOpen;
  }

  void setDrawerStatus() {
    isOpen = !isOpen;
    notifyListeners();
  }

  ///
  bool get is_Layout_Web {
    return isLayoutWeb;
  }

  void setLayoutAsWeb(bool isWeb) {
    isLayoutWeb = isWeb;
  }
}

// void drawerController(BuildContext context) {
//   Provider.of<DrawerControllerStateCustom>(context, listen: false)
//       .setDrawerStatus();
// }
