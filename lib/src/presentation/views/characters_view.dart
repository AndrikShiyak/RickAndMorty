import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../core/bloc/bloc_with_state.dart';
import '../blocs/remote_characters/bloc/remote_characters_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/character_widget.dart';

class CharactersView extends HookWidget {
  const CharactersView({super.key});

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteCharactersBloc = BlocProvider.of<RemoteCharactersBloc>(context);
    // final state = remoteCharactersBloc.blocProcessState;

    if (currentScroll == maxScroll
        // && state == BlocProcessState.idle
        ) {
      remoteCharactersBloc.add(const GetCharacters());
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters View',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteCharactersBloc, RemoteCharactersState>(
        builder: (_, state) {
          print('dskfsjdfdfgfdg ${state.characters?.length}');

          if (state.status == CharactersStatus.loading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status == CharactersStatus.error) {
            return const Center(child: Icon(Ionicons.refresh));
          }
          if (state.status == CharactersStatus.success) {
            return ListView(
              controller: scrollController,
              children: [
                // Items
                ...List<Widget>.from(
                  state.characters!.map(
                    (e) => Builder(
                      builder: (context) => CharacterWidget(
                        character: e,
                      ),
                    ),
                  ),
                ),

                // add Loading (circular progress indicator at the end),
                // if there are more items to be loaded
                if (state.noMoreData)
                  const SizedBox()
                else
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: CupertinoActivityIndicator(),
                  ),
              ],
            );
          }
          return const SizedBox();
        },
      ),

      //     BlocBuilder<RemoteCharactersBloc, RemoteCharactersState>(
      //   builder: (_, state) {
      //     print('dskfsjdfdfgfdg ${state.characters?.length}');

      //     if (state is RemoteCharactersLoading) {
      //       return const Center(child: CupertinoActivityIndicator());
      //     }
      //     if (state is RemoteCharactersError) {
      //       return const Center(child: Icon(Ionicons.refresh));
      //     }
      //     if (state is RemoteCharactersDone) {
      //       return ListView(
      //         controller: scrollController,
      //         children: [
      //           // Items
      //           ...List<Widget>.from(
      //             state.characters!.map(
      //               (e) => Builder(
      //                 builder: (context) => CharacterWidget(
      //                   character: e,
      //                 ),
      //               ),
      //             ),
      //           ),

      //           // add Loading (circular progress indicator at the end),
      //           // if there are more items to be loaded
      //           if (state.noMoreData)
      //             const SizedBox()
      //           else
      //             const Padding(
      //               padding: EdgeInsets.symmetric(vertical: 14),
      //               child: CupertinoActivityIndicator(),
      //             ),
      //         ],
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),
    );
  }
}
