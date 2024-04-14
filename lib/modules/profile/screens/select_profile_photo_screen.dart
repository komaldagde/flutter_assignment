import 'package:flutter/material.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/strings/assets_constant.dart';
import 'package:flutter_assignment/common/utilities/strings/value_string.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';
import 'package:flutter_assignment/common/widgets/common_text_button_widget.dart';
import 'package:flutter_assignment/modules/profile/screens/widgets/tab_bar_widget.dart';
import 'package:flutter_assignment/modules/profile/screens/widgets/upload_profile_photo_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectProfilePhotoScreen extends StatefulWidget {
  const SelectProfilePhotoScreen({super.key});

  @override
  State<SelectProfilePhotoScreen> createState() =>
      _SelectProfilePhotoScreenState();
}

class _SelectProfilePhotoScreenState extends State<SelectProfilePhotoScreen> {
  List<String> avtarIconList = [
    AssetsConstant.avtarIcon1,
    AssetsConstant.avtarIcon2,
    AssetsConstant.avtarIcon3,
    AssetsConstant.avtarIcon4,
    AssetsConstant.avtarIcon5,
    AssetsConstant.avtarIcon6,
    AssetsConstant.avtarIcon7,
    AssetsConstant.avtarIcon8,
    AssetsConstant.avtarIcon9,
    AssetsConstant.avtarIcon10,
    AssetsConstant.avtarIcon11,
    AssetsConstant.avtarIcon12,
    AssetsConstant.avtarIcon13,
    AssetsConstant.avtarIcon14,
    AssetsConstant.avtarIcon15,
    AssetsConstant.avtarIcon16
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: buildWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: buildHeight(context) * 0.065,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(AssetsConstant.closeIcon)),
              SizedBox(
                height: buildHeight(context) * 0.03,
              ),
              Text(
                ValueString.chooseProfilePicText,
                style: TextStyleUtility.commonTextStyle(
                  context,
                  ColorsUtility.primaryBlackColor,
                  20.0,
                  FontWeight.bold,
                ),
              ),
              SizedBox(
                height: buildHeight(context) * 0.01,
              ),
              Text(
                ValueString.chooseProfilePicContextText,
                style: TextStyleUtility.commonTextStyle(
                  context,
                  ColorsUtility.primaryBlackColor,
                  16.0,
                  FontWeight.w400,
                ),
              ),
              SizedBox(
                height: buildHeight(context) * 0.02,
              ),
              TabBarWidget(
                tabBarChildrenList: [
                  const UploadProfilePhotoWidget(),
                  GridView.count(
                    crossAxisCount: 4,
                    childAspectRatio: 1.2,
                    children: avtarIconList.map((value) {
                      return SizedBox(
                          width: 100, height: 100, child: Image.asset(value));
                    }).toList(),
                  ),
                ],
                tabBarTitleList: const [
                  ValueString.choosePhotoText,
                  ValueString.avatarText
                ],
                choiceTab: ValueString.choosePhotoText,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: ColorsUtility.primaryWhiteColor, width: 1.5))),
        padding: EdgeInsets.all(buildWidth(context) * 0.05),
        child: CommonTextButtonWidget(
            isIcon: false,
            height: buildHeight(context) * 0.06,
            width: buildWidth(context) * 0.90,
            title: ValueString.saveButtonText,
            titleFontSize: 14.0,
            bgColor: ColorsUtility.transparentColor,
            titleTextColor: ColorsUtility.primaryGreenColor,
            titleFontWeight: FontWeight.w400,
            onPressed: () {}),
      ),
    );
  }
}
