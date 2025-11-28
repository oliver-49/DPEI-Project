 import 'package:fixit/ye/utalities/Dimensions.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/l10n/cubit/lang_cubit.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageCubit>().state.languageCode;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/Frame (2).png",
          height: Dimensions(context).height10 * 4,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            const Icon(Icons.phone, size: 28, color: Colors.black),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                context.read<LanguageCubit>().toggleLanguage();
              },
              child: Row(
                children: [
                  const Icon(Icons.language, color: Colors.black, size: 26),
                  const SizedBox(width: 5),
                  Text(
                    lang == 'ar' ? 'AR' : 'EN',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
