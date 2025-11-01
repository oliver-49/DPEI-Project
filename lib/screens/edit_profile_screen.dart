import 'package:flutter/material.dart';
import '../widgets/edit_profile_appbar.dart';    // App Bar
import '../widgets/profile_text_field.dart';     //Text Fields
import '../widgets/save_button.dart';            //Save Button
import '../widgets/profile_header_with_edit.dart'; 

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //  Text controllers for each input field
  final TextEditingController _nameController = TextEditingController(text: 'Mahrama');
  final TextEditingController _emailController = TextEditingController(text: 'Mahrama@gmail.com');
  final TextEditingController _dobController = TextEditingController(text: '28/11/2005');
  final TextEditingController _countryController = TextEditingController(text: 'Mexico');
  final TextEditingController _phoneController = TextEditingController(text: '3459864343'); //  Number only without country code

  // List of countries
  final List<String> _countries = [
    'Mexico', 'Egypt', 'USA', 'UK', 'Canada', 'Germany', 'France', 
    'Italy', 'Spain', 'Japan', 'Brazil', 'Australia', 'India', 'China', 'South Korea'
  ];

  // List of country codes
  final List<Map<String, String>> _countryCodes = [
    {'code': '+92', 'name': 'Pakistan', 'flag': '🌙'},
    {'code': '+20', 'name': 'Egypt', 'flag': '🇪🇬'},
    {'code': '+1', 'name': 'USA/Canada', 'flag': '🇺🇸'},
    {'code': '+44', 'name': 'UK', 'flag': '🇬🇧'},
    {'code': '+49', 'name': 'Germany', 'flag': '🇩🇪'},
    {'code': '+33', 'name': 'France', 'flag': '🇫🇷'},
    {'code': '+39', 'name': 'Italy', 'flag': '🇮🇹'},
    {'code': '+34', 'name': 'Spain', 'flag': '🇪🇸'},
    {'code': '+81', 'name': 'Japan', 'flag': '🇯🇵'},
    {'code': '+55', 'name': 'Brazil', 'flag': '🇧🇷'},
  ];

  String _selectedCountryCode = '+92';  //Default country code
  String _selectedCountryFlag = '🌙';  // Default country flag

  // Save function
  void _saveProfile() {
    //  Here goes the save logic
    print('تم حفظ البيانات - Data saved');
    
    //  Show save data in console
    print('الاسم: ${_nameController.text}');
    print('البريد الإلكتروني: ${_emailController.text}');
    print('تاريخ الميلاد: ${_dobController.text}');
    print('الدولة: ${_countryController.text}');
    print('رقم الهاتف: $_selectedCountryCode${_phoneController.text}');
    
    //  Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Changes saved successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Function to show country list
  void _showCountryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Country', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _countries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    color: _countries[index] == _countryController.text 
                        ? const Color(0xFF0054A5).withOpacity(0.1) 
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      _countries[index],
                      style: TextStyle(
                        fontWeight: _countries[index] == _countryController.text 
                            ? FontWeight.bold : FontWeight.normal,
                        color: _countries[index] == _countryController.text 
                            ? const Color(0xFF0054A5) : Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _countryController.text = _countries[index];
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  //  Function to show country codes list
  void _showCountryCodeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Country Code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _countryCodes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    color: _countryCodes[index]['code'] == _selectedCountryCode 
                        ? const Color(0xFF0054A5).withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Text(_countryCodes[index]['flag']!, style: const TextStyle(fontSize: 20)),
                    title: Text('${_countryCodes[index]['code']} - ${_countryCodes[index]['name']}', style: const TextStyle(fontSize: 16)),
                    onTap: () {
                      setState(() {
                        _selectedCountryCode = _countryCodes[index]['code']!;
                        _selectedCountryFlag = _countryCodes[index]['flag']!;
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  // Function to show date picker
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2005, 11, 28),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: EditProfileAppBar(
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            
            ProfileHeaderWithEdit(), 
            const SizedBox(height: 40),
            
            //  Name field
            ProfileTextField(label: 'Name', controller: _nameController),
            const SizedBox(height: 20),
            
            // Email field
            ProfileTextField(label: 'Email', controller: _emailController),
            const SizedBox(height: 20),
            
            //  Date of Birth field 
            ProfileTextField(
              label: 'Date of Birth', 
              controller: _dobController,
              showCalendarIcon: true,
              onTap: _showDatePicker,
            ),
            const SizedBox(height: 20),
            
            //  Country field 
            ProfileTextField(
              label: 'Country', 
              controller: _countryController,
              showDropdownIcon: true,
              onTap: _showCountryDialog,
            ),
            const SizedBox(height: 20),
            
            // Phone number field 
            ProfileTextField(
              label: 'Phone number', 
              controller: _phoneController,
              isPhoneField: true,
              countryFlag: _selectedCountryFlag,
              countryCode: _selectedCountryCode, 
              onTap: _showCountryCodeDialog,
            ),
            
            const Spacer(),
            
            // Save button
            SaveButton(onPressed: _saveProfile),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}