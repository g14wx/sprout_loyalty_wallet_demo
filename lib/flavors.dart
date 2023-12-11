enum Flavor {
  storeone,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.storeone:
        return 'Store One';
      default:
        return 'title';
    }
  }

}
