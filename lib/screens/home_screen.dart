import 'package:app_api/constant.dart';
import 'package:app_api/screens/components/home_body.dart';
import 'package:app_api/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<Null> refreshList() async{
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f5ff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.share),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        backgroundColor: Colors.black,
        color: Colors.white,
        child: HomeBody()
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },icon: Icon(Icons.home_outlined, color: Colors.white)),
            IconButton(onPressed: (){},icon: Icon(Icons.assessment_outlined, color: Colors.white)),
            IconButton(onPressed: (){},icon: Icon(Icons.chat_outlined, color: Colors.white)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen()));
            },icon: Icon(Icons.person_outlined, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

