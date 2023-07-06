import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountServices accountServices = AccountServices(); 
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              onPressed: () {},
              text: "Your Orders",
            ),
            AccountButton(
              onPressed: () {},
              text: "Turn Seller",
            ),
          ],
        ),
        const SizedBox(height: 10,),
          Row(
          children: [
            AccountButton(
              onPressed: () => accountServices.logOut(context),
              text: "Log Out",
            ),
            AccountButton(
              onPressed: () {},
              text: "Your Wish List",
            ),
          ],
        ),
      ],
    );
  }
}
