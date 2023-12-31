// Mocks generated by Mockito 5.4.2 from annotations
// in yolo_casino_task/test/test_helpers/init_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:yolo_casino_task/core/mapper/mapper.dart' as _i5;
import 'package:yolo_casino_task/core/models/failure.dart' as _i12;
import 'package:yolo_casino_task/data/dataSources/characters_remote_data_source.dart'
    as _i7;
import 'package:yolo_casino_task/data/models/character_model.dart' as _i10;
import 'package:yolo_casino_task/data/models/characters_response.dart' as _i3;
import 'package:yolo_casino_task/data/repository/characters_repository_impl.dart'
    as _i9;
import 'package:yolo_casino_task/domain/dataSources/characters_data_source.dart'
    as _i4;
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCharactersResponse_1 extends _i1.SmartFake
    implements _i3.CharactersResponse {
  _FakeCharactersResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCharactersDataSource_2 extends _i1.SmartFake
    implements _i4.CharactersDataSource {
  _FakeCharactersDataSource_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMapper_3<T, Y> extends _i1.SmartFake implements _i5.Mapper<T, Y> {
  _FakeMapper_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_4<L, R> extends _i1.SmartFake implements _i6.Either<L, R> {
  _FakeEither_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CharactersRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharactersRemoteDataSource extends _i1.Mock
    implements _i7.CharactersRemoteDataSource {
  MockCharactersRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);
  @override
  _i8.Future<_i3.CharactersResponse> fetchCharactersList(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchCharactersList,
          [page],
        ),
        returnValue:
            _i8.Future<_i3.CharactersResponse>.value(_FakeCharactersResponse_1(
          this,
          Invocation.method(
            #fetchCharactersList,
            [page],
          ),
        )),
      ) as _i8.Future<_i3.CharactersResponse>);
}

/// A class which mocks [CharactersRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharactersRepositoryImpl extends _i1.Mock
    implements _i9.CharactersRepositoryImpl {
  MockCharactersRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.CharactersDataSource get dataSource => (super.noSuchMethod(
        Invocation.getter(#dataSource),
        returnValue: _FakeCharactersDataSource_2(
          this,
          Invocation.getter(#dataSource),
        ),
      ) as _i4.CharactersDataSource);
  @override
  _i5.Mapper<_i10.CharacterModel, _i11.CharacterEntity> get mapper =>
      (super.noSuchMethod(
        Invocation.getter(#mapper),
        returnValue: _FakeMapper_3<_i10.CharacterModel, _i11.CharacterEntity>(
          this,
          Invocation.getter(#mapper),
        ),
      ) as _i5.Mapper<_i10.CharacterModel, _i11.CharacterEntity>);
  @override
  _i8.Future<_i6.Either<_i12.Failure, List<_i11.CharacterEntity>>>
      fetchCharactersList(int? page) => (super.noSuchMethod(
            Invocation.method(
              #fetchCharactersList,
              [page],
            ),
            returnValue: _i8.Future<
                    _i6.Either<_i12.Failure, List<_i11.CharacterEntity>>>.value(
                _FakeEither_4<_i12.Failure, List<_i11.CharacterEntity>>(
              this,
              Invocation.method(
                #fetchCharactersList,
                [page],
              ),
            )),
          ) as _i8
              .Future<_i6.Either<_i12.Failure, List<_i11.CharacterEntity>>>);
}
