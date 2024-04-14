import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/strings/value_string.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';
import 'package:flutter_assignment/modules/profile/screens/widgets/edit_photo_text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UploadProfilePhotoWidget extends StatefulWidget {
  const UploadProfilePhotoWidget({super.key});

  @override
  State<UploadProfilePhotoWidget> createState() =>
      _UploadProfilePhotoWidgetState();
}

class _UploadProfilePhotoWidgetState extends State<UploadProfilePhotoWidget> {
  File? _image;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: _image != null
              ? Image.file(_image!)
              : _image != null
                  ? Container(
                      width: buildWidth(context) * 0.50,
                      height: buildHeight(context) * 0.28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsUtility.avtarBgColor,
                        border: Border.all(
                            color:
                                ColorsUtility.avtarBgColor.withOpacity(0.06)),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: _image!.path,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: buildWidth(context) * 0.50,
                      height: buildHeight(context) * 0.28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsUtility.avtarBgColor,
                        border: Border.all(
                            color:
                                ColorsUtility.avtarBgColor.withOpacity(0.06)),
                      ),
                    ),
        ),
        SizedBox(
          height: buildHeight(context) * 0.028,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              // context and builder are
              // required properties in this widget
              context: context,
              builder: (BuildContext context) {
                // we set up a container inside which
                // we create center column and display text

                // Returning SizedBox instead of a Container
                return SizedBox(
                  height: buildHeight(context) * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: buildHeight(context) * 0.028,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: buildWidth(context) * 0.03),
                        child: Text(
                          ValueString.uploadYourPhotoText,
                          style: TextStyleUtility.commonTextStyle(
                              context,
                              ColorsUtility.primaryBlackColor,
                              20.0,
                              FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: buildHeight(context) * 0.035,
                      ),
                      InkWell(
                        onTap: () {
                          getImageFromGallery();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(buildWidth(context) * 0.03),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.photo,
                              ),
                              SizedBox(
                                width: buildWidth(context) * 0.02,
                              ),
                              Text(
                                ValueString.viewPhotoLibraryText,
                                style: TextStyleUtility.commonTextStyle(
                                    context,
                                    ColorsUtility.primaryBlackColor
                                        .withOpacity(0.80),
                                    16.0,
                                    FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: buildWidth(context) * 0.001,
                      ),
                      InkWell(
                        onTap: () {
                          getImageFromCamera();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(buildWidth(context) * 0.03),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.camera_alt_outlined,
                              ),
                              SizedBox(
                                width: buildWidth(context) * 0.02,
                              ),
                              Text(
                                ValueString.takePhotoText,
                                style: TextStyleUtility.commonTextStyle(
                                    context,
                                    ColorsUtility.primaryBlackColor
                                        .withOpacity(0.80),
                                    16.0,
                                    FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: buildWidth(context) * 0.001,
                      ),
                      Padding(
                        padding: EdgeInsets.all(buildWidth(context) * 0.03),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: ColorsUtility.primaryRedColor,
                            ),
                            SizedBox(
                              width: buildWidth(context) * 0.02,
                            ),
                            Text(
                              ValueString.rmPhotoText,
                              style: TextStyleUtility.commonTextStyle(
                                  context,
                                  ColorsUtility.primaryBlackColor
                                      .withOpacity(0.80),
                                  16.0,
                                  FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Center(
            child: EditPhotoTextWidget(
              btnTitle: ValueString.editPhotoText,
            ),
          ),
        )
      ],
    ); //CircleAvatar
  }
}
