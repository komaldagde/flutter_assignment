import 'package:flutter/material.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';

class EditPhotoTextWidget extends StatelessWidget {
  final String btnTitle;
  const EditPhotoTextWidget({super.key, required this.btnTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buildWidth(context) * 0.32,
      decoration: BoxDecoration(
        color: ColorsUtility.editBtnBgColor,
        border: Border.all(
            color: ColorsUtility.containerBorderColor.withOpacity(0.12),
            width: 0.0),
        borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: buildWidth(context) * 0.03,
            top: buildWidth(context) * 0.02,
            bottom: buildWidth(context) * 0.02,
            right: buildWidth(context) * 0.03),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: buildWidth(context) * 0.01),
              child: Icon(
                Icons.camera_alt_outlined,
                size: buildWidth(context) * 0.048,
              ),
            ),
            Text(
              btnTitle,
              style: TextStyleUtility.commonTextStyle(
                  context,
                  ColorsUtility.primaryBlackColor.withOpacity(0.80),
                  16.0,
                  FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
