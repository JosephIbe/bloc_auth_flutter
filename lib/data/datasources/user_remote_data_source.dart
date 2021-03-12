import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/data/core/api_client.dart';
import 'package:flutter_bloc_auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginUser(Map<String, dynamic> body);
  Future<UserModel> registerUser(Map<String, dynamic> body);
  // Future<User> sendOTP();
  // Future<User> verifyOTP();
  Future<UserModel> getCurrentUser();
  Future<void> logOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {

  final APIClient client;
  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserModel> loginUser(Map<String, dynamic> body) async {
    final response = await client.postAuthData('login', body);
    final user = UserModel.fromJSON(response);
    return user;
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> body) async {
    final response = await client.postAuthData('register', body);
    final user = UserModel.fromJSON(response);
    return user;
  }

  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    await client.postAuthData('logout', null);
  }

}