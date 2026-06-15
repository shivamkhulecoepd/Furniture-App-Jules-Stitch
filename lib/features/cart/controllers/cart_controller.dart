import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/cart_repository.dart';
import '../../../models/product.dart';

class CartState {
  final List<CartItem> items;
  final bool isLoading;

  CartState({required this.items, this.isLoading = false});

  double get subtotal => items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  double get deliveryFee => items.isEmpty ? 0 : 20.0;
  double get total => subtotal + deliveryFee;

  CartState copyWith({List<CartItem>? items, bool? isLoading}) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CartController extends StateNotifier<CartState> {
  final CartRepository _repository;

  CartController(this._repository) : super(CartState(items: [])) {
    loadCart();
  }

  Future<void> loadCart() async {
    state = state.copyWith(isLoading: true);
    final items = await _repository.getCartItems();
    state = state.copyWith(items: items, isLoading: false);
  }

  Future<void> addToCart(Product product) async {
    await _repository.addToCart(product);
    await loadCart();
  }

  Future<void> removeFromCart(String productId) async {
    await _repository.removeFromCart(productId);
    await loadCart();
  }

  Future<void> updateQuantity(String productId, int delta) async {
    await _repository.updateQuantity(productId, delta);
    await loadCart();
  }
}

final cartRepositoryProvider = Provider((ref) => CartRepository());

final cartProvider = StateNotifierProvider<CartController, CartState>((ref) {
  return CartController(ref.watch(cartRepositoryProvider));
});
