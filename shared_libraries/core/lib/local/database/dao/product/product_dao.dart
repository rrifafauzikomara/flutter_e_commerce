import 'package:core/local/database/database_module.dart';
import 'package:dependencies/drift/drift.dart';
import 'package:core/local/database/table/table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductDetailTable])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(AppDatabase db) : super(db);
}
