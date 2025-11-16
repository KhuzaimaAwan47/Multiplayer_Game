import 'package:flutter/material.dart';
import 'package:multiplayer_game/components/primary_button_with_icon.dart';
import '../../components/secondary_button_with_icon.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<StatefulWidget> createState() => UserProfileState();
}

Widget accountCard(String title, Color color, icon) {
  return Card(
    elevation: 0,
    color: Colors.white,
    child: Container(
      height: 120,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          icon,
          Text(
            'Rs. 0.00',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget gameCard(String title, Color color) {
  return Card(
    elevation: 0,
    color: Colors.white,
    child: Container(
      height: 100,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '10',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget infoCard(String title, IconData icon) {
  return GestureDetector(
    onTap: () {},
    child: Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon),
        title: Text('200 Rs'),
        subtitle: Text(title),
        trailing: Text('2025-4-12', style: TextStyle(color: Colors.grey)),
      ),
    ),
  );
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 65,
                  child: Icon(Icons.person, size: 65),
                ),
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '@username',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: accountCard(
                        'Available Balance',
                        Theme.of(context).colorScheme.primary,
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 35,
                        ),
                      ),
                    ),
                    Expanded(
                      child: accountCard(
                        'Withdrawn Balance',
                        Theme.of(context).colorScheme.secondary,
                        Icon(
                          Icons.arrow_circle_down_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButtonWithIcon(buttonText: 'Deposit', onTap: (){}, icon: Icons.add)
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: SecondaryButtonWithIcon(buttonText: 'Withdraw', onTap: (){}, icon: Icons.remove)
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: gameCard('Games Played', Theme.of(context).colorScheme.onSurface)),
                    Expanded(child: gameCard('Wins', Theme.of(context).colorScheme.primary)),
                    Expanded(child: gameCard('Loses', Theme.of(context).colorScheme.secondary)),
                  ],
                ),
                infoCard('Deposit', Icons.add_circle_outline),
                infoCard('Withdrawal', Icons.remove_circle_outline),
                infoCard('Deposit', Icons.add_circle_outline),
                infoCard('Withdrawal', Icons.remove_circle_outline),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
