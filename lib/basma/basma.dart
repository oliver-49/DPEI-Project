
// basma

import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/yreyhan/auth/login_screen.dart';
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

// --- 2. CustomInputField (لحقول الإدخال في شاشة Edit Profile) ---
class CustomInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final bool readOnly;
  final Widget? suffixIcon;
  final bool isDate;
  final Widget? prefixWidget;
  final TextInputType keyboardType;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.initialValue,
    this.readOnly = false,
    this.suffixIcon,
    this.isDate = false,
    this.prefixWidget,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryBlue, width: 2),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixWidget,
          ),
          onTap: isDate
              ? () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime(2006, 11, 28),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                }
              : null,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}


// --- Reusable Widget: Custom Text Field (A slightly modified version for this screen) ---
class CustomProfessionField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Widget? suffixWidget;
  final bool readOnly;
  final double? widthFactor; // For use in split rows
  final int maxLines;

  const CustomProfessionField({
    Key? key,
    required this.label,
    required this.initialValue,
    this.suffixWidget,
    this.readOnly = false,
    this.widthFactor,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If widthFactor is provided, wrap in FractionallySizedBox
    Widget textField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: maxLines > 1 ? 15 : 12, // More padding for multi-line
              horizontal: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryBlue, width: 2),
            ),
            suffixIcon: suffixWidget,
          ),
          onTap: () {
            // Logic for opening time picker or date picker if needed
          },
        ),
        const SizedBox(height: 20),
      ],
    );

    if (widthFactor != null) {
      return Expanded(child: textField);
    }
    return textField;
  }
}

// --- Reusable Widget for File Upload Items ---

class FileUploadItem extends StatelessWidget {
  final String label;
  final String fileName;
  final VoidCallback onUpload;
  final Color primaryBlue = const Color(0xFF1976D2);

  const FileUploadItem({
    Key? key,
    required this.label,
    required this.fileName,
    required this.onUpload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fileName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  // Style for PDF/file name based on image
                  fontWeight: FontWeight.w500, 
                ),
              ),
              GestureDetector(
                onTap: onUpload,
                child: Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}


// --- Main Profession Screen Widget ---

class ProfessionScreen extends StatelessWidget {
  const ProfessionScreen({Key? key}) : super(key: key);

  final Color primaryBlue = const Color(0xFF1976D2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profession',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Service Name
              const CustomProfessionField(
                label: 'Service name',
                initialValue: 'Cleaner',
              ),

              // 2. Expert in
              // Note: maxLines is used to simulate the height seen in the image
              const CustomProfessionField(
                label: 'Expert in',
                initialValue: 'Home clean, lawn clean, Washing',
                maxLines: 2,
              ),

              // 3. Service Timing (Split Row)
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Service Timing',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              Row(
                children: [
                  // From Time
                  Expanded(
                    child: CustomProfessionField(
                      label: 'From',
                      initialValue: '9:00AM',
                      readOnly: true, // Typically readOnly for TimePicker
                      suffixWidget: Icon(
                        Icons.access_time, 
                        color: primaryBlue.withOpacity(0), // Invisible icon to push text left
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  // To Time
                  Expanded(
                    child: CustomProfessionField(
                      label: 'TO',
                      initialValue: '10:00PM',
                      readOnly: true,
                      suffixWidget: Icon(
                        Icons.access_time, 
                        color: primaryBlue.withOpacity(0),
                      ),
                    ),
                  ),
                ],
              ),

              // 4. Experience in years (Split Row)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Experience Value
                  Expanded(
                    flex: 1, // Takes less space
                    child: CustomProfessionField(
                      label: 'Experience in years',
                      initialValue: '4',
                      // Removed suffixWidget here
                    ),
                  ),
                  const SizedBox(width: 15),
                  
                  // 'years' Text on the right
                  // We use the same CustomProfessionField structure but modify it
                  Expanded(
                    flex: 1, // Takes more space
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0), // Align with input field
                      child: Container(
                        height: 50, // Match input field height
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'years',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              // 5. Service Area
              const CustomProfessionField(
                label: 'Service Area',
                initialValue: 'Tijuana, Baja California',
              ),

              // 6. Upload Services License
              FileUploadItem(
                label: 'Upload your services license',
                fileName: 'License.pdf',
                onUpload: () {
                  // Logic to open file picker for license
                },
              ),

              // 7. Upload Certification
              FileUploadItem(
                label: 'Upload your Certification',
                fileName: 'Certificate.pdf',
                onUpload: () {
                  // Logic to open file picker for certificate
                },
              ),
              
              const SizedBox(height: 10),

              // 8. Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to save profession details
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// -----------------------------------------------------------------------------
// ************************** III. الشاشات (Pages) ****************************
// -----------------------------------------------------------------------------

// --- 1. EditProfileScreen (الشاشة الثانية) ---
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // زر الرجوع
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        color:  AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Profile Image with Edit Button ---
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        // يجب وضع صورة هنا أو استخدام لون
                        backgroundImage: AssetImage('assets/images/person1.png'),
                        backgroundColor: lightGreyBackground,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: primaryBlue,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
        
                // --- Form Fields ---
                const CustomInputField(
                  label: 'Name',
                  initialValue: 'Mahrama',
                ),
                const CustomInputField(
                  label: 'Email',
                  initialValue: 'Mahrama@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
        
                // --- Date of Birth Field ---
                const CustomInputField(
                  label: 'Date of Birth',
                  initialValue: '28/11/2006',
                  readOnly: true,
                  isDate: true,
                  suffixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: primaryBlue,
                  ),
                ),
        
                // --- Country Dropdown Field ---
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: 'Mexico',
                      items: <String>['Mexico', 'USA', 'Canada', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(fontSize: 16)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Logic to handle country change
                      },
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
        
                // --- Phone Number Field (FIXED WhatsApp icon issue) ---
                CustomInputField(
                  label: 'Phone number',
                  initialValue: '+92 3459864343',
                  keyboardType: TextInputType.phone,
                  prefixWidget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // تم استخدام Icons.chat كبديل لـ Icons.whatsapp
                        const Icon(Icons.chat, color: Colors.green),
                        const SizedBox(width: 5),
                        const Text(
                          'v',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 16),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey.shade300,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ],
                    ),
                  ),
                ),
        
                // --- Address Field ---
                const CustomInputField(
                  label: 'Address',
                  initialValue: 'Tijuana, Baja California',
                ),
        
                const SizedBox(height: 30),
        
                // --- Save Button (Updated to navigate to ProfessionScreen) ---
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // UPDATED NAVIGATION LOGIC
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ProfessionScreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- 2. ProfileScreen (الشاشة الأولى - نقطة البداية والربط) ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                    const Text(
                      'Mahrama',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          'Electrician',
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
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
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
                      MaterialPageRoute(builder: (context) => const ProfessionScreen()),
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
            onPressed: () {
              Navigator.of(context).pop(); // يغلق الـ dialog
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
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
                label: const Text(
                  'Mahrama',
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
