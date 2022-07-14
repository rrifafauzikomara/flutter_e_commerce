import 'package:cart/data/model/request/add_to_chart_dto.dart';
import 'package:cart/data/model/response/chart_response_dto.dart';
import 'package:cart/domain/entity/request/add_to_chart_entity.dart';
import 'package:cart/domain/entity/response/chart_entity.dart';

class ChartMapper {
  UserInfoChartEntity mapUserInfoChartDtoToEntity(UserInfoChartDto dto) {
    return UserInfoChartEntity(
      id: dto.id ?? "",
      name: dto.name ?? "",
      city: dto.city ?? "",
    );
  }

  CategoryChartEntity mapCategoryChartDtoToEntity(CategoryChartDto dto) {
    return CategoryChartEntity(
      id: dto.id ?? "",
      name: dto.name ?? "",
      imageIcon: dto.imageIcon ?? "",
      imageCover: dto.imageCover ?? "",
    );
  }

  ProductChartEntity mapProductChartDtoToEntity(ProductChartDto dto) {
    return ProductChartEntity(
      id: dto.id ?? "",
      name: dto.name ?? "",
      owner: dto.owner ?? "",
      stock: dto.stock ?? 0,
      price: dto.price ?? 0,
      category: mapCategoryChartDtoToEntity(dto.category),
      imageUrl: dto.imageUrl ?? "",
      description: dto.description ?? "",
      userInfo: mapUserInfoChartDtoToEntity(dto.userInfo),
      soldCount: dto.soldCount ?? 0,
      popularity: dto.popularity ?? 0.0,
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  ProductsChartEntity mapProductsChartDtoToEntity(ProductsChartDto dto) {
    return ProductsChartEntity(
      product: mapProductChartDtoToEntity(dto.product),
      quantity: dto.quantity ?? 0,
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  List<ProductsChartEntity> mapListProductsChartDtoToEntity(
      List<ProductsChartDto> dto) {
    final products = <ProductsChartEntity>[];
    for (ProductsChartDto i in dto) {
      products.add(mapProductsChartDtoToEntity(i));
    }
    return products;
  }

  ChartDataEntity mapChartDataDtoToEntity(ChartDataDto dto) {
    return ChartDataEntity(
      id: dto.id ?? "",
      owner: dto.owner ?? "",
      amount: dto.amount ?? 0,
      product: mapListProductsChartDtoToEntity(dto.product),
    );
  }

  AddToChartDto mapAddToChartEntityToDto(AddToChartEntity entity) {
    return AddToChartDto(
      productId: entity.productId,
      amount: entity.amount,
    );
  }
}
