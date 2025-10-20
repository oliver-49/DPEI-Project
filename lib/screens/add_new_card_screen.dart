import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../models/card_model.dart';
import '../utils/app_colors.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  // Create controllers for each text field to capture user input
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  // This function will be called when the user presses the Save button
  void _saveCard() {
    // Create a new CardModel object with the data from text fields
    CardModel newCard = CardModel(
      cardNumber: _cardNumberController.text,
      cardHolderName: _cardHolderController.text,
      expiryDate: _expiryDateController.text,
      cvv: _cvvController.text,
    );

   
    print('New Card Saved: ${newCard.cardNumber}');
    
    // Navigate back to previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF0054A5)),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              SizedBox(width: 8),
              Text(
                'Add new card',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B54A4),
                ),
              ),
            ],
          ),
        ),
        title: null,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header text
            Text(
              'Select your payment method',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Card title ABOVE the container
            Text(
              'Card',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),

            // Payment method container - WITH DROPDOWN ARROW
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // To separate text and arrow
                children: [
                  Text(
                    'Credit card',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textHint,
                    ),
                  ),
                  Container(
                    width: 24, // ← كبرنا الـ width
                    height: 24, // ← كبرنا الـ height
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF5C5F62), 
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Form fields using our custom widget
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Card Number Field
                    CustomTextField(
                      title: 'Card number',
                      hintText: 'Enter 14 digit number',
                      controller: _cardNumberController,
                      keyboardType: TextInputType.number,
                    ),

                    // Card Holder Name Field
                    CustomTextField(
                      title: 'Card holder name',
                      hintText: 'Enter name',
                      controller: _cardHolderController,
                    ),

                    // Expiry Date and CVV Fields in the same row
                    Row(
                      children: [
                        // Expiry Date Field - takes half width
                        Expanded(
                          child: CustomTextField(
                            title: 'Card expiry date',
                            hintText: 'DD/MM/YYYY',
                            controller: _expiryDateController,
                          ),
                        ),
                        SizedBox(width: 16), // Space between fields
                        // CVV Field - takes half width
                        Expanded(
                          child: CustomTextField(
                            title: 'CVV',
                            hintText: '0000',
                            controller: _cvvController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Save Button - Blue color
            Transform.translate(
              offset: const Offset(0, -30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveCard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0054A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  
  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}