import 'package:flutter/material.dart';
class MyBotton extends StatefulWidget {
  final void Function()? onTap;
  final child;
  const MyBotton({super.key,required this.onTap,required this.child});

  @override
  State<MyBotton> createState() => _MyBottonState();
}

class _MyBottonState extends State<MyBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        child: widget.child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary
        ),
        padding: const EdgeInsets.all(25),
      ),
    
    );
  }
}