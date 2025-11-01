import 'package:flutter/material.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_bottom_card.dart';
import '../widgets/profile_menu_options.dart';
import '../widgets/profile_header.dart';
import '../widgets/selling_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: const ProfileBottomCard(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const ProfileHeader(),
            const SizedBox(height: 40),
            ProfileMenuOptions(),
            const SizedBox(height: 30),
            const SellingModeButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}