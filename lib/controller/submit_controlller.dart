import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:update_list/controller/address_controller.dart';
import 'package:update_list/model/address_model.dart';

class SubmitController extends GetxController {
  final addController = Get.put(AddressController());
  final addressModel = AddressModel().obs;
  final isLoading = false.obs;

  final fullName = TextEditingController();
  final countryCode = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final country = TextEditingController();

  String token = "52|LixQ474hLdePHnA0hGefCr1x3tp6aGNH1nqEa1BX9fd12fa7";

  Future<void> submitAddress() async {
    isLoading(true);
    final response = await http.post(
        Uri.parse("https://shopperz.foodking.dev/api/frontend/address"),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: {
          "full_name": fullName.text,
          "country_code": country.text,
          "phone": phone.text,
          "address": address.text,
          "country": country.text
        });

    print("response = ${response.body}");
    if (response.statusCode == 200) {
      isLoading(false);
      final data = addressModelFromJson(response.body);
      print(data.data);
      addressModel.value = data;
    }
  }
}
