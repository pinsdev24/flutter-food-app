import 'package:app_api/constant.dart';
import 'package:app_api/models/order.dart';
import 'package:app_api/screens/components/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  double total = 0;

  void computeTotal() {
    for (Order order in orders)
      total += order.price * order.number;
    total = parseTotal(total);
  }

  dynamic parseTotal(double total) => double.parse((total).toStringAsFixed(1));

  @override
  void initState() {
    super.initState();
    this.computeTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("You Order", style: kHeadingTextStyle,),
          SizedBox(height: 20.0,),
          Expanded(
              child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    Order order = orders[index];
                    return Slidable(
                        actionPane: SlidableBehindActionPane(),
                        actionExtentRatio: .2,
                        secondaryActions: [
                          IconSlideAction(
                            caption: "Remove",
                            color: Colors.redAccent,
                            icon: Icons.delete,
                            onTap: (){
                              setState(() {
                                orders.removeAt(orders.indexOf(order));
                                double newTotal = total - (order.price * order.number);
                                total = parseTotal(newTotal);
                              });
                            },
                          )
                        ],
                        child: OrderCard(order: order)
                    );
                  })
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery time", style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700
              ),),
              Text("45 min", style: TextStyle(
                color: kTextLightColor,
              ),),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Promo Code", style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700
              ),),
              Text("XF237", style: TextStyle(
                color: kTextLightColor,
              ),),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700
              ),),
              Text("\$$total", style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700
              ),),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

