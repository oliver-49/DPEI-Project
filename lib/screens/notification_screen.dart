// FILE: lib/screens/notification_screen.dart
// This is the main notification settings screen

import 'package:flutter/material.dart';
import '../widgets/custom_switch.dart';
import '../widgets/setting_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Variables to store the state of each switch
  bool _generalNotification = true;
  bool _soundEnabled = true;
  bool _vibrateEnabled = true;
  bool _newServiceEnabled = false;
  bool _paymentEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0054A5)), // ← غيرنا اللون هنا
          onPressed: () {
            Navigator.pop(context); // Goes back to previous screen
          },
        ),
        title: Container(
          width: double.infinity, // Takes full width
          child: const Text(
            'Notification',
            style: TextStyle(
              color: Color(0xFF0054A5), // ← غيرنا اللون هنا
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left, // Aligns text to the left (next to the arrow)
          ),
        ),
        centerTitle: false, // Disable default center alignment
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Settings Items List
            Expanded(
              child: ListView(
                children: [
                  // General Notification Switch
                  SettingItem(
                    title: 'General notification',
                    trailing: CustomSwitch(
                      value: _generalNotification,
                      onChanged: (bool newValue) {
                        setState(() {
                          _generalNotification = newValue;
                        });
                      },
                    ),
                  ),
                  
                  // Sound Switch
                  SettingItem(
                    title: 'Sound',
                    trailing: CustomSwitch(
                      value: _soundEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          _soundEnabled = newValue;
                        });
                      },
                    ),
                  ),
                  
                  // Vibrate Switch
                  SettingItem(
                    title: 'Vibrate',
                    trailing: CustomSwitch(
                      value: _vibrateEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          _vibrateEnabled = newValue;
                        });
                      },
                    ),
                  ),
                  
                  // New Service Switch
                  SettingItem(
                    title: 'New Service',
                    trailing: CustomSwitch(
                      value: _newServiceEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          _newServiceEnabled = newValue;
                        });
                      },
                    ),
                  ),
                  
                  // Payment Switch
                  SettingItem(
                    title: 'Payment',
                    trailing: CustomSwitch(
                      value: _paymentEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          _paymentEnabled = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            // ← غيرت المسافة هنا إلى 8 بس
            const SizedBox(height: 8),
            
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add save functionality here
                  // This will save all the notification settings
                  _saveSettings();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0054A5), // ← غيرنا اللون هنا
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Method to handle saving the settings
  void _saveSettings() {
    // Here you would typically save to shared preferences or database
    print('Settings saved:');
    print('General: $_generalNotification');
    print('Sound: $_soundEnabled');
    print('Vibrate: $_vibrateEnabled');
    print('New Service: $_newServiceEnabled');
    print('Payment: $_paymentEnabled');
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification settings saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}