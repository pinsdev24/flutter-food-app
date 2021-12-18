class Food {
  String name;
  String text;
  double price;
  String image;
  bool isLike = false;

  Food({required this.name, required this.text, required this.price, required this.image, required this.isLike});
}

List<Food> foods = [
  Food(name: "Sushi Taki", text: "Salmon & Cucumber", image: "assets/images/img8.jpg", price: 4.50, isLike: false),
  Food(name: "Fresh Salmon", text: "Salmon fillet & avocado", image: "assets/images/img6.jpg", price: 4.70, isLike: true),
  Food(name: "Tikka Maki", text: "Cooked tuna", image: "assets/images/img7.jpg", price: 4.10, isLike: false),
  Food(name: "Smoked Salmon", text: "Salmon & Cucumber", image: "assets/images/img5.jpg", price: 4.50, isLike: false),
  Food(name: "Nouille", text: "Japan Cook", image: "assets/images/img2.jpg", price: 4.30, isLike: true),
  Food(name: "Kani Maki", text: "Crob sticks", image: "assets/images/img1.jpg", price: 4.90, isLike: true),
];