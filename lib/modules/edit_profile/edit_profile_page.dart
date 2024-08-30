import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../widgets/choose_avatar_bottom_sheet.dart';
import 'edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.find<EditProfileController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          centerTitle: false,
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: ThemeColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: ThemeColor.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: ThemeColor.white,
        body: SafeArea(
            child: Obx(
          () => editProfileController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            await editProfileController.getAllAvatars();
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                backgroundColor: Colors.white,
                                builder: (context) {
                                  return ChooseAvatarBottomSheet(
                                      allAvatars:
                                          editProfileController.allAvatars,
                                      onTap: (profilePic) {
                                        editProfileController
                                            .profilePicUrl.value = profilePic;
                                      });
                                });
                          },
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.expand,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppUtils.getRandomAvatarBgColor(),
                                    radius: 32,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: editProfileController
                                            .profilePicUrl.value,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              color: ThemeColor.accent,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.error,
                                          color: ThemeColor.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: -4,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ThemeColor.accent,
                                        ),
                                        child: Icon(
                                          Icons.edit_rounded,
                                          color: ThemeColor.white,
                                          size: 16,
                                        ),
                                      )),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Form(
                            key: editProfileController.editProfileFormKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "First Name",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.textPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: editProfileController
                                        .firstNameTxtEdtCtrl,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                        color: ThemeColor.black, fontSize: 14),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      prefixIcon: Icon(
                                        Icons.person_outlined,
                                        size: 18,
                                      ),
                                      contentPadding: EdgeInsets.all(12),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Firstname",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: ThemeColor.grey_600),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor: ThemeColor.grey_100,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Last Name",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.textPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: editProfileController
                                        .lastNameTxtEdtCtrl,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                        color: ThemeColor.black, fontSize: 14),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      prefixIcon: Icon(
                                        Icons.person_outlined,
                                        size: 18,
                                      ),
                                      contentPadding: EdgeInsets.all(12),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Lastname",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: ThemeColor.grey_600),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor: ThemeColor.grey_100,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.textPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller:
                                        editProfileController.emailTxtEdtCtrl,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        color: ThemeColor.black, fontSize: 14),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      prefixIcon: Icon(
                                        Icons.mail_outlined,
                                        size: 18,
                                      ),
                                      contentPadding: EdgeInsets.all(12),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Email Address",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: ThemeColor.grey_600),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor: ThemeColor.grey_100,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.textPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller:
                                        editProfileController.mobileTxtEdtCtrl,
                                    keyboardType: TextInputType.phone,
                                    readOnly: true,
                                    style: TextStyle(
                                        color: ThemeColor.black, fontSize: 14),
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      prefixIcon: Icon(
                                        Icons.phone_outlined,
                                        size: 18,
                                      ),
                                      contentPadding: EdgeInsets.all(12),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Mobile Number",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: ThemeColor.grey_600),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor: ThemeColor.grey_100,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                ])),
                        SizedBox(
                          height: 44,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                editProfileController.updateProfile();
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(color: ThemeColor.white),
                              ),
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: ThemeColor.primaryDark,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
        )));
  }
}
