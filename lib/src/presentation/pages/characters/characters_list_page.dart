import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import '../../../injector.dart';
import '../../blocs/remote_characters_list/remote_characters_list_bloc.dart';
import '../../widgets/card_widget/character_card.dart';

class CharactersListPage extends HookWidget {
  const CharactersListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharactersListBloc>(
      create: (context) => injector()..add(const GetCharacters()),
      child: const CharactersListView(),
    );
  }
}

class CharactersListView extends HookWidget {
  const CharactersListView({super.key});

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
          'Characters',
        ),
      ),
      body: BlocBuilder<RemoteCharactersListBloc, RemoteCharactersListState>(
        builder: (_, state) {
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
                      builder: (context) => CharacterCard(character: e),
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
    );
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteCharactersBloc =
        BlocProvider.of<RemoteCharactersListBloc>(context);

    if (currentScroll == maxScroll) {
      remoteCharactersBloc.add(const GetCharacters());
    }
  }
}
