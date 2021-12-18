import 'package:app_api/models/order.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class OrderCard extends StatefulWidget {
  final Order order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 120.0,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 8.0),
                      blurRadius: 20.0,
                      color: kShadowColor
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 20.0, 20.0,20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.order.name, style: TextStyle(
                          fontSize: 18.0,
                          color: kTitleTextColor,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 5.0,),
                      Text(widget.order.text, style: TextStyle(color: kTextLightColor),),
                      SizedBox(height: 5.0,),
                      Text("\$${widget.order.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  Text("${widget.order.number}x")
                ],
              ),
            )
        ),
        Positioned(
          bottom: 15.0,
          top: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width:100,
              image: AssetImage(widget.order.image),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}

