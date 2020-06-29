import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_hospital/models/user.dart';
import 'package:smart_hospital/services/database.dart';
import 'package:smart_hospital/shaded/constants.dart';
import 'package:smart_hospital/shaded/loading.dart';
import 'package:smart_hospital/shaded/reusable_card.dart';
import 'package:smart_hospital/shaded/rounded_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';



class PersonSettings extends StatefulWidget {
  @override
  _PersonSettingsState createState() => _PersonSettingsState();
}

class _PersonSettingsState extends State<PersonSettings> {
  final _formKey = GlobalKey<FormState>();
  String _currentName;
  String _currentJobe;
  String _currentPhone;
  int    _currentAge = 20;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
        UserData userData =snapshot.data;
            return StreamBuilder<UserData>(
              stream:DatabaseService(uid:user.uid).userData,
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '(Update Your Profile)',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                initialValue: userData.name,
                                decoration: kTextInputDecoration.copyWith(hintText:'name'),
                                validator: (val) => val.isEmpty ? 'Name' : null,
                                onChanged: (val) => setState(() => _currentName = val),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                initialValue: userData.jobe,
                                decoration: kTextInputDecoration.copyWith(hintText: 'jobe'),
                                validator: (val) => val.isEmpty ? 'jobe' : null,
                                onChanged: (val) => setState(() => _currentJobe = val),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex:3,
                                child: ReusableCard(
                                  colour: kInactiveColour,
                                  cardWidget: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          'Age',
                                          style: kLabelTextStyle,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text(
                                            _currentAge.toString(),
                                            style: kNumberTextStyle,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          RoundedButton(
                                            icon: FontAwesomeIcons.plus,
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {

                                                _currentAge++;
                                                if (_currentAge >= 120) {
                                                  _currentAge = 20;
                                                  Alert(
                                                    context: context,
                                                    title: "Attention",
                                                    desc: "Enter correct age please",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text('close'),
                                                        onPressed: () {
                                                          setState(() {
                                                            Navigator.pop(context);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ).show();
                                                }
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          RoundedButton(
                                            icon: FontAwesomeIcons.minus,
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                _currentAge--;
                                                if (_currentAge <= 5) {
                                                  _currentAge = 20;
                                                  Alert(
                                                    context: context,
                                                    title: "Attention",
                                                    desc: "Enter correct age please",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text('close'),
                                                        onPressed: () {
                                                          setState(() {
                                                            Navigator.pop(context);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ).show();
                                                }
                                              });
                                            },
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                              Flexible(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        keyboardType:TextInputType.phone ,
                                        initialValue: userData.phone,
                                        decoration:kTextInputDecoration.copyWith(hintText: 'phone'),
                                       validator: (val) => val.isEmpty ? 'phone ' : null,
                                        onChanged: (val) => setState(
                                              () {
                                             _currentPhone = val;
                                            if (val.length > 11) {
                                              Alert(
                                                context: context,
                                                title: "Attention",
                                                desc: "Enter correct phone number",
                                                buttons: [
                                                  DialogButton(
                                                    child: Text('close'),
                                                    onPressed: () {
                                                      setState(() {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ).show();
                                            }
                                          },
                                        ),
                                      ),
                                    ),

                                    Flexible(
                                      child: RaisedButton(
                                          color: Colors.blueAccent,
                                          child: Text(
                                            'Update',
                                            style: TextStyle(color: kFontTextStyle),
                                          ),
                                          onPressed: () async {
                                           if (_formKey.currentState.validate()){
                                             await DatabaseService(uid:user.uid).
                                             updateUserData(_currentName??userData.name,
                                                 _currentJobe??userData.jobe,
                                                 _currentAge??userData.age,
                                                 _currentPhone??userData.phone
                                             );
                                             Navigator.pop(context);
                                           }
                                          }),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                else {
                  return Loading();
                }

              }
            );
        }
        );
  }
}
