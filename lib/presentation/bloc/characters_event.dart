import 'package:equatable/equatable.dart';

abstract class CharactersEvent extends Equatable{}

class FetchFirstPage extends CharactersEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoadMoreData extends CharactersEvent {
  final int page;
  LoadMoreData(this.page);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RefreshPage extends CharactersEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}




