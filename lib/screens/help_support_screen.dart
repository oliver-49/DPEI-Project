import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../models/help_ticket_model.dart';
import '../utils/app_colors.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  // Controllers to handle text input
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
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
            'Help & support',
            style: TextStyle(
              color: Color(0xFF2B54A4),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        actions: [
          Transform.translate(
            offset: const Offset(0, -8),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: _handleLiveChat,
                child: const Text(
                  'Live chat',
                  style: TextStyle(
                    color: Color(0xFF0054A5),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              _buildCenterImage(),
              const SizedBox(height: 20),

              // Welcome message
              _buildWelcomeMessage(),
              const SizedBox(height: 30),

              // Title field
              CustomTextField(
                title: 'Title',
                hintText: 'Enter the title of your issue',
                controller: _titleController,
              ),

              // Description field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write in bellow box',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: 'Write here...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(12),
                        hintStyle: TextStyle(color: AppColors.textHint),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              // Send button
              PrimaryButton(
                text: 'Send',
                onPressed: _handleSubmit,
                backgroundColor: const Color(0xFF0054A5),
              ),
              const SizedBox(height: 30),

              // Live chat button (with icon)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _handleLiveChat,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF0054A5),
                      side: const BorderSide(color: Color(0xFF0054A5)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/wp_chat_icon.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Live chat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

  
  Widget _buildCenterImage() {
    return Center(
      child: Image.asset(
        'assets/images/support_pic.png',
        width: 183,
        height: 174,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return const Center(
      child: Text(
        'Hello, how can we assist you?',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  void _handleSubmit() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) {
      _showSnackBar('Please enter a title for your issue');
      return;
    }

    if (description.isEmpty) {
      _showSnackBar('Please describe your issue');
      return;
    }

    final ticket = HelpTicketModel(
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );

    print('Ticket submitted: ${ticket.toMap()}');
    _showSnackBar('Your issue has been submitted successfully!');
    _titleController.clear();
    _descriptionController.clear();
  }

  void _handleLiveChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Live Chat'),
        content: const Text('Connecting to customer support...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
