import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/data/models/user_model.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{

  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class UserSignedUp extends AuthenticationEvent {
  final UserModel user;

  const UserSignedUp({
    @required this.user,
  });

  @override
  List<Object> get props => [user, ];

}

class UserLoggedIn extends AuthenticationEvent {
  final UserModel user;
  // final String accessToken;
  // final String refreshToken;

  const UserLoggedIn({
    @required this.user,
    // this.accessToken,
    // this.refreshToken
  });

  @override
  List<Object> get props => [user];
}

class UserRequestsOTP extends AuthenticationEvent {
  final int phone;
  UserRequestsOTP({@required this.phone});

  @override
  List<Object> get props => [phone];

}

class UserLoggedOut extends AuthenticationEvent {}