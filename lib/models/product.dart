import 'package:equatable/equatable.dart';
class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewsCount;
  final bool isFavorite;
  const Product({required this.id, required this.name, required this.description, required this.price, required this.imageUrl, required this.category, this.rating = 0.0, this.reviewsCount = 0, this.isFavorite = false});
  @override
  List<Object?> get props => [id, name, description, price, imageUrl, category, rating, reviewsCount, isFavorite];
}
