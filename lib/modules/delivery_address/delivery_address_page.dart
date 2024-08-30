import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'delivery_address_controller.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryAddressController deliveryAddressController =
        Get.find<DeliveryAddressController>();
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
            "Delivery Address",
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
            child: Obx(() => deliveryAddressController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(children: [
                      SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/current_location.png',
                                  width: 160,
                                ),
                              ),
                              SizedBox(
                                height: 44,
                              ),
                              Text(
                                "Address",
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
                                    deliveryAddressController.addressTxtEdtCtrl,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                    color: ThemeColor.black, fontSize: 14),
                                maxLines: 8,
                                decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding: EdgeInsets.all(12),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  hintText: "Write your delivery address",
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: ThemeColor.grey_600),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: ThemeColor.grey_100,
                                ),
                                textInputAction: TextInputAction.next,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  deliveryAddressController.updateAddress();
                                },
                                child: Text(
                                  "Update",
                                  style: TextStyle(color: ThemeColor.white),
                                ),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: ThemeColor.primaryDark,
                                ),
                              )),
                        ],
                      )
                    ])))));
  }
}
