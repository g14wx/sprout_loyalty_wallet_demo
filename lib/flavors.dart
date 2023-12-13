enum Flavor {
  storeone,
  storetwo,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.storeone:
        return 'Store One';
      case Flavor.storetwo:
        return 'Store Two';
      default:
        return 'title';
    }
  }
}
