import 'package:core/local/database/database_module.dart';

abstract class ProductLocalDataSource {
  const ProductLocalDataSource();

  Future<bool> saveProduct(ProductDetailTableCompanion data);

  Future<bool> deleteProduct(String productUrl);

  Future<ProductDetailTableData> getFavoriteProductByUrl(String productUrl);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final AppDatabase appDatabase;

  const ProductLocalDataSourceImpl({required this.appDatabase});

  @override
  Future<bool> deleteProduct(String productUrl) async {
    try {
      await appDatabase.productDao.deleteProduct(productUrl);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveProduct(ProductDetailTableCompanion data) async {
    try {
      await appDatabase.productDao.saveProduct(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductDetailTableData> getFavoriteProductByUrl(
      String productUrl) async {
    try {
      return await appDatabase.productDao.getFavoriteProductByUrl(productUrl);
    } catch (e) {
      rethrow;
    }
  }
}
