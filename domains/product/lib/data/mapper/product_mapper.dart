import 'package:product/data/model/response/banner_response_dto.dart';
import 'package:product/data/model/response/product_category_response_dto.dart';
import 'package:product/data/model/response/product_response_dto.dart';
import 'package:product/domain/entity/response/banner_entity.dart';
import 'package:product/domain/entity/response/product_category_entity.dart';
import 'package:product/domain/entity/response/product_entity.dart';

class ProductMapper {
  List<ProductCategoryEntity> mapProductCategoryDTOtoEntity(
      List<ProductCategoryDataDTO> data) {
    List<ProductCategoryEntity> entity = <ProductCategoryEntity>[];

    for (ProductCategoryDataDTO element in data) {
      entity.add(
        mapProductCategoryDataDTOToProductCategoryEntity(
          element,
        ),
      );
    }

    return entity;
  }

  ProductCategoryEntity mapProductCategoryDataDTOToProductCategoryEntity(
          ProductCategoryDataDTO productCategoryDataDTO) =>
      ProductCategoryEntity(
        name: productCategoryDataDTO.name ?? "",
        imageIcon: productCategoryDataDTO.imageIcon ?? "",
        imageCover: productCategoryDataDTO.imageCover ?? "",
        id: productCategoryDataDTO.id ?? "",
      );

  ProductDataEntity mapProductDataDTOToProductDataEntity(
          ProductDataDTO productDataDTO) =>
      ProductDataEntity(
        data: mapProductDataDTOTtoEntity(productDataDTO.data ?? []),
        count: productDataDTO.count ?? 0,
        currentPage: productDataDTO.currentPage ?? 0,
        countPerPage: productDataDTO.countPerPage ?? 0,
      );

  List<ProductEntity> mapProductDataDTOTtoEntity(List<ProductDTO> data) {
    List<ProductEntity> entity = <ProductEntity>[];

    for (ProductDTO element in data) {
      entity.add(
        mapProductDTOToProductEntity(
          element,
        ),
      );
    }

    return entity;
  }

  ProductEntity mapProductDTOToProductEntity(ProductDTO productDTO) =>
      ProductEntity(
        id: productDTO.id ?? "",
        soldCount: productDTO.soldCount ?? 0,
        stock: productDTO.stock ?? 0,
        category: mapProductCategoryDataDTOToProductCategoryEntity(
          productDTO.category ?? ProductCategoryDataDTO(),
        ),
        imageUrl: productDTO.imageUrl ?? "",
        price: productDTO.price ?? 0,
        popularity: productDTO.popularity ?? 0.0,
        description: productDTO.description ?? "",
        name: productDTO.name ?? "",
        seller: mapSellerDTOToSellerEntity(
          productDTO.seller ?? SellerDTO(),
        ),
      );

  SellerEntity mapSellerDTOToSellerEntity(SellerDTO sellerDTO) => SellerEntity(
        city: sellerDTO.city ?? "",
        id: sellerDTO.id ?? "",
        name: sellerDTO.name ?? "",
      );

  List<BannerDataEntity> mapBannerDataDTOToEntity(List<BannerDataDTO> data) {
    List<BannerDataEntity> entity = <BannerDataEntity>[];

    for (BannerDataDTO element in data) {
      entity.add(
        mapBannerDataDTOToBannerDataEntity(
          element,
        ),
      );
    }

    return entity;
  }

  BannerDataEntity mapBannerDataDTOToBannerDataEntity(
          BannerDataDTO bannerDataDTO) =>
      BannerDataEntity(
        headline: bannerDataDTO.headline ?? "",
        caption: bannerDataDTO.caption ?? "",
        sellerId: bannerDataDTO.sellerId ?? "",
        name: bannerDataDTO.name ?? "",
        id: bannerDataDTO.id ?? "",
        productId: bannerDataDTO.productId ?? "",
        imageUrl: bannerDataDTO.imageUrl ?? "",
      );
}
