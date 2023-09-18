class Product {
  final List<String> name;
  final String category;

  Product({
    required this.name,
    required this.category,
  });
}

final List<Product> productList = [
  Product(
    name:   ["Sandwich", "Hotdog", "Taco"],
    category: "Food",
  ),
  Product(
    name: ["Pizza", "Burger"],
    category: "Food",
  ),
  Product(
    name: ["Salad"],
    category: "Food",
  ),
  Product(
    name: ["Banana"],
    category: "Fruit",
  ),
  Product(
    name: ["Apple"],
    category: "Fruit",
  ),
  Product(
    name: ["Orange"],
    category: "Fruit",
  ),
  Product(
    name: ["Ford Mustang"],
    category: "Vehicle",
  ),
  Product(
    name: ["Toyota Camry"],
    category: "Vehicle",
  ),
  Product(
    name: ["Tesla Model S"],
    category: "Vehicle",
  ),
  Product(
    name: ["Nike T-shirt"],
    category: "Clothes",
  ),
  Product(
    name: ["Levi's Jeans"],
    category: "Clothes",
  ),
  Product(
    name: ["Adidas Hoodie"],
    category: "Clothes",
  ),
];
