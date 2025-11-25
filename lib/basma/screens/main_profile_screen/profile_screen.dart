
// basma

import 'package:fixit/basma/screens/edit_profile/editProfile_screen.dart';
import 'package:fixit/basma/screens/profession_profile/Profession_screen.dart';
import 'package:fixit/firebase/auth_service.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/Set_up/auth/login_screen.dart';
import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// ************************** I. الثوابت والألوان **************************
// -----------------------------------------------------------------------------

const Color primaryBlue = Color(0xFF1976D2); 
const Color lightGreyBackground = Color(0xFFF7F7F7);

// -----------------------------------------------------------------------------
// ************************** II. الـ Widgets المساعدة *************************
// -----------------------------------------------------------------------------

// --- 1. ProfileListItem (لعناصر القائمة في شاشة Profile) ---
class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Widget? leadingWidget; 
  final Widget? trailingWidget; 
  final VoidCallback? onTap;

  const ProfileListItem({
    Key? key,
    this.icon,
    required this.title,
    this.leadingWidget,
    this.trailingWidget,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تحديد لون الأيقونة: إذا كان هناك leadingWidget نستخدم لونه، وإلا نستخدم اللون الأزرق الافتراضي.
    final Color iconColor = (leadingWidget is Icon)
        ? (leadingWidget as Icon).color ?? primaryBlue
        : primaryBlue;
    
    // تعديل لون الخط لزر الخروج
    final TextStyle titleStyle = TextStyle(
        fontSize: 16,
        color: title == 'Logout' ? Colors.black : Colors.black87,
        fontWeight: title == 'Logout' ? FontWeight.w500 : FontWeight.normal,
    );


    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Row(
            children: [
              // Leading Icon or Widget
              if (leadingWidget != null)
                leadingWidget!
              else if (icon != null)
                Icon(icon, color: iconColor),
              const SizedBox(width: 15),

              // Title
              Expanded(
                child: Text(
                  title,
                  style: titleStyle,
                ),
              ),

              // Trailing Widget (Default: Arrow)
              trailingWidget ??
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black54,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}


// --- 2. ProfileScreen (الشاشة الأولى - نقطة البداية والربط) ---
class ProfileScreen extends StatelessWidget {
    final ServiceProviderModel? provider;
    ProfileScreen({Key? key, required this.provider}) : super(key: key);

  // Helper for the Earnings/Orders/Completed boxes
  Widget _buildStatBox({
    required String value,
    required String label,
    required Color color,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 12),
        decoration: BoxDecoration(
          color: lightGreyBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Icon(icon, color: color, size: 20),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- User Header Section ---
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/person1.png'),
                  backgroundColor: lightGreyBackground,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                      provider?.name??"ايميلى ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                         Text(
                          provider?.businessName??"Electricty",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.amber[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- Stats Section ---
            Row(
              children: [
                Expanded(
                  child: _buildStatBox(
                    value: '343',
                    label: 'Earnings',
                    color: Colors.green,
                    icon: Icons.attach_money,
                  ),
                ),
                Expanded(
                  child: _buildStatBox(
                    value: '2 Orders',
                    label: 'Active',
                    color: primaryBlue,
                  ),
                ),
                Expanded(
                  child: _buildStatBox(
                    value: '56 Orders',
                    label: 'Completed',
                    color: Colors.orange,
                    icon: Icons.check_circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(), // Visual separator

            // --- Profile Information Section ---
            _buildSectionTitle('Profile information'),
            
            // هنا يتم الربط: Edit Profile
            ProfileListItem(
              title: 'Edit Profile',
              leadingWidget: const Icon(Icons.person_outline, color: primaryBlue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  EditProfileScreen(provider:provider)),
                );
              },
            ),
            
            // باقي الروابط حالياً فارغة (onTap: (){}) ولكن جاهزة للربط
            ProfileListItem(
              title: 'Profession',
              leadingWidget: const Icon(Icons.business_center_outlined, color: primaryBlue),
              onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ProfessionScreen(provider:provider)),
                    );
              }, // يمكنكِ هنا إضافة شاشة ProfessionScreen
            ),
            ProfileListItem(
              title: 'Verification',
              leadingWidget: const Icon(Icons.verified_user_outlined, color: primaryBlue),
              onTap: () {}, // يمكنكِ هنا إضافة شاشة VerificationScreen
            ),

            // --- Subscription & Payments Section ---
            _buildSectionTitle('Subscription & payments'),
            ProfileListItem(
              title: 'Payment method',
              leadingWidget: const Icon(Icons.credit_card_outlined, color: Colors.red), 
              onTap: () {},
            ),
            ProfileListItem(
              title: 'Upgrade',
              leadingWidget: const Icon(Icons.trending_up, color: Colors.red), 
              onTap: () {},
            ),

            // --- General Preferences Section ---
            _buildSectionTitle('General Preferences'),
            ProfileListItem(
              title: 'Notification',
              leadingWidget: const Icon(Icons.notifications_none, color: primaryBlue),
              onTap: () {},
            ),
            ProfileListItem(
              title: 'Help & support',
              leadingWidget: const Icon(Icons.help_outline, color: primaryBlue),
              onTap: () {},
            ),
            // ProfileListItem(
            //   title: 'Logout',
            //   leadingWidget: const Icon(Icons.logout, color: Colors.grey),
            //   onTap: () {
            //     Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                          
            //               MaterialPageRoute(builder: (context) => const LoginScreen()),
            //               (route) => false,
            //             );
            //             },
            //   trailingWidget: const SizedBox.shrink(), // لإخفاء السهم في زر الخروج
            // ),
            ProfileListItem(
  title: 'Logout',
  leadingWidget: const Icon(Icons.logout, color: Colors.grey),
  onTap: () {
    showDialog(
      
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.bgColor,
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // يغلق الـ dialog فقط
            },
            child: const Text('Cancel',style: TextStyle(color: Colors.black),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              Navigator.of(context).pop(); // يغلق الـ dialog
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
                // await _authService.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Signed Out!")),
                );
            },
            child: const Text('Logout',style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  },
  trailingWidget: const SizedBox.shrink(), // لإخفاء السهم في زر الخروج
),

            const SizedBox(height: 30),

            // --- Change Profile Mode Button ---
            const Text(
              'Change Profile to buying mode',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: primaryBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/images/person1.png'), 
                  backgroundColor: lightGreyBackground,
                ),
                label:  Text(
                  provider?.name??"ايميلى",
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      
      // --- Bottom Navigation Bar ---
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: primaryBlue,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   currentIndex: 3, 
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'City'),
      //     BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Order'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),

    );
  }
}

// -----------------------------------------------------------------------------
// ************************** IV. وظيفة التشغيل الرئيسية ***********************
// -----------------------------------------------------------------------------

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // يبدأ التطبيق بالشاشة الأولى (ProfileScreen)
//       home: ProfileScreen(),
//     );
//   }
// }
