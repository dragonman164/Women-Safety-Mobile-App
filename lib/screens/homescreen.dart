import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;
  String _email,_pass;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage('assets/heart.png'),
          height: 4,
          width: 4,
        ),
        title: Text('Women Safety App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/woman.jpg'),
            ),
          ),
          SizedBox(height: 20,),

          Container(
            height: 60,
            width:  250,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Email Address',
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                _email = value;
              },
            ),
          ),
          Container(
            height: 60,
            width:  250,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Password',
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (value){
                _pass = value;
              },
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 40,
            width: 100,
            child: RaisedButton(
              elevation: 10,
              color: Colors.pink,
              child: Text('Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              onPressed: () async{


               try {

                  setState(() {
                    _loading = true;
                  });
                 final newUser = await _auth.signInWithEmailAndPassword(email: _email, password: _pass);
                 if(newUser != null)
                   Navigator.of(context).pushNamed(MainPage.routeName);


               } catch (e)
                {
                  _showAlert(context,e.toString());
                  print(e);
                }

              },
            ),
          ),
          SizedBox(height: 20,),
          _loading?SpinKitRotatingCircle(
            color: Colors.orange,
          ):Text('Click on Login Button to Sign in ')

        ],

      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

void _showAlert(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error while Signing In"),
        content: Text(text),
        actions: [
          RaisedButton(
            child: Text('Go Back'),
            color: Colors.blue,
            elevation: 20,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      )
  );
}