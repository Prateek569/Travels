
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final User user;

  Home({this.user});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user.uid).userData,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            title: Text('Your Travel Itinerary'),
            backgroundColor: Colors.green[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person, color: Colors.white,),
                label: Text('logout', style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings, color: Colors.white,),
                label: Text('Add record',style: TextStyle(color: Colors.white)),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
        ),
        body: Container(

            child: BrewList(
            return FutureBuilder(
            future: Geolocator().getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best),
            Position pos = snapshot.data;
            userLatitude = pos.latitude;
            userLongitude = pos.longitude;
            ),
      ),
    )
    );
  }
}