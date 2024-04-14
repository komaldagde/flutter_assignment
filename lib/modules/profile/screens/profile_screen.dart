import 'package:flutter/material.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/navigator_utility.dart';
import 'package:flutter_assignment/common/utilities/strings/assets_constant.dart';
import 'package:flutter_assignment/common/utilities/strings/value_string.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';
import 'package:flutter_assignment/common/widgets/common_text_button_widget.dart';
import 'package:flutter_assignment/common/widgets/common_text_form_field.dart';
import 'package:flutter_assignment/modules/profile/screens/widgets/edit_photo_text_widget.dart';
import 'package:flutter_assignment/modules/profile/screens/widgets/label_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: buildWidth(context) * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, //add this line if you used column widget in your code

                children: [
                  SizedBox(
                    height: buildHeight(context) * 0.05,
                  ),
                  Text(
                    ValueString.titleText,
                    style: TextStyleUtility.commonTextStyle(
                      context,
                      ColorsUtility.primaryBlackColor,
                      20.0,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: buildHeight(context) * 0.03,
                  ),
                  Text(
                    ValueString.contentText,
                    style: TextStyleUtility.commonTextStyle(
                      context,
                      ColorsUtility.primaryBlackColor,
                      16.0,
                      FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: buildHeight(context) * 0.05,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        NavigatorUtility()
                            .navigateToSelectProfilePhotoScreen(context);
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          SizedBox(
                            width: buildWidth(context) * 0.45,
                            child: Image.asset(
                              AssetsConstant.avtarIcon,
                              height: buildHeight(context) * 0.16,
                              // alignment: Alignment.center,
                            ),
                          ),
                          const Positioned(
                            right: 40,
                            left: 60,
                            bottom: -22,
                            child: EditPhotoTextWidget(
                              btnTitle: ValueString.editText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: buildHeight(context) * 0.05,
                  ),
                  const LabelWidget(
                    label: ValueString.firstNameText,
                  ),
                  CommonTextFormField(),
                  SizedBox(
                    height: buildHeight(context) * 0.03,
                  ),
                  const LabelWidget(
                    label: ValueString.lastNameText,
                  ),
                  CommonTextFormField(),
                  SizedBox(
                    height: buildHeight(context) * 0.03,
                  ),
                  const LabelWidget(
                    label: ValueString.yearOfBirthText,
                  ),
                  Container(
                      width: buildWidth(context) * 0.90,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsUtility.primaryGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButton<int>(
                        underline: const SizedBox(),
                        icon: const SizedBox(),
                        value: selectedYear,
                        items: List.generate(
                                50, (index) => DateTime.now().year - index)
                            .map((year) => DropdownMenuItem<int>(
                                  value: year,
                                  child: Text('$year'),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value!;
                          });
                        },
                      )),
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
                titleFontWeight: FontWeight.w400,
                onPressed: () {}),
          )),
    );
  }
}
