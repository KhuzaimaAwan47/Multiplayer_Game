import 'package:flutter/material.dart';

class SecondaryButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final IconData icon;

  const SecondaryButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        minimumSize: Size(double.infinity, 50),
      ),
      label: Text(buttonText,style:   TextStyle(fontSize: 16),),
      icon: Icon(icon,size: 20, color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
