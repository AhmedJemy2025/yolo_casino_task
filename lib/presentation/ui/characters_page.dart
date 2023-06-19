import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';
import 'package:yolo_casino_task/presentation/ui/components/characted_item.dart';

import '../bloc/characters_bloc.dart';
import '../bloc/characters_event.dart';
import '../bloc/characters_state.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final bloc = GetIt.instance.get<CharactersBloc>();

  var pageKey = 1;

  final PagingController<int, CharacterEntity> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (BuildContext context) =>
        GetIt.instance.get<CharactersBloc>()..add(FetchFirstPage()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    _pagingController.addPageRequestListener(
      (pageKey) => bloc.add(LoadMoreData(pageKey)),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    _pagingController.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<CharactersBloc, CharactersState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CharactersInitialFailureState ||
            state is CharactersPagingFailureState) {
          _pagingController.error = "Error Loading Data";
        }
        if (state is CharactersInitialSuccessState) {
          _pagingController.appendPage(state.characters, pageKey++);
        }

        if (state is CharactersPagingSuccessState) {
          if (state.characters.length != 20) {
            _pagingController.appendLastPage(state.characters);
          } else {
            _pagingController.appendPage(state.characters, pageKey++);
          }
        }
      },
      child: BlocBuilder<CharactersBloc, CharactersState>(
        bloc: bloc,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(() {
              bloc.add(RefreshPage());
              _pagingController.refresh();
            }),
            child: PagedListView<int, CharacterEntity>(
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                itemExtent: 140,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<CharacterEntity>(
                    itemBuilder: (context, character, index) => CharacterItem(
                          character: character,
                        ))),
          );
        },
      ),
    );
  }
}
