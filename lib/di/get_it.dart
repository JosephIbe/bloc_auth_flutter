import 'package:flutter_bloc_auth/data/core/api_client.dart';
import 'package:flutter_bloc_auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_bloc_auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_bloc_auth/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init(){
  getItInstance.registerLazySingleton<APIClient>(() => APIClient());
  getItInstance.registerLazySingleton<UserRemoteDataSource>(
          () => UserRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(dataSource: getItInstance()));
}