import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../../components/primary_button_with_icon.dart';
import 'single_player.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<StatefulWidget> createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {
  final User? user = Auth().currentUser;

  Future<void> _signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Text('Tick Tack Toe', style: TextStyle(color: Colors.white));
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: _signOut, child: Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    Auth authController = Get.put(Auth());
    //profile_controller profileController = Get.put(profile_controller());
    return Scaffold(
      appBar: null,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   title: _title(),
      //   centerTitle: true,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: CircleAvatar(
      //       radius: 20,
      //       child: Icon(Icons.person),
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.settings_outlined,
      //           color: Colors.white,
      //           size: 30,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('TIC TAC TOE',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Theme.of(context).colorScheme.primary),
            ),
            Text('Multiplayer',
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              color: Theme.of(context).colorScheme.secondary
            ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              width: double.infinity,
              height: 250,
            ),
            SizedBox(height: 50),
            PrimaryButtonWithIcon(
              buttonText: 'Single Player',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SinglePlayer(),
                  ),
                );
              },
              icon: Icons.person,
            ),
            SizedBox(height: 20),
            PrimaryButtonWithIcon(buttonText: 'Multi Player', onTap: (){}, icon: Icons.group),
            //SizedBox(height: 200,),
            //_userUid(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
