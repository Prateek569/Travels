import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currenttitle;
  String _dataadded;


  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    'Add to your list',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(

                    decoration: textInputDecoration.copyWith(hintText: 'enter title'),
                    validator: (val) => val.isEmpty ? 'Please enter a title' : null,
                    onChanged: (val) => setState(() => _currenttitle = val),
                  ),

                  SizedBox(height: 20.0),

                  TextFormField(

                      decoration: textInputDecoration,
                      validator: (val) => val.isEmpty ? 'Please enter a data' : null,
                      onChanged: (val) => setState(() => _dataadded = val),
                    ),

                  SizedBox(height: 20.0),

                  RaisedButton(
                      color: Colors.green[400],
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentName ?? snapshot.data.name,
                            _dataadded ?? '',
                            _currenttitle ?? '',
                          );
                          Navigator.pop(context);
                        }
                      }
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        }
    );
  }
}