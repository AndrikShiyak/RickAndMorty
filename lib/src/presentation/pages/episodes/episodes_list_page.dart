import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import '../../../core/enums/view_state.dart';
import '../../../injector.dart';
import '../../blocs/remote_episodes_list/remote_episodes_list_bloc.dart';
import '../../widgets/card_widget/episode_card.dart';

class EpisodesListPage extends HookWidget {
  const EpisodesListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteEpisodesListBloc>(
      create: (context) => injector()..add(const GetEpisodes()),
      child: const EpisodesListView(),
    );
  }
}

class EpisodesListView extends HookWidget {
  const EpisodesListView({super.key});

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
          'Episodes',
        ),
      ),
      body: BlocBuilder<RemoteEpisodesListBloc, RemoteEpisodesListState>(
        builder: (_, state) {
          if (state.status == ViewState.loading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status == ViewState.error) {
            return const Center(child: Icon(Ionicons.refresh));
          }
          if (state.status == ViewState.success) {
            return ListView(
              controller: scrollController,
              children: [
                // Items
                ...List<Widget>.from(
                  state.episodes!.map(
                    (e) => Builder(
                      builder: (context) => EpisodeCard(episode: e),
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
    final remoteEpisodesBloc = BlocProvider.of<RemoteEpisodesListBloc>(context);
    final noMoreData = remoteEpisodesBloc.state.noMoreData;

    if (currentScroll == maxScroll && !noMoreData) {
      remoteEpisodesBloc.add(const GetEpisodes());
    }
  }
}
