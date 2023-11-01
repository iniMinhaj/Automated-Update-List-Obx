import 'package:get/get.dart';
import 'package:update_list/model/address.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  final addressList = ShowAddressModel().obs;
  final isLoading = false.obs;

  String token = "52|LixQ474hLdePHnA0hGefCr1x3tp6aGNH1nqEa1BX9fd12fa7";

  Future<ShowAddressModel> fetchAddress() async {
    isLoading(true);
    final response = await http.get(
      Uri.parse("https://shopperz.foodking.dev/api/frontend/address"),
      headers: {"Authorization": "Bearer $token"},
    );

    print("response = ${response.body}");
    if (response.statusCode == 200) {
      isLoading(false);
      addressList.value = showAddressModelFromJson(response.body);

      return addressList.value;
    } else {
      return addressList.value;
    }
  }
}
