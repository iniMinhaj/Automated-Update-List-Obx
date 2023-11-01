import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:update_list/controller/address_controller.dart';
import 'package:update_list/controller/submit_controlller.dart';
import 'package:update_list/view/home_page.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubmitController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.fullName,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.countryCode,
                    decoration: InputDecoration(
                      hintText: "Country Code",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.phone,
                    decoration: InputDecoration(
                      hintText: "Phone",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.address,
                    decoration: InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.country,
                    decoration: InputDecoration(
                      hintText: "Country",
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        controller.submitAddress();
                        await AddressController().fetchAddress();
                        Get.to(Homepage());
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
