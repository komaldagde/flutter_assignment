import 'package:flutter/material.dart';
import 'package:flutter_assignment/modules/profile/screens/profile_screen.dart';
import 'package:flutter_assignment/modules/profile/screens/select_profile_photo_screen.dart';

class NavigatorUtility {
  void navigateToProfileScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  void navigateToSelectProfilePhotoScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectProfilePhotoScreen(),
      ),
    );
  }
}
