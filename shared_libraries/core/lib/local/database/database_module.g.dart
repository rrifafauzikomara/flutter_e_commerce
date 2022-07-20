// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductDetailTableData extends DataClass
    implements Insertable<ProductDetailTableData> {
  final int id;
  final String name;
  final int stock;
  final int price;
  final String imageUrl;
  final String description;
  final int soldCount;
  final double popularity;
  ProductDetailTableData(
      {required this.id,
      required this.name,
      required this.stock,
      required this.price,
      required this.imageUrl,
      required this.description,
      required this.soldCount,
      required this.popularity});
  factory ProductDetailTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductDetailTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      stock: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stock'])!,
      price: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      soldCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sold_count'])!,
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['stock'] = Variable<int>(stock);
    map['price'] = Variable<int>(price);
    map['image_url'] = Variable<String>(imageUrl);
    map['description'] = Variable<String>(description);
    map['sold_count'] = Variable<int>(soldCount);
    map['popularity'] = Variable<double>(popularity);
    return map;
  }

  ProductDetailTableCompanion toCompanion(bool nullToAbsent) {
    return ProductDetailTableCompanion(
      id: Value(id),
      name: Value(name),
      stock: Value(stock),
      price: Value(price),
      imageUrl: Value(imageUrl),
      description: Value(description),
      soldCount: Value(soldCount),
      popularity: Value(popularity),
    );
  }

  factory ProductDetailTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDetailTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      stock: serializer.fromJson<int>(json['stock']),
      price: serializer.fromJson<int>(json['price']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      description: serializer.fromJson<String>(json['description']),
      soldCount: serializer.fromJson<int>(json['soldCount']),
      popularity: serializer.fromJson<double>(json['popularity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'stock': serializer.toJson<int>(stock),
      'price': serializer.toJson<int>(price),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'description': serializer.toJson<String>(description),
      'soldCount': serializer.toJson<int>(soldCount),
      'popularity': serializer.toJson<double>(popularity),
    };
  }

  ProductDetailTableData copyWith(
          {int? id,
          String? name,
          int? stock,
          int? price,
          String? imageUrl,
          String? description,
          int? soldCount,
          double? popularity}) =>
      ProductDetailTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        stock: stock ?? this.stock,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        soldCount: soldCount ?? this.soldCount,
        popularity: popularity ?? this.popularity,
      );
  @override
  String toString() {
    return (StringBuffer('ProductDetailTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stock: $stock, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('soldCount: $soldCount, ')
          ..write('popularity: $popularity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, stock, price, imageUrl, description, soldCount, popularity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDetailTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.stock == this.stock &&
          other.price == this.price &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description &&
          other.soldCount == this.soldCount &&
          other.popularity == this.popularity);
}

class ProductDetailTableCompanion
    extends UpdateCompanion<ProductDetailTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> stock;
  final Value<int> price;
  final Value<String> imageUrl;
  final Value<String> description;
  final Value<int> soldCount;
  final Value<double> popularity;
  const ProductDetailTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.stock = const Value.absent(),
    this.price = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.soldCount = const Value.absent(),
    this.popularity = const Value.absent(),
  });
  ProductDetailTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int stock,
    required int price,
    required String imageUrl,
    required String description,
    required int soldCount,
    required double popularity,
  })  : name = Value(name),
        stock = Value(stock),
        price = Value(price),
        imageUrl = Value(imageUrl),
        description = Value(description),
        soldCount = Value(soldCount),
        popularity = Value(popularity);
  static Insertable<ProductDetailTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? stock,
    Expression<int>? price,
    Expression<String>? imageUrl,
    Expression<String>? description,
    Expression<int>? soldCount,
    Expression<double>? popularity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stock != null) 'stock': stock,
      if (price != null) 'price': price,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (soldCount != null) 'sold_count': soldCount,
      if (popularity != null) 'popularity': popularity,
    });
  }

  ProductDetailTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? stock,
      Value<int>? price,
      Value<String>? imageUrl,
      Value<String>? description,
      Value<int>? soldCount,
      Value<double>? popularity}) {
    return ProductDetailTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      soldCount: soldCount ?? this.soldCount,
      popularity: popularity ?? this.popularity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (soldCount.present) {
      map['sold_count'] = Variable<int>(soldCount.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductDetailTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stock: $stock, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('soldCount: $soldCount, ')
          ..write('popularity: $popularity')
          ..write(')'))
        .toString();
  }
}

class $ProductDetailTableTable extends ProductDetailTable
    with TableInfo<$ProductDetailTableTable, ProductDetailTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductDetailTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int?> stock = GeneratedColumn<int?>(
      'stock', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int?> price = GeneratedColumn<int?>(
      'price', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _soldCountMeta = const VerificationMeta('soldCount');
  @override
  late final GeneratedColumn<int?> soldCount = GeneratedColumn<int?>(
      'sold_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, stock, price, imageUrl, description, soldCount, popularity];
  @override
  String get aliasedName => _alias ?? 'product_detail_table';
  @override
  String get actualTableName => 'product_detail_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductDetailTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('sold_count')) {
      context.handle(_soldCountMeta,
          soldCount.isAcceptableOrUnknown(data['sold_count']!, _soldCountMeta));
    } else if (isInserting) {
      context.missing(_soldCountMeta);
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    } else if (isInserting) {
      context.missing(_popularityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDetailTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductDetailTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductDetailTableTable createAlias(String alias) {
    return $ProductDetailTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ProductDetailTableTable productDetailTable =
      $ProductDetailTableTable(this);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productDetailTable];
}
