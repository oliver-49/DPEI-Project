import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool showCalendarIcon;
  final bool showDropdownIcon;
  final bool isPhoneField;
  final String? countryFlag;
  final VoidCallback? onTap;
  final String countryCode;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.showCalendarIcon = false,
    this.showDropdownIcon = false,
    this.isPhoneField = false,
    this.countryFlag,
    this.onTap,
    this.countryCode = '+92',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        
        const SizedBox(height: 8),
        
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF0054A5),
                width: 1.5,
              ), 
            ),
            child: Row(
              children: [
                if (isPhoneField) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: _buildPhoneIcon(),
                  ),
                  
                  const SizedBox(width: 8),
                  
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                  
                  const SizedBox(width: 8),
                  
                  Container(
                    width: 1,
                    height: 24,
                    color: const Color(0xFFE0E0E0),
                    margin: const EdgeInsets.only(right: 12.0),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      countryCode,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: isPhoneField ? 8 : 16,
                      right: 16,
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      enabled: onTap == null,
                    ),
                  ),
                ),
                
                if (showCalendarIcon)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                
                if (showDropdownIcon && !isPhoneField)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneIcon() {
    try {
      return Image.asset(
        'assets/icons/phone_number_icon.png',
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.phone,
            size: 24,
            color: Colors.grey[600],
          );
        },
      );
    } catch (e) {
      return Icon(
        Icons.phone,
        size: 24,
        color: Colors.grey[600],
      );
    }
  }
}