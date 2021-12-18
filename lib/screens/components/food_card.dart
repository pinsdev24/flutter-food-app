import 'package:app_api/constant.dart';
import 'package:app_api/models/food.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      height: 220,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 10.0,
            child: Container(
              height: 120.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(food.name, style: TextStyle(
                      fontSize: 20.0,
                      color: kTitleTextColor,
                      fontWeight: FontWeight.w700
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                    Text(food.text, style: TextStyle(color: kTextLightColor),maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${food.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        Icon(
                          Icons.favorite, color: food.isLike ? Colors.pink : Colors.black12,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0
                )
              ]
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Hero(
                      tag: food.image,
                      child: Image.asset(
                        food.image,
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
