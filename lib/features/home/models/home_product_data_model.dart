
///home product model class
class HomeProductDataModel {
  ///default constructor
  const HomeProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  ///id of product
  final String id;

  ///name of product
  final String name;

  ///description of product
  final String description;

  ///price  of product
  final double price;

  ///imageurl of product
  final String imageUrl;
}
