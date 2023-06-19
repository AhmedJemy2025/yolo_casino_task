import 'package:bloc/bloc.dart';

import '../../domain/useCases/fetch_characters_usecase.dart';
import 'characters_event.dart';
import 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final FetchCharactersUseCase useCase;

  CharactersBloc(this.useCase) : super(CharactersInitialState()) {
    on<FetchFirstPage>(fetchFirstPage);
    on<LoadMoreData>(loadNextPage);
    on<RefreshPage>(refreshPage);
  }

  void fetchFirstPage(
      FetchFirstPage event, Emitter<CharactersState> emit) async {
    emit(CharactersInitialLoadingState());
    await  fetchData(1, emit);
  }

  void refreshPage(RefreshPage event, Emitter<CharactersState> emit) async {
    emit(CharactersInitialLoadingState());
    await fetchData(1, emit);
  }

  void loadNextPage(LoadMoreData event, Emitter<CharactersState> emit) async {
    emit(CharactersPagingLoadingState());
   await fetchData(event.page, emit);
  }

  fetchData(int page, Emitter<CharactersState> emit) async {
    var response = await useCase.fetchCharactersList(page);
    response.fold((error) {
      if (page == 1) {
        emit(CharactersInitialFailureState());
      } else {
        emit(CharactersPagingFailureState());
      }
    }, (characters) {
      if (page == 1) {

        emit(CharactersInitialSuccessState(characters));
      } else {
        emit(CharactersPagingSuccessState(characters));
      }
    });
  }
}
