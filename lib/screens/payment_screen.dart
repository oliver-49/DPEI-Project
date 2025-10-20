// FILE: lib/screens/payment_screen.dart
// This is the main payment method selection screen

import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

// Payment method item widget
class PaymentMethodItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final String? imagePath;
  final Color? backgroundColor;
  final double? height;

  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.imagePath,
    this.backgroundColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: imagePath != null 
            ? Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath!,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              )
            : null,
        title: Transform.translate(
          offset: const Offset(0, -2),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              height: 1.1,
            ),
          ),
        ),
        trailing: Container(
          margin: const EdgeInsets.only(right: 4),
          child: Icon(
            Icons.check,
            color: isSelected ? const Color(0xFF0054A5) : Colors.transparent,
            size: 22,
          ),
        ),
        onTap: onTap,
        minVerticalPadding: 0,
        dense: true,
      ),
    );
  }
}

// Add new card button widget
class AddCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCardButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF0054A5),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: const Center(
            child: Text(
              '+ Add new card',
              style: TextStyle(
                color: Color(0xFF0054A5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Variable to store the selected payment method
  String? _selectedPaymentMethod = 'Easypaisa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0054A5)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: double.infinity,
          child: const Text(
            'Payment',
            style: TextStyle(
              color: Color(0xFF2B54A4),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Select Payment Method Title
            const Row(
              children: [
                Text(
                  'Select Payment method',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Payment Methods List
            Expanded(
              child: ListView(
                children: [
                  // Easypaisa Option
                  PaymentMethodItem(
                    title: 'Easypaisa',
                    isSelected: _selectedPaymentMethod == 'Easypaisa',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Easypaisa';
                      });
                    },
                    imagePath: 'assets/images/easypaisa_pic.png',
                    backgroundColor: const Color(0x1A0773DA),
                    height: 52,
                  ),
                  
                  // Bank Account Option
                  PaymentMethodItem(
                    title: 'Bank account',
                    isSelected: _selectedPaymentMethod == 'Bank account',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Bank account';
                      });
                    },
                    height: 52,
                  ),
                  
                  // Jazz Cash Option
                  PaymentMethodItem(
                    title: 'Jazz cash',
                    isSelected: _selectedPaymentMethod == 'Jazz cash',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Jazz cash';
                      });
                    },
                    height: 52,
                  ),
                  
                  // PayPal Option
                  PaymentMethodItem(
                    title: 'PayPal',
                    isSelected: _selectedPaymentMethod == 'PayPal',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'PayPal';
                      });
                    },
                    imagePath: 'assets/images/paypal_pic.png',
                    height: 52,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Add New Card Button
                  AddCardButton(
                    onPressed: () {
                      print('Add new card pressed');
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
            
            // Save Button
            Transform.translate(
              offset: const Offset(0, -25),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _savePaymentMethod();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0054A5),
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
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  
  void _savePaymentMethod() {
    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a payment method'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      print('Payment method saved: $_selectedPaymentMethod');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$_selectedPaymentMethod saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}