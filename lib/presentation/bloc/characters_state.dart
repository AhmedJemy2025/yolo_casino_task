import 'package:equatable/equatable.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';

abstract class CharactersState extends Equatable {}


class CharactersInitialState extends CharactersState{
  @override
  List<Object?> get props => [];
}

class CharactersInitialLoadingState extends CharactersState{
  @override
  List<Object?> get props => [];
}

class CharactersPagingLoadingState extends CharactersState{
  @override
  List<Object?> get props => [];
}

class CharactersInitialFailureState extends CharactersState{
  @override
  List<Object?> get props => [];
}

class CharactersPagingFailureState extends CharactersState{
  @override
  List<Object?> get props => [];
}

class CharactersInitialSuccessState extends CharactersState{

  final List<CharacterEntity> characters;

  CharactersInitialSuccessState(this.characters);

  @override
  List<Object?> get props => [characters];
}

class CharactersPagingSuccessState extends CharactersState{

  final List<CharacterEntity> characters;

  CharactersPagingSuccessState(this.characters);

  @override
  List<Object?> get props => [characters];
}






