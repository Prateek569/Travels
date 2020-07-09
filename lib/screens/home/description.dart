import 'package:flutter/material.dart';


class explore extends StatelessWidget {

  final String title;
  final String description;

  const explore({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green,

          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: FlatButton.icon(onPressed:null, icon: Icon(Icons.edit, color: Colors.white,), label: Text('edit', style: TextStyle(color: Colors.white))),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: FlatButton.icon(onPressed: null, icon: Icon(Icons.delete, color: Colors.white,), label: Text('Delete', style: TextStyle(color: Colors.white),)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: FlatButton.icon(onPressed:null, icon: Icon(Icons.location_on, color: Colors.white,), label: Text('nearby', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
           body: Padding(
               padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
               child: Column(
                    children: <Widget>[
                       Expanded(child: Text(title)),
                          Expanded(child: Text(description)),
                   ],
                 ),
              ),

          );
      }
}
