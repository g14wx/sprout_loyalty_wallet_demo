part of "main_root_home_page.dart";

extension MainRootHomePageFunctions on MainRootHomePage {
  _getBackgroundColorBottomNavigationBar(int selectedIndex, BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  void onItemTapped(int index, BuildContext context) {
    original_provider.Provider.of<NavigatorKeysProvider>(listen: false, context).setSelectedIndexDrawer(index);
  }
}
