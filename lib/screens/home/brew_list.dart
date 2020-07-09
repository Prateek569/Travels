
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final dataOfUser = Provider.of<UserData>(context) ?? [];
    UserData userData = dataOfUser;
    return ListView.builder(
      itemCount: userData.title.length,
      itemBuilder: (context, index) {
        return BrewTile(userData: userData, index: index+1, description: userData.description, title: userData.title,);
      },
    );
  }
}