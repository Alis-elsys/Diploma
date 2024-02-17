import '/components/nav_bar.dart';
import '../pages/home_page.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends HomePageWidget {
  bool fullList = true;

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NavBar1 component.
  late CustomNavBar navBarModel;

  HomePageModel();


  void initState(BuildContext context) {
    // Initialize state of NavBar1 component.
    // 1. Create FocusNode and TextEditingController for TextField.
    textFieldFocusNode = FocusNode();
    textController = TextEditingController();
    textControllerValidator = (context, value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };
    //Create navBarModel 
    navBarModel = CustomNavBar();
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}