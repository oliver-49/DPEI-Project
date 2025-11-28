import 'dart:io';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    var lang =AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text(lang.camera),
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text(lang.gallary),
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(lang.pick_image_example)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImage == null
                ? Text(lang.no_image_selected)
                : Image.file(_selectedImage!, height: 250),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text(lang.pick_image),
            ),
          ],
        ),
      ),
    );
  }
}
