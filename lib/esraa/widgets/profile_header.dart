import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          
            image: const DecorationImage(
              image: AssetImage('assets/images/profile_pic.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        const SizedBox(height: 15),
        
        // User Name 
        const Text(
          'Mahrama',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}