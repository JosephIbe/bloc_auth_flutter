import 'package:flutter_bloc_auth/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> loginUser(Map<String, dynamic> body);
  Future<UserModel> registerUser(Map<String, dynamic> body);
  Future<UserModel> getCurrentUser();
  Future<void> logOut();
}