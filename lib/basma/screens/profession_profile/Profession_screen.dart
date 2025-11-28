
// --- Main Profession Screen Widget ---

import 'package:fixit/basma/screens/main_profile_screen/profile_screen.dart';
import 'package:fixit/basma/widget/CustomProfession_field.dart';
import 'package:fixit/basma/widget/File__upload_item.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class ProfessionScreen extends StatelessWidget {
  
  final ServiceProviderModel? provider;
  const ProfessionScreen({Key? key, required this.provider}) : super(key: key);

  final Color primaryBlue = const Color(0xFF1976D2);

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text(
          lang.profession,
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
                label: lang.service_name,
                initialValue: provider?.service??lang.plumber,
              ),

              // 2. Expert in
              // Note: maxLines is used to simulate the height seen in the image
               CustomProfessionField(
                label: lang.expert_in,
                initialValue: lang.home_clean_lawn_clean_washing,
                maxLines: 2,
              ),

              // 3. Service Timing (Split Row)
               Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  lang.service_timing,
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
                      label: lang.from,
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
                      label: lang.to,
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
                      label: lang.experience_in_years,
                      initialValue: provider?.experienceYear??lang.years,
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
                label: lang.service_area,
                initialValue:  provider?.serviceArea??lang.menofia,
              ),

              // 6. Upload Services License
              FileUploadItem(
                label: lang.upload_services_license,
                fileName: 'License.pdf',
                onUpload: () {
                  // Logic to open file picker for license
                },
              ),

              // 7. Upload Certification
              FileUploadItem(
                label: lang.upload_certification,
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
                  child:  Text(
                   lang.save ,
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
