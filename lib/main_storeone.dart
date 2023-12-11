import 'package:flutter/material.dart';

import 'flavors.dart';
import 'main_entry.dart';


Future<void> main() async {
  F.appFlavor = Flavor.storeone;
  runApp(const MyApp());
}