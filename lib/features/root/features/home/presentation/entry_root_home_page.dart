import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loyalty_wallet/features/root/features/home/presentation/pages/main_root_home_page/main_root_home_page.dart';

class EntryRootHomePage extends HookConsumerWidget {
  const EntryRootHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MainRootHomePage();
  }
}
