import 'package:dpei_project/l10n/app_localizations.dart';
import 'package:dpei_project/presentation/screens/account_service/Selction_view/selection_who_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dpei_project/presentation/screens/account_service/Selction_view/selection_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ar', 'AE')],

      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (context) => SelectionCubit(),
        child: const AccountSetup(),
      ),
    );
  }
}
import 'package:flutter/material.dart';

// Define primary colors used in the design
const Color strongBlue = Color(0xFF0D47A1); 
const Color lightBlueFill = Color(0xFFE3F2FD); // Very light blue for background elements
const Color darkBlueAccent = Color(0xFF1565C0); 
const Color primaryTextColor = Color(0xFF212121);
const Color secondaryTextColor = Color(0xFF424242);
const Color redAccent = Color(0xFFD32F2F); // Red for the 24/7 indicator

void main() {
  runApp(const HelpAndSupportApp());
}

class HelpAndSupportApp extends StatelessWidget {
  const HelpAndSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help & Support',
      theme: ThemeData(
        primaryColor: strongBlue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const HelpAndSupportScreen(),
    );
  }
}

// --- Custom Widget for the Support Icon (Closest match to the image) ---
class SupportIcon extends StatelessWidget {
  const SupportIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200, // Slightly wider container
        height: 180,
        // Overall shadow mimicking the floating image effect
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. The Main Headset/Support Agent Icon
            Container(
              decoration: BoxDecoration(
                 color: lightBlueFill, // Light blue base color for the background circle
                 shape: BoxShape.circle,
                 border: Border.all(color: darkBlueAccent.withOpacity(0.5), width: 1.5)
              ),
              padding: const EdgeInsets.all(30),
              child: const Icon(
                Icons.support_agent_rounded, 
                color: strongBlue, 
                size: 80,
              ),
            ),
            
            // 2. The Red 24/7 Indicator (Circle with clock/time icon)
            Positioned(
              right: 15,
              bottom: 15,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: redAccent, 
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: redAccent.withOpacity(0.6),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.watch_later_outlined, 
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Main Screen Widget ---
class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: strongBlue, width: 2), // Strong focus color
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 17, // Slightly smaller
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
        ),
      ),
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _submitIssue() {
    if (_formKey.currentState!.validate()) {
      _showSnackBar(
        'تم إرسال المشكلة بنجاح!',
        Colors.green.shade600,
      );
      _titleController.clear();
      _messageController.clear();
    } else {
       _showSnackBar(
        'الرجاء إدخال العنوان وتفاصيل المشكلة.',
        Colors.red.shade600,
      );
    }
  }

  void _startLiveChat() {
    _showSnackBar(
      'جاري الاتصال بخدمة الدردشة المباشرة...',
      darkBlueAccent,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- شريط التطبيق (AppBar) ---
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryTextColor),
          onPressed: () {
            // منطق العودة إلى الخلف
          },
        ),
        title: const Text(
          'Help & support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _startLiveChat,
            child: const Text(
              'Live chat',
              style: TextStyle(
                color: strongBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),

      // --- جسم الصفحة (Body) ---
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const SizedBox(height: 30),

                    // 1. الأيقونة الكبيرة المُحسّنة
                    const SupportIcon(),

                    const SizedBox(height: 30),

                    // 2. نص "Hello, how can we assist you?"
                    const Text(
                      'Hello, how can we assist you?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                      ),
                    ),

                    // 3. حقل العنوان (Title)
                    _buildFieldLabel('Title'),
                    TextFormField(
                      controller: _titleController,
                      keyboardType: TextInputType.text,
                      decoration: _inputDecoration(
                        'Enter the title of your issue',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required.';
                        }
                        return null;
                      },
                    ),

                    // 4. حقل كتابة الرسالة (Write in bellow box)
                    _buildFieldLabel('Write in bellow box'),
                    TextFormField(
                      controller: _messageController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 7, 
                      decoration: _inputDecoration('Write here..'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Message is required.';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // --- زر الإرسال (Send Button) ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _submitIssue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: strongBlue, // Darker blue, more prominent
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // --- زر الدردشة المباشرة (Live chat Button) ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: _startLiveChat,
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: strongBlue,
                  size: 24,
                ),
                label: const Text(
                  'Live chat',
                  style: TextStyle(
                    color: strongBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  side: const BorderSide(
                    color: strongBlue,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
import 'package:device_preview/device_preview.dart';
import 'package:fixit/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/booking_services/view/providerprofile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => BlocProvider(
      create: (context) => BookingCubit(),
      child: MyApp()), // Wrap your app
  ),
);
import 'package:dpei_project/navigation_page.dart';
import 'package:dpei_project/utalities/Services/logic/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

  List<Map<String, List<Map<String, String>>>> servicesCard = [
    {
      "Maintenance": [
        {"img": "assets/images/Air Conditenior.png", "job": "Air Condition"},
        {"img": "assets/images/Multimeter.png", "job": "Electric"},
        {"img": "assets/images/image 100.png", "job": "Siding repair"},
        {"img": "assets/images/Car Wash.png", "job": "Car Wash"},
      ],
    },
    {
      "Cleaning": [
        {"img": "assets/images/Spin Mop.png", "job": "Home Flooring"},
        {"img": "assets/images/image 101.png", "job": "Gutter"},
        {"img": "assets/images/Frame 1000003290.png", "job": "Carpet"},
        {"img": "assets/images/Pliers.png", "job": "Pliers"},
      ],
    },
    {
      "Home improvement": [
        {"img": "assets/images/image 109.png", "job": "Drilling"},
        {"img": "assets/images/image 102.png", "job": "lawn "},
        {"img": "assets/images/image 103.png", "job": "Weed control"},
        {"img": "assets/images/Water Tap.png", "job": "Water Tap"},
      ],
    },
    {
      "Security": [
        {"img": "assets/images/CCTV (1).png", "job": "Cameras"},
        {"img": "assets/images/image 104 (1).png", "job": "Burglar alarm"},
        {"img": "assets/images/image 105 (1).png", "job": "Sturdy lock"},
        {"img": "assets/images/Cctv (2).png", "job": "Cctv"},
      ],
    },
    {
      "Car Maintenance": [
        {"img": "assets/images/Car Waxing.png", "job": "Car washer"},
        {"img": "assets/images/image 109 (1).png", "job": "Oil change"},
        {"img": "assets/images/image 110.png", "job": "Car battery"},
        {"img": "assets/images/Car Wash.png", "job": "Car Waxing"},
      ],
    },
    {
      "Handyman Services": [
        {"img": "assets/images/image 108 (1).png", "job": "Furniture"},
        {"img": "assets/images/image 111.png", "job": "Door"},
        {"img": "assets/images/image 112.png", "job": "Shelving "},
        {
          "img":
              "assets/images/Painter holding paint roller and paint bucket.png",
          "job": "Painting",
        },
      ],
    },
    {
      "Other services": [
        {"img": "assets/images/image 113.png", "job": "Interior"},
        {"img": "assets/images/image 114.png", "job": "Exterior"},
        {"img": "assets/images/image 115.png", "job": "Wall "},
        {"img": "assets/images/image 116.png", "job": "Dish wash  "},
        {"img": "assets/images/image 117 (1).png", "job": "Loading"},
        {"img": "assets/images/image 118.png", "job": "Cutting"},
        {
          "img": "assets/images/Boy mopping the floor.png",
          "job": "Mopping Floor",
        },
      ],
    },
  ];

void main() {
  runApp( BlocProvider(
        create: (context) => ServiceCubit()..getServices(
      servicesCard[0].values.first,),
        child: MyApp()));
}

class MyApp extends StatelessWidget {
    MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff9f9f9),
      ),
      home:  ProviderProfile(),
    return MaterialApp(
      home: NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
