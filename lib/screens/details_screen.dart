import 'package:app_api/constant.dart';
import 'package:app_api/models/food.dart';
import 'package:app_api/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsScreen extends StatefulWidget {
  final Food food;
  const DetailsScreen({Key? key, required this.food}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with SingleTickerProviderStateMixin{
  int numOrder = 1;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5), vsync: this
    );
    controller.addStatusListener((status) async{
      if (status == AnimationStatus.completed){
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void showToast(BuildContext context){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text("New order added", style: TextStyle(color: Colors.white),),
        action: SnackBarAction(label: "Dismiss", onPressed: scaffold.hideCurrentSnackBar),
        backgroundColor: Colors.black,
      )
    );
  }

  void showDoneDialog() => showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            "assets/animation/checked_loading.json",
            repeat: false,
            controller: controller,
            onLoaded: (composition) {
              controller.forward();
            }
          ),
          Text("Enjoy your order", style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 16)
        ],
      ),
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("Details", style: kTitleTextStyle.copyWith(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 60.0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45.0)
                    )
                  ),
                )
              ),
              Positioned(
                top: 20.0,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.food.image,
                  child: ClipOval(
                    child: Image.asset(
                      widget.food.image,
                      fit: BoxFit.cover,
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                )
              ),
              Positioned(
                top: 250.0,
                left: kDefaultPadding,
                right: kDefaultPadding,
                child: Column(
                  children: [
                    Text(widget.food.name, style: kHeadingTextStyle,),
                    SizedBox(height: kDefaultPadding / 2,),
                    Text(widget.food.text),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      "Delicious food, made in japan, it is a tradition food in this country. Ingredient it is : fish, vegetal, olive oil",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: kTextLightColor
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: kDefaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${widget.food.price}", style: TextStyle(
                          fontSize: 25.0,
                          color: kTextLightColor
                        ),),
                        //Container(height: 25.0,width: 1.0,color: Colors.grey,),
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if (numOrder > 0)
                                        numOrder--;
                                    });
                                  },
                                  child: Icon(Icons.horizontal_rule, color: Colors.white,)
                                ),
                                Text(
                                  "$numOrder",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      numOrder++;
                                    });
                                  },
                                  child: Icon(Icons.add, color: Colors.white,)
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
               )
              ),
              Positioned(
                bottom: 50.0,
                left: kDefaultPadding,
                right: kDefaultPadding,
                child: InkWell(
                  onTap: (){
                    orders.add(Order(name: widget.food.name, text: widget.food.text, price: widget.food.price, image: widget.food.image, number: numOrder));
                    showDoneDialog();
                  },
                  child: Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.pinkAccent
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0
                          )
                        ),
                        SizedBox(width: 10.0,),
                        Icon(
                          Icons.shopping_cart, color: Colors.white
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
