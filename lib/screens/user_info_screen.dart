import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/utils/authentication.dart';
import 'package:flutter_firebase_auth/screens/sign_in_screen.dart';
import 'package:flutter_firebase_auth/res/custom_colors.dart';

class UserInfoScreen extends StatefulWidget {
    UserInfoScreen({ @required this.user });
    
    final User user;
    
    @override
    _UserInfoScreenState createState() => _UserInfoScreenState(user: user);
}

class _UserInfoScreenState extends State<UserInfoScreen> {
    _UserInfoScreenState({ @required this.user });
    
    final User user;
    bool _isSigningOut = false;
    
    Route _routeToSignInScreen() {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(-1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                
                return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                );
            }
        );
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('User Info'),
            ),
            body: Center(
                child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                                '${user.displayName}',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        Text(
                            '${user.email}',
                            style: TextStyle(
                                fontSize: 14.0,
                            ),
                        ),
                        _isSigningOut ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ) : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent,
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                ),
                            ),
                            onPressed: () async {
                                setState(() {
                                    _isSigningOut = true;
                                });
                                
                                await Authentication.signOut(context: context);
                                
                                setState(() {
                                    _isSigningOut = false;
                                });
                                
                                Navigator.of(context).pushReplacement(_routeToSignInScreen());
                            },
                            
                            child: Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Text(
                                    'Sign Out',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 2,
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
