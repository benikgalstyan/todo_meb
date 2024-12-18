import 'package:todo_meb/data/repository/repository.dart';
import 'package:todo_meb/data/service/local_storage/local_storage_service.dart';
import 'package:todo_meb/data/service/network_service/network_service.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.networkService,
    required this.localStorageService,
  });

  final LocalStorageService localStorageService;
  final NetworkService networkService;
}
