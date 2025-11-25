import 'package:fixit/activity/activity.dart';
import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
      ElevatedButton.icon(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImagePickerScreen()),
            );
      }, label: Icon(Icons.forward))
      ,),
    );
  }
}