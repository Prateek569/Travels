
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/description.dart';
import 'package:flutter/material.dart';


class BrewTile extends StatelessWidget {

  final UserData userData;
  final List description;
  final List title;
  final int index;
  BrewTile({ this.userData, this.index, this.description, this.title});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(

          leading: CircleAvatar(
            radius: 25.0,
            child: Text('day ${index}'),
            backgroundColor: Colors.green[400],
            foregroundColor: Colors.white,
          ),
          title: Text(userData.title[index-1] ?? ''),
          trailing: FlatButton.icon(
            icon: Icon(Icons.description, color: Colors.green,),
            label: Text('explore',style: TextStyle(color: Colors.green)),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => explore(description: description[index-1],title: title[index-1],)),
              );
            }
          )
        ),
      ),
    );
  }


}
