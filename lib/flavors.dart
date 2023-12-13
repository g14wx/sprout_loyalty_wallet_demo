enum Flavor {
  storeone,
  storetwo,
  storethree,
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
      case Flavor.storethree:
        return 'Store Three';
      default:
        return 'title';
    }
  }
}
