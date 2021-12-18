import 'package:flutter/material.dart';

import '../constant.dart';
import 'components/order_body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f5ff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: (){},
          )
        ],
      ),
      body: OrderBody(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0)
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Row(
                children: [
                  Text("Place Order", style: TextStyle(
                    color: Colors.white
                  ),),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
