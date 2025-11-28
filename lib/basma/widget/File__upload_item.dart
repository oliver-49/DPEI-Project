
// --- Reusable Widget for File Upload Items ---

import 'dart:ui';

import 'package:fixit/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FileUploadItem extends StatelessWidget {
  final String label;
  final String fileName;
  final VoidCallback onUpload;
  final Color primaryBlue = const Color(0xFF1976D2);

  const FileUploadItem({
    Key? key,
    required this.label,
    required this.fileName,
    required this.onUpload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fileName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  // Style for PDF/file name based on image
                  fontWeight: FontWeight.w500, 
                ),
              ),
              GestureDetector(
                onTap: onUpload,
                child: Text(
                  AppLocalizations.of(context)!.change,
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}