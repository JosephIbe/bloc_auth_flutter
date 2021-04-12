import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/data/core/api_client.dart';
import 'package:flutter_bloc_auth/data/core/api_constants.dart';
import 'package:flutter_bloc_auth/data/models/user_model.dart';
import 'package:flutter_bloc_auth/data/models/user_response_model.dart';
import 'package:flutter_bloc_auth/domain/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginUser(Map<String, dynamic> body);
  Future<UserModel> registerUser(Map<String, dynamic> body);
  // Future<User> sendOTP();
  // Future<User> verifyOTP();
  Future<UserModel> getCurrentUser(String userId);
  Future<void> logOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {

  final APIClient client;
  var storage = FlutterSecureStorage();
  UserRepository repository;
  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserModel> loginUser(Map<String, dynamic> body) async {
    final response = await client.postAuthData('login', body);
    final userResponseModel = UserResponseModel.fromJSON(response);

    final accessToken = userResponseModel.accessToken;
    final refreshToken = userResponseModel.refreshToken;

    await storage.write(key: APIConstants.ACCESS_TOKEN_KEY, value: accessToken)
            .then((value) => print('AccessToken Written to FSS'));
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY, value: refreshToken)
            .then((value) => print('RefreshToken Written to FSS'));

    String userId = userResponseModel.user.id;
    await storage.write(key: APIConstants.USER_ID_KEY, value: userId)
            .then((value) => print('UserID Written to FSS'));

    return userResponseModel.user;
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> body) async {
    final response = await client.postAuthData('register', body);
    final userResponseModel = UserResponseModel.fromJSON(response);

    final accessToken = userResponseModel.accessToken;
    final refreshToken = userResponseModel.refreshToken;

    await storage.write(key: APIConstants.ACCESS_TOKEN_KEY, value: accessToken)
          .then((value) => print('AccessToken Written to FSS'));
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY, value: refreshToken)
          .then((value) => print('AccessToken Written to FSS'));

    String userId = userResponseModel.user.id;
    await storage.write(key: APIConstants.USER_ID_KEY, value: userId)
        .then((value) => print('UserID Written to FSS'));

    return userResponseModel.user;
  }

  @override
  Future<UserModel> getCurrentUser(String id) {
    return null;
  }

  @override
  Future<void> logOut() async {
    await client.postAuthData('logout', null);
  }

}