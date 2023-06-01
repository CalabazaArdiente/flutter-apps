import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktox/presentation/providers/providers.dart';
import 'package:tiktox/presentation/widgets/widgets.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<
        DiscoverProvider>(); //! watch sirve para estar observando los cambios del provider

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              )
            : VideoScrollWidget(videos: discoverProvider.videos));
  }
}
