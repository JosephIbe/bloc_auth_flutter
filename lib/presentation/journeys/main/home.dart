import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/data/core/api_client.dart';
import 'package:flutter_bloc_auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_bloc_auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_bloc_auth/domain/repositories/user_repository.dart';

import 'explore/explore.dart';
import 'favorites/favorites.dart';
import 'home_main.dart';
import 'learn/learn.dart';
import 'settings/settings.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var currentIndex = 0;
  var children = [
    HomeMain(),
    Explore(),
    Learn(),
    Favorites(),
    Settings(),
  ];
  UserRemoteDataSource dataSource;
  UserRepository _repository;

  @override
  void initState() {
    super.initState();
    dataSource = UserRemoteDataSourceImpl(client: APIClient());
    _repository = UserRepositoryImpl(dataSource: dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Learn'),
            BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onTap: (value){
            setState(()=> currentIndex = value);
            _repository.getCurrentUser();
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 4.0,
          currentIndex: currentIndex,
          backgroundColor: Colors.white70,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}