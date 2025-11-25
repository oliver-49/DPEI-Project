

// -----------------------------------------------------------------------------
// ************************** III. الشاشات (Pages) ****************************
// -----------------------------------------------------------------------------

// --- 1. EditProfileScreen (الشاشة الثانية) ---
import 'package:fixit/basma/screens/main_profile_screen/profile_screen.dart';
import 'package:fixit/basma/widget/Custom_input_field.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  
  final ServiceProviderModel? provider;
   EditProfileScreen({Key? key, required this.provider}) : super(key: key);
  
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
                 CustomInputField(
                  label: 'Name',
                  initialValue: provider?.name??"ايميلى",
                ),
                 CustomInputField(
                  label: 'Email',
                  initialValue: provider?.email??"emely@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
        
               
        
                // --- Country Dropdown Field ---
                 Padding(
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
                      value: 'Egypt',
                      items: <String>['Egypt','Mexico', 'USA', 'Canada', 'Other']
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
                  readOnly: true,
                  label: 'Phone number',
                  initialValue: provider?.phone??"01202369242",
                  keyboardType: TextInputType.phone,
                  prefixWidget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // تم استخدام Icons.chat كبديل لـ Icons.whatsapp
                         Icon(Icons.chat, color: Colors.red[800]),
                        const SizedBox(width: 5),
                        const Text(
                          'egy',
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
                 CustomInputField(
                  label: 'Address',
                  initialValue: provider?.businessAddress??"gesr elbahr street",
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