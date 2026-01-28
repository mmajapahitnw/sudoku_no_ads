import 'package:flutter/material.dart';

class MenuButtons extends StatelessWidget {
  final String label;
  final String routeAddress;

  const MenuButtons({required this.label, required this.routeAddress, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(label)
    );
  }
}