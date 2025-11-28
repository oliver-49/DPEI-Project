import 'package:flutter/cupertino.dart';

import '../../../l10n/app_localizations.dart';

const imagepath = "assets/images/";

List<String> craftsMansImages = [
  "craftsman3.png",
  "craftsman2.png",
  "craftsman1.png",
  "craftsman4.png",
  "craftsman5.png",
  "craftsman6.png",
  "craftsman7.png",
  "craftsman8.png",
  "craftsman9.png",
];
List<String> gall = [
  "craftsman1.png",
  "craftsman4.png",
  "craftsman5.png",
  "craftsman6.png",
];

List<String> timesAM = ["09:00", "10:00", "11:00", "12:00"];
List<String> timesPM = [
  "01:00",
  "02:00",
  "03:00",
  "04:00",
  "05:00",
  "06:00",
  "07:00",
  "08:00",
];
lang(BuildContext context)=>AppLocalizations.of(context)!;
List<String> skills(BuildContext context) => [
  lang(context).sink,
  lang(context).shower,
  lang(context).boiler,
  lang(context).toilet];

List<String> reviews(BuildContext context) => [
  lang(context).comment,
  lang(context).comment,
  lang(context).comment
];
