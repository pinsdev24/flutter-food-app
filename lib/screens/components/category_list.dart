import 'package:app_api/constant.dart';
import 'package:flutter/material.dart';

// We need stateful widget because we need to change some sate on our category
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> categories = ["Rolls", "Soups", "Nigiri"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: index == selectedCategory ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(2,8),
                blurRadius: 40,
                color: kShadowColor
              )
            ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectedCategory
                      ? Colors.pinkAccent
                      : Colors.transparent,
                ),
              ),
              SizedBox(width: 10.0,),
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: index == selectedCategory
                      ? Color(0xFF12153D)
                      : Colors.black.withOpacity(0.4),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

