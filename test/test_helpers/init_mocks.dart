import 'package:mockito/annotations.dart';
import 'package:yolo_casino_task/data/dataSources/characters_remote_data_source.dart';
import 'package:yolo_casino_task/data/repository/characters_repository_impl.dart';

@GenerateMocks([CharactersRemoteDataSource, CharactersRepositoryImpl],
    customMocks: [])
void main() {}
