import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loyalty_wallet/features/root/presentation/BLoC/fetch_store_bloc/fetch_store_bloc.dart';
import 'package:loyalty_wallet/features/root/presentation/screens/root_loading_screen.dart';
import 'package:loyalty_wallet/features/root/presentation/screens/root_success_screen.dart';

class MainRootPage extends HookConsumerWidget {
  const MainRootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<FetchStoreBloc, FetchStoreState>(builder: (context, state) {
      return state.map(initialState: (value) {
        return const RootLoadingScreen();
      }, loading: (value) {
        return const RootLoadingScreen();
      }, success: (value) {
        return const RootSuccessScreen();
      },);
    },);
  }
}
