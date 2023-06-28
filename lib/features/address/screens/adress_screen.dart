// ignore_for_file: deprecated_member_use

import 'package:amazon_clone/common/widgets/custom_textfields.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  final String totalAmount;
  static const routeName = '/address-screen';
  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeControler = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  List<PaymentItem> paymentItems = [];

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeControler.dispose();
    cityController.dispose();
  }

  void onApplePayResult(res) {}
  void onGooglePayResult(res) {}
  @override
  Widget build(BuildContext context) {
    var address = "101 Fake Street Address, Kathmandu, Nepal";
    // var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black12,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: 'Flat, Houser Number, Building',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      controller: areaController,
                      hintText: 'Area, Street',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      controller: pincodeControler,
                      hintText: 'Pin Code',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Town/City',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              ApplePayButton(
                paymentConfigurationAsset: 'applepay.json',
                width: double.infinity,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 50),
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                height: 50,
                width: double.infinity,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
