// FILE: lib/screens/notification_screen.dart
// This is the main notification settings screen

import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
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
    var lang =AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0054A5)), 
          onPressed: () {
            Navigator.pop(context); // Goes back to previous screen
          },
        ),
        title: Container(
          width: double.infinity, // Takes full width
          child:  Text(
            lang.notification,
            style: TextStyle(
              color: Color(0xFF0054A5), 
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
                    title: lang.general_notification,
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
                    title: lang.sound,
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
                    title: lang.vibrate,
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
                    title: lang.new_service,
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
                    title: lang.payment,
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
                  backgroundColor: const Color(0xFF0054A5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:  Text(
                  lang.save,
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
       SnackBar(
        content: Text(AppLocalizations.of(context)!.notification_saved),
        backgroundColor: Colors.green,
      ),
    );
  }
}