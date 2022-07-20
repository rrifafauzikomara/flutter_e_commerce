import 'package:core/local/database/database_module.dart';
import 'package:dependencies/drift/drift.dart';
import 'package:core/local/database/table/table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductDetailTable])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(AppDatabase db) : super(db);

  Future<void> saveProduct(ProductDetailTableCompanion data) =>
      into(productDetailTable).insert(data, mode: InsertMode.insertOrReplace);

  Future<void> deleteProduct(String productUrl) => (delete(productDetailTable)
        ..where((tbl) => tbl.imageUrl.equals(productUrl)))
      .go();

  Future<ProductDetailTableData> getFavoriteProductByUrl(String productUrl) =>
      (select(productDetailTable)
            ..where((tbl) => tbl.imageUrl.equals(productUrl)))
          .getSingle();

  Future<List<ProductDetailTableData>> getFavoriteProducts() =>
      select(productDetailTable).get();
}
