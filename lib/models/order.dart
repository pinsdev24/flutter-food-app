class Order{
  String name;
  String text;
  double price;
  String image;
  int number;

  Order({required this.name, required this.text, required this.price, required this.image, required this.number});
}

List<Order> orders = [
  Order(name: "Sushi Taki", text: "Salmon & Cucumber", image: "assets/images/img8.jpg", price: 4.50, number: 2),
  Order(name: "Fresh Salmon", text: "Salmon fillet & avocado", image: "assets/images/img6.jpg", price: 4.70, number: 3),
  Order(name: "Tikka Maki", text: "Cooked tuna", image: "assets/images/img7.jpg", price: 4.10, number: 2),
  //Order(name: "Smoked Salmon", text: "Salmon & Cucumber", image: "assets/images/img5.jpg", price: 4.50, number: 1),
];