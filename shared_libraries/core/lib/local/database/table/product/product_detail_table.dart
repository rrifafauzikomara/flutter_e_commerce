import 'package:dependencies/drift/drift.dart';

class ProductDetailTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  IntColumn get stock => integer()();

  IntColumn get price => integer()();

  TextColumn get imageUrl => text()();

  TextColumn get description => text()();

  IntColumn get soldCount => integer()();

  IntColumn get popularity => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
