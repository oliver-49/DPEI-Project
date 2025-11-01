import 'package:flutter/material.dart';

class ProfileHeaderWithEdit extends StatelessWidget {
  const ProfileHeaderWithEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
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
            
    
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/icons/edit_bold_icon.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
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