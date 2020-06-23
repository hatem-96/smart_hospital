import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:smart_hospital/services/auth.dart';
import 'package:smart_hospital/shaded/constants.dart';
import 'package:smart_hospital/shaded/loading.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading =false;
  //text field state
  String email = '';
  String password = '';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                   // padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: Image.asset('images/smart-hospitals.jpg'),
                    height:35.0,
                  ),
                ),
                SizedBox(width: 20.0,),

                Flexible(
                  child: TypewriterAnimatedTextKit(
                    text: ["Hospital Registration.."],
                    totalRepeatCount: 4,
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                //  check the user sign in or not
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            textAlign:TextAlign.center,
                            decoration:kTextInputDecoration.copyWith(hintText: 'Enter your email'),
                            keyboardType: TextInputType.emailAddress,

                            validator: (val) =>
                                val.isEmpty ? 'Enter your Email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 3.0,),
                          TextFormField(
                            textAlign:TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            decoration:kTextInputDecoration.copyWith(hintText: 'Enter your Password'),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter a pass 6+ chars long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal:20.0),
                    color: Colors.blueAccent,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() =>loading =true);
                        dynamic result =await _auth.registerWithEmailAndPassword(email,password);
                        if (result==null){
                          setState(() {
                            error = 'please enter a valid email';
                            loading= false ;
                          });
                        }

                      }
                    },
                  ),
                  SizedBox(

                    width: 20.0,
                  ),
                  FlatButton.icon(
                      padding: EdgeInsets.symmetric(horizontal:20.0),
                      onPressed: () {
                        widget.toggleView();
                      },
                      icon: Icon(Icons.person),
                      label: Text('LogIn')),

                ],
              ),
            ),

            Flexible(
              child: Text (error,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,fontSize: 18.0
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
