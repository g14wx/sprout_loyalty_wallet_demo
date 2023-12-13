import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:loyalty_wallet/constants/assets.dart';
import 'package:loyalty_wallet/constants/test/widget_keys.dart';

class RootLoadingScreen extends StatelessWidget {
  const RootLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromWidth(400)),
              child: Padding(
                key: WidgetKeys.rootLoadingScreenKey,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Lottie.asset(Assets.loadingClock),
              ))),
    );
  }
}
