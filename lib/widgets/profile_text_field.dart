import 'package:flutter/material.dart';

// هذا الـ Widget لإنشاء حقل إدخال مخصص لبيانات الملف الشخصي
// This widget creates a custom text field for profile data
class ProfileTextField extends StatelessWidget {
  final String label; // نص التسمية فوق الحقل - Label text above the field
  final TextEditingController controller; // المتحكم في نص الحقل - Controller for field text
  final bool showCalendarIcon; // هل نعرض أيقونة التقويم؟ - Should we show calendar icon?
  final bool showDropdownIcon; // هل نعرض أيقونة القائمة المنسدلة？ - Should we show dropdown icon?
  final bool isPhoneField; // هل هذا حقل رقم هاتف؟ - Is this a phone number field?
  final String? countryFlag; // أيقونة العلم لحقل الهاتف - Country flag for phone field
  final VoidCallback? onTap; // دالة التنفيذ عند الضغط على الحقل - Function when field is tapped
  final String countryCode; // رمز الدولة

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.showCalendarIcon = false, // افتراضيًا لا تظهر الأيقونة - By default no icon
    this.showDropdownIcon = false, // افتراضيًا لا تظهر أيقونة القائمة - By default no dropdown icon
    this.isPhoneField = false, // افتراضيًا ليس حقل هاتف - By default not phone field
    this.countryFlag, // أيقونة العلم - Country flag
    this.onTap, // دالة اختيارية للضغط - Optional tap function
    this.countryCode = '+92', // رمز الدولة الافتراضي
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة البداية - Start alignment
      children: [
        // تسمية الحقل - Field label
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54, // لون رمادي غامق - Dark gray color
          ),
        ),
        
        const SizedBox(height: 8), // مسافة بين التسمية والحقل - Space between label and field
        
        // حاوية الحقل - Field container
        GestureDetector(
          onTap: onTap, // تفعيل الضغط إذا كانت هناك دالة - Enable tap if there's a function
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5), // لون خلفية فاتح - Light background color
              borderRadius: BorderRadius.circular(8), // زوايا دائرية - Rounded corners
              border: Border.all(
                color: const Color(0xFF0054A5), // اللون الأزرق للـ border
                width: 1.5, // سمك الخط
              ), 
            ),
            child: Row(
              children: [
                // جزء رمز الدولة (لحقل الهاتف فقط) - Country code part (for phone field only)
                if (isPhoneField) ...[
                  // أيقونة العلم/الهلال - Flag/Crescent icon
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: _buildPhoneIcon(), // ← استدعاء دالة منفصلة
                  ),
                  
                  const SizedBox(width: 8), // مسافة صغيرة - Small space
                  
                  // سهم للأسفل - Dropdown arrow
                  Icon(
                    Icons.arrow_drop_down, // أيقونة السهم للأسفل - Dropdown arrow icon
                    size: 20,
                    color: Colors.grey[600], // اللون الرمادي
                  ),
                  
                  const SizedBox(width: 8), // مسافة صغيرة - Small space
                  
                  // خط فاصل - Divider line
                  Container(
                    width: 1,
                    height: 24,
                    color: const Color(0xFFE0E0E0), // اللون الرمادي
                    margin: const EdgeInsets.only(right: 12.0),
                  ),

                  // رمز الدولة
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      countryCode, // عرض رمز الدولة (+92)
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // ← لون أسود
                      ),
                    ),
                  ),
                ],
                
                // حقل الإدخال - Text field
                Expanded(
                  child: Container(
                    // Container إضافي حول الـ TextField
                    padding: EdgeInsets.only(
                      left: isPhoneField ? 8 : 16, // تعديل الـ padding
                      right: 16,
                    ),
                    child: TextField(
                      controller: controller, // ربط المتحكم - Connect controller
                      decoration: const InputDecoration(
                        border: InputBorder.none, // إزالة الحدود الافتراضية - Remove default border
                        enabledBorder: InputBorder.none, // إزالة border عندما يكون الحقل مفعل
                        focusedBorder: InputBorder.none, // إزالة border عندما يكون الحقل نشط
                        disabledBorder: InputBorder.none, // إزالة border عندما يكون الحقل معطل
                        contentPadding: EdgeInsets.zero, // إزالة الـ padding الداخلي
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // ← غيرت اللون هنا لأسود
                      ),
                      enabled: onTap == null, // تعطيل الكتابة إذا كان هناك دالة ضغط - Disable typing if there's tap function
                    ),
                  ),
                ),
                
                // أيقونة التقويم (تظهر فقط في حقل Date of Birth) - Calendar icon (only for Date of Birth)
                if (showCalendarIcon)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.calendar_today, // أيقونة التقويم - Calendar icon
                      size: 20,
                      color: Colors.grey[600], // اللون الرمادي
                    ),
                  ),
                
                // أيقونة القائمة المنسدلة (تظهر فقط في حقل Country) - Dropdown icon (only for Country field)
                if (showDropdownIcon && !isPhoneField) // لا تظهر في حقل الهاتف - Don't show in phone field
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.arrow_drop_down, // أيقونة السهم للأسفل - Dropdown arrow icon
                      size: 24,
                      color: Colors.grey[600], // اللون الرمادي
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // دالة منفصلة لبناء أيقونة الهاتف - Separate function to build phone icon
  Widget _buildPhoneIcon() {
    try {
      return Image.asset(
        'assets/icons/phone_number_icon.png',
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.phone, // أيقونة هاتف افتراضية
            size: 24,
            color: Colors.grey[600],
          );
        },
      );
    } catch (e) {
      return Icon(
        Icons.phone, // أيقونة هاتف افتراضية
        size: 24,
        color: Colors.grey[600],
      );
    }
  }
}