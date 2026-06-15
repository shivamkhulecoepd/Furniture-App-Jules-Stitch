import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/product_repository.dart';

final productRepositoryProvider = Provider((ref) {
  return ProductRepository();
});
