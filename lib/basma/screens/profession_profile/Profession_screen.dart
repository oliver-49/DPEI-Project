
// --- Main Profession Screen Widget ---

import 'package:fixit/basma/screens/main_profile_screen/profile_screen.dart';
import 'package:fixit/basma/widget/CustomProfession_field.dart';
import 'package:fixit/basma/widget/File__upload_item.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionScreen extends StatelessWidget {
  
  final ServiceProviderModel? provider;
  const ProfessionScreen({Key? key, required this.provider}) : super(key: key);

  final Color primaryBlue = const Color(0xFF1976D2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profession',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Service Name
               CustomProfessionField(
                label: 'Service name',
                initialValue: provider?.service??"Plumber",
              ),

              // 2. Expert in
              // Note: maxLines is used to simulate the height seen in the image
              const CustomProfessionField(
                label: 'Expert in',
                initialValue: 'Home clean, lawn clean, Washing',
                maxLines: 2,
              ),

              // 3. Service Timing (Split Row)
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Service Timing',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              Row(
                children: [
                  // From Time
                  Expanded(
                    child: CustomProfessionField(
                      label: 'From',
                      initialValue:  provider?.startingTime.substring(10,15)??"",
                      readOnly: true, // Typically readOnly for TimePicker
                      suffixWidget: Icon(
                        Icons.access_time, 
                        color: primaryBlue.withOpacity(0), // Invisible icon to push text left
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  // To Time
                  Expanded(
                    child: CustomProfessionField(
                      label: 'TO',
                      initialValue: provider?.endingTime.substring(10,15)??"",
                      readOnly: true,
                      suffixWidget: Icon(
                        Icons.access_time, 
                        color: primaryBlue.withOpacity(0),
                      ),
                    ),
                  ),
                ],
              ),

              // 4. Experience in years (Split Row)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Experience Value
                  Expanded(
                    flex: 1, // Takes less space
                    child: CustomProfessionField(
                      label: 'Experience in years',
                      initialValue: provider?.experienceYear??"4 year",
                      // Removed suffixWidget here
                    ),
                  ),
                  const SizedBox(width: 15),
                  
                  // 'years' Text on the right
                  // We use the same CustomProfessionField structure but modify it
                  Expanded(
                    flex: 1, // Takes more space
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0), // Align with input field
                      child: Container(
                        height: 50, // Match input field height
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'years',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              // 5. Service Area
               CustomProfessionField(
                label: 'Service Area',
                initialValue:  provider?.serviceArea??"elmonofia",
              ),

              // 6. Upload Services License
              FileUploadItem(
                label: 'Upload your services license',
                fileName: 'License.pdf',
                onUpload: () {
                  // Logic to open file picker for license
                },
              ),

              // 7. Upload Certification
              FileUploadItem(
                label: 'Upload your Certification',
                fileName: 'Certificate.pdf',
                onUpload: () {
                  // Logic to open file picker for certificate
                },
              ),
              
              const SizedBox(height: 10),

              // 8. Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to save profession details
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
    );
  }
}
