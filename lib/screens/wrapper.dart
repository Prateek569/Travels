import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/HOME.dart';
import 'package:flutter/material.dart';

import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context); //we sepcify what kind of data we use from provider

    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home(user: user,);
    }

  }
}