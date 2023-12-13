// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_wallet/constants/stores/stores.dart';
import 'package:loyalty_wallet/features/my_app/my_app.dart';
import 'package:loyalty_wallet/flavors.dart';

import 'package:loyalty_wallet/services/data_storage/protocols/i_initialization_of_data_storage_service.dart';
import 'package:loyalty_wallet/services/env_services/env_resolver.dart';
import 'package:loyalty_wallet/services/env_services/models/store_from_env_model/store_from_env_model.dart';
import 'package:loyalty_wallet/services/service_locator/service_locator_setup.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.testTextInput.register();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(const MethodChannel('plugins.flutter.io/path_provider'), (MethodCall methodCall) async {
    return '.';
  });
  setUpAll(() async {
    HttpOverrides.global = null;
    GoogleFonts.config.allowRuntimeFetching = false;
    F.appFlavor = Flavor.storeone;
    const StoreFromEnvModel selectedStore = Stores.storeOne;
    EnvResolver.currentStore = selectedStore;
    const String envFile = ".env.test";
    dotenv.testLoad(fileInput: envFile, mergeWith: {"STORE_ID": selectedStore.id.toString()});
    configureDependencies("test_${selectedStore.nameEnv}");
    // this is for make it works the next line and localize the IInitializationOfDataStorageService instance
    final getIt = GetIt.instance;
    // init secure local storage (Hive)
    final initDataStorage = getIt<IInitializationOfDataStorageService>();
    // init hive configuration storage
    await initDataStorage.initializationOfDataStorageService();
  });
  group('test app', () {
    testWidgets('Check texts', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pump();
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));
      // Giving
      final appBarTitleHomeEnglish = find.text("Dashboard");
      // when
      // # this is necessary to skip one frame
      await tester.pumpAndSettle();
      // Then
      expect(appBarTitleHomeEnglish, findsOneWidget);
    });
  });
}
