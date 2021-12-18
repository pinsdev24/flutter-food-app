import 'package:app_api/models/food.dart';
import 'package:app_api/screens/components/food_card.dart';
import 'package:app_api/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'category_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultPadding,),
            Text("Fresh Healthy", style: kHeadingTextStyle,),
            Text("Delicious Sushi", style: TextStyle(
                color: kTextLightColor,
                fontWeight: FontWeight.w500,
                fontSize: 25.0
            ),),
            SizedBox(height: kDefaultPadding,),
            CategoryList(),
            SizedBox(height: kDefaultPadding,),
            Center(
              child: Wrap(
                children: foods.map(
                  (food) => GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(food: food)));
                    },
                    child: FoodCard(food: food),
                  )
                ).toList(),
              ),
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
