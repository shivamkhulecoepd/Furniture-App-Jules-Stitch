import '../../../models/product.dart';

class ProductRepository {
  final List<Product> _mockProducts = [
    const Product(
      id: '1',
      name: 'Sabra Chair',
      description: 'Modern and comfortable chair with ergonomic design.',
      price: 240.0,
      imageUrl: 'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=2864&auto=format&fit=crop',
      category: 'Chairs',
      rating: 4.8,
      reviewsCount: 128,
    ),
    const Product(
      id: '2',
      name: 'Velvet Sofa',
      description: 'Luxurious velvet sofa that adds elegance to your living room.',
      price: 850.0,
      imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=3870&auto=format&fit=crop',
      category: 'Sofas',
      rating: 4.9,
      reviewsCount: 85,
    ),
    const Product(
      id: '3',
      name: 'Oak Table',
      description: 'Handcrafted oak dining table for family gatherings.',
      price: 420.0,
      imageUrl: 'https://images.unsplash.com/photo-1530018607912-eff2df114f11?q=80&w=3870&auto=format&fit=crop',
      category: 'Tables',
      rating: 4.7,
      reviewsCount: 64,
    ),
    const Product(
      id: '4',
      name: 'Minimal Lamp',
      description: 'Sleek and minimalist lamp for modern workspaces.',
      price: 85.0,
      imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed657f89ad?q=80&w=3870&auto=format&fit=crop',
      category: 'Lamps',
      rating: 4.6,
      reviewsCount: 210,
    ),
  ];

  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockProducts;
  }

  Future<Product?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts.firstWhere((p) => p.id == id);
  }

  Future<List<Product>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
