import 'package:flutter/material.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  const LabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: buildHeight(context) * 0.01),
      child: RichText(
        text: TextSpan(
            text: label,
            style: TextStyleUtility.commonTextStyle(
                context,
                ColorsUtility.labelColor.withOpacity(0.70),
                14.0,
                FontWeight.w400),
            children: const [
              TextSpan(
                  text: '*',
                  style: TextStyle(color: ColorsUtility.secondaryRedColor))
            ]),
      ),
    );
  }
}
