import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loyalty_wallet/features/root/presentation/BLoC/fetch_store_bloc/fetch_store_bloc.dart';
import 'package:loyalty_wallet/features/root/presentation/pages/main_root_page.dart';

class EntryRootPage extends HookConsumerWidget {
  const EntryRootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      BlocProvider.of<FetchStoreBloc>(context).add(const FetchStoreEvent.tryToFetchStoreInformation());
      return null;
    }, []);

    return const MainRootPage();
  }
}
