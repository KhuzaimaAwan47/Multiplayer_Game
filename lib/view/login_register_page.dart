import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiplayer_game/components/primary_button_with_icon.dart';

import '../configs/messages.dart';
import '../controller/auth.dart';
import '../configs/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
 // String? successMessage = '';
  //String? errorMessage = '';
  bool isLogin = true;
  bool isPasswordVisible = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      successMessage('Signed in Successfully');
    } on FirebaseAuthException catch (e) {
      errorMessage('Login Error');
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      successMessage('Registered Successfully');
    } on FirebaseAuthException catch (e) {
      errorMessage('Registration Error');
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller, {
    required IconData prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        //labelText: title,
        hintText: title,
        hintStyle: const TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
          color: lableColor,
        ),
        fillColor: containerColor,
        filled: true,
        prefixIcon: Icon(prefixIcon,color: lableColor,),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Humm? $errorMessage',
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _submitButton() {
    return PrimaryButtonWithIcon(
        buttonText: isLogin ? 'Login' : 'Register',
        onTap: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        icon: isLogin ? Icons.login_outlined : Icons.person_add_alt_1_outlined,
    );
    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: Theme.of(context).colorScheme.onPrimary,
    //     backgroundColor: Theme.of(context).colorScheme.primary,
    //     // blue whale
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     padding: EdgeInsets.all(10),
    //     minimumSize: Size(double.infinity, 50),
    //   ),
    //   onPressed:
    //       isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
    //   child: Text(
    //     isLogin ? 'Login' : 'Register',
    //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //       color: Theme.of(context).colorScheme.primaryContainer,
    //     ),
    //   ),
    // );
  }

  Widget _loginOrRegisterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? 'Don\'t have an account? ' : 'Already have an account? ',
          style: Theme.of(context).textTheme.bodyMedium
        ),
        TextButton(
          onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(
            isLogin ? 'Register instead' : 'Login instead',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            )
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Image.asset('assets/images/logo.png',
                width: double.infinity,
                height: 300,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.bodyLarge
              ),
              Text(
                'Sign in to continue',
                style: Theme.of(context).textTheme.bodyMedium
              ),
              SizedBox(height: 20),
        
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
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: lableColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              _errorMessage(),
              SizedBox(height: 20),
              _submitButton(),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
