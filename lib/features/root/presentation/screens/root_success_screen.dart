import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:loyalty_wallet/constants/assets.dart';
import 'package:loyalty_wallet/router/constants/app_routes.dart';

class RootSuccessScreen extends HookConsumerWidget {
  const RootSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.of(context).pushNamed(AppRoutes.rootHome);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromWidth(300)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Lottie.asset(Assets.success01, repeat: false),
              ))),
    );
  }
}
