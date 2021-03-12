import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_bloc_auth/data/models/user_model.dart';
import 'package:flutter_bloc_auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {

  final UserRemoteDataSource dataSource;
  UserRepositoryImpl({@required this.dataSource});

  @override
  Future<UserModel> loginUser(Map<String, dynamic> body) async {
    final user = await dataSource.loginUser(body); // here im calling it
    return user;
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> body) async {
    final user = await dataSource.registerUser(body);
    return user;
  }

  @override
  Future<UserModel> getCurrentUser() async {

  }

  @override
  Future<void> logOut() async {
    await dataSource.logOut();
  }

}