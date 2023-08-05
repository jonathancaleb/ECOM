//import 'package:am_ecom/data/model/response/language_model.dart';
import 'package:am_ecom/util/app_constants.dart';
import 'package:flutter/material.dart';

class LanguageRepo {
  List getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
