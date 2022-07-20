import 'package:dependencies/drift/drift.dart';

class ProductDetailTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get stock => integer()();

  IntColumn get price => integer()();

  TextColumn get imageUrl => text()();

  TextColumn get description => text()();

  IntColumn get soldCount => integer()();

  RealColumn get popularity => real()();
}
