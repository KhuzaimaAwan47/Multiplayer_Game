import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState  extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool isPasswordVisible = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try{
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
  }
  }

  Widget _entryField(
      String title,
      TextEditingController controller, {
        required IconData prefixIcon,
        Widget? suffixIcon,
        bool obscureText = false,
      })
  {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          //labelText: title,
          hintText: title,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
          ),
          contentPadding: EdgeInsets.all(10)
      ),
    );
  }

  Widget _errorMessage(){
    return ScaffoldMessenger(child: Text('$errorMessage'));
    //return Text(errorMessage == '' ? '' : 'Humm? $errorMessage');
  }
  Widget _submitButton(){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'Register',style: TextStyle(fontSize: 16),)
    );
  }
  Widget _loginOrRegisterButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLogin ? 'Don\'t have an account? ' : 'Already have an account? '),
        TextButton(
            onPressed: (){
              setState(() {
                isLogin = !isLogin;
              });
            },
            child: Text(isLogin ? 'Register instead' : 'Login instead')
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.grey[200],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            _entryField(
                'Email',
                _controllerEmail,
                prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: 20),
            _entryField(
                'Password',
                _controllerPassword,
                prefixIcon: Icons.lock_outline,
                obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(isPasswordVisible ? Icons.visibility:Icons.visibility_off,
                  color: Colors.black87,
                ),
                onPressed: ()
                {
                  setState((){
                    isPasswordVisible  =  !isPasswordVisible;
                  });

                },),
            ),
            SizedBox(height: 10),
            _errorMessage(),
            SizedBox(height: 20),
            _submitButton(),
            _loginOrRegisterButton()
          ],
        ),
      ),
    );
  }
}