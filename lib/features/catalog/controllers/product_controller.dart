import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/product_repository.dart';
import '../../../models/product.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ref.watch(productRepositoryProvider).getProducts();
});

final productDetailsProvider = FutureProvider.family<Product?, String>((ref, id) async {
  return ref.watch(productRepositoryProvider).getProductById(id);
});

final searchProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<Product>>((ref) async {
  final query = ref.watch(searchProvider);
  if (query.isEmpty) return [];
  return ref.watch(productRepositoryProvider).searchProducts(query);
});
