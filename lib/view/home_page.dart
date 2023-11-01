import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:update_list/controller/address_controller.dart';
import 'package:update_list/view/add_address.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final addressController = Get.put(AddressController());

  @override
  void initState() {
    addressController.fetchAddress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update List Automatically"),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => const AddNewAddress());
              },
              child: const Text("Add"))
        ],
      ),
      body: Obx(
        () => addressController.addressList.value.data == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: addressController.addressList.value.data!.length,
                itemBuilder: (context, index) {
                  final address = addressController.addressList.value.data;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Text(address![index].fullName.toString()),
                          Text(address[index].address.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
