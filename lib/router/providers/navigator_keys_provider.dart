import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:loyalty_wallet/router/constants/navigator_keys.dart';

@injectable
class NavigatorKeysProvider extends ChangeNotifier {
  int _selectedIndexDrawer = 0;
  // this are for preserving the state of each navigation key
  final GlobalKey<NavigatorState> navigationDefault = NavigatorKeys.navigationDefault;
  // root navigation keys
  final GlobalKey<NavigatorState> navigationHome = NavigatorKeys.navigationHome;
  final GlobalKey<NavigatorState> navigationHomePoints = NavigatorKeys.navigationHomePoints;
  final GlobalKey<NavigatorState> navigationHomeSettings = NavigatorKeys.navigationHomeSettings;
  // this is not final due to it will be replaced everytime that the user changes the bottom item
  late GlobalKey<NavigatorState> currentNavigationKey;
  NavigatorKeysProvider() {
    currentNavigationKey = navigationHome;
  }
  void setSelectedIndexDrawer(int index) {
    _selectedIndexDrawer = index;
    _setCurrentNavigationKey();
    notifyListeners();
  }

  _setCurrentNavigationKey() {
    switch (_selectedIndexDrawer) {
      case 0:
        currentNavigationKey = navigationHome;
        break;
      case 2:
        currentNavigationKey = navigationHomePoints;
        break;
      case 1:
        currentNavigationKey = navigationHomeSettings;
        break;
      default:
    }
  }

  int get selectedIndexDrawer => _selectedIndexDrawer;
}
