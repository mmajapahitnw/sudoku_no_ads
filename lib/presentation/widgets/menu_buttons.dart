import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuButtons extends StatelessWidget {
  final String label;
  final String routeAddress;

  const MenuButtons({required this.label, required this.routeAddress, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (routeAddress != '') {
            context.go(
                context.namedLocation(routeAddress)
            );
          }
        },
        child: Text(label)
    );
  }
}