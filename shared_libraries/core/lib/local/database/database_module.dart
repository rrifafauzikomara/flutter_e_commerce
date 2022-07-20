import 'package:core/local/database/dao/dao.dart';
import 'package:core/local/database/table/table.dart';
import 'package:dependencies/drift/drift.dart';

part 'database_module.g.dart';

@DriftDatabase(
  tables: [ProductDetailTable],
  daos: [ProductDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return SqfliteQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    logStatements: true,
  );
}