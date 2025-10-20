import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/menu_item.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/selling_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileCard(),
          const SizedBox(height: 8),
          const CustomBottomNavBar(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: const Text(
        'My Profile',
        style: TextStyle(
          color: Color(0xFF0054A5), // ← غيرنا اللون هنا
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const SizedBox(),
      actions: [_buildActionButton()],
    );
  }

  Widget _buildActionButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F5F5),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const ProfileHeader(),
            const SizedBox(height: 40),
            _buildMenuOptions(),
            const SizedBox(height: 30),
            const SellingModeButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF0054A5), width: 1), // ← غيرنا اللون هنا
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF5F5F5),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile_pic.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          const Text(
            'Mahrama',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0054A5), // ← غيرنا اللون هنا
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOptions() {
    return Column(
      children: [
        _buildMenuItemContainer('Edit Profile', 'assets/icons/edit_profile_icon.png'),
        const SizedBox(height: 8),
        _buildMenuItemContainer('Notification', 'assets/icons/notification_icon.png'),
        const SizedBox(height: 8),
        _buildMenuItemContainer('Payment method', 'assets/icons/payment_icon.png'),
        const SizedBox(height: 8),
        _buildMenuItemContainer('Help & support', 'assets/icons/help_icon.png'),
        const SizedBox(height: 8),
        _buildMenuItemContainer('Logout', 'assets/icons/logout_icon.png', isLogout: true),
      ],
    );
  }

  Widget _buildMenuItemContainer(String title, String iconPath, {bool isLogout = false}) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                iconPath,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isLogout ? Color(0xFF0054A5) : Colors.black, // ← غيرنا اللون هنا
              ),
            ),
            const Spacer(),
            if (!isLogout)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xFF0054A5), // ← غيرنا اللون هنا
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}