import 'package:payment/data/model/response/all_payment_response_dto.dart';
import 'package:payment/data/model/response/create_payment_response_dto.dart';
import 'package:payment/data/model/response/create_transaction_response_dto.dart';
import 'package:payment/data/model/response/product_history_response_dto.dart';
import 'package:payment/domain/entity/response/create_payment_entity.dart';
import 'package:payment/domain/entity/response/create_transaction_entity.dart';
import 'package:payment/domain/entity/response/payment_entity.dart';
import 'package:payment/domain/entity/response/product_history_entity.dart';

class PaymentMapper {
  PaymentDataEntity _mapPaymentDataDtoToEntity(PaymentDataDto dto) {
    return PaymentDataEntity(
      name: dto.name ?? "",
      code: dto.code ?? "",
      paymentType: dto.paymentType ?? "",
      isActivated: dto.isActivated ?? false,
    );
  }

  List<PaymentDataEntity> mapListPaymentDataDtoToEntity(
      List<PaymentDataDto> dto) {
    final payments = <PaymentDataEntity>[];
    for (PaymentDataDto i in dto) {
      payments.add(_mapPaymentDataDtoToEntity(i));
    }
    return payments;
  }

  List<CreateTransactionDataEntity> mapListCreateTransactionDataDtoToEntity(
      List<CreateTransactionDataDto> dto) {
    final data = <CreateTransactionDataEntity>[];
    for (var i in dto) {
      data.add(_mapCreateTransactionDataDtoToEntity(i));
    }
    return data;
  }

  CreateTransactionDataEntity _mapCreateTransactionDataDtoToEntity(
      CreateTransactionDataDto dto) {
    return CreateTransactionDataEntity(
      transactionId: dto.transactionId ?? "",
      customerId: dto.customerId ?? "",
      sellerId: dto.sellerId ?? "",
      cartId: dto.cartId ?? "",
      amount: dto.amount ?? 0,
      statusTransaction: dto.statusTransaction ?? "",
      paymentTransaction:
          _mapPaymentTransactionDtoToEntity(dto.paymentTransaction),
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  PaymentTransactionEntity _mapPaymentTransactionDtoToEntity(
      PaymentTransactionDto dto) {
    return PaymentTransactionEntity(
      method: dto.method ?? "",
      statusPayment: dto.statusPayment ?? "",
    );
  }

  ExternalDataEntity _mapExternalDataDtoToEntity(ExternalDataDto dto) {
    return ExternalDataEntity(
      data: dto.data ?? "",
      flag: dto.flag ?? "",
    );
  }

  CreatePaymentDataEntity mapCreatePaymentDataDtoToEntity(
      CreatePaymentDataDto dto) {
    return CreatePaymentDataEntity(
      id: dto.id ?? "",
      ownerId: dto.ownerId ?? "",
      amount: dto.amount ?? 0,
      status: dto.status ?? "",
      type: dto.type ?? "",
      method: dto.method ?? "",
      referenceId: dto.referenceId ?? "",
      transactionId: dto.transactionId ?? "",
      externalData: _mapExternalDataDtoToEntity(dto.externalData),
      expirationDate: dto.expirationDate ?? "",
    );
  }

  HistoryEntity mapHistoryEntity(HistoryDataDto dto) {
    return HistoryEntity(
      count: dto.count ?? 0,
      currentPage: dto.currentPage ?? 0,
      countPerPage: dto.countPerPage ?? 0,
      data: _mapListDataHistoryDtoToEntity(dto.data),
    );
  }

  List<DataHistoryEntity> _mapListDataHistoryDtoToEntity(
      List<DataHistoryDto> dto) {
    final data = <DataHistoryEntity>[];
    for (var i in dto) {
      data.add(_mapDataHistoryDtoToEntity(i));
    }
    return data;
  }

  DataHistoryEntity _mapDataHistoryDtoToEntity(DataHistoryDto dto) {
    return DataHistoryEntity(
      id: dto.id ?? "",
      groupId: dto.groupId ?? "",
      customerId: dto.customerId ?? "",
      sellerId: dto.sellerId ?? "",
      cartId: dto.cartId ?? "",
      productData: _mapListProductDataHistoryDtoToEntity(dto.productData),
      amount: dto.amount ?? 0,
      statusTransaction: dto.statusTransaction ?? "",
      paymentTransaction:
          _mapPaymentTransactionHistoryDtoToEntity(dto.paymentTransaction),
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  PaymentTransactionHistoryEntity _mapPaymentTransactionHistoryDtoToEntity(
      PaymentTransactionHistoryDto dto) {
    return PaymentTransactionHistoryEntity(
      method: dto.method ?? "",
      statusPayment: dto.statusPayment ?? "",
    );
  }

  List<ProductDataHistoryEntity> _mapListProductDataHistoryDtoToEntity(
      List<ProductDataHistoryDto> dto) {
    final data = <ProductDataHistoryEntity>[];
    for (var i in dto) {
      data.add(_mapProductDataHistoryDtoToEntity(i));
    }
    return data;
  }

  ProductDataHistoryEntity _mapProductDataHistoryDtoToEntity(
      ProductDataHistoryDto dto) {
    return ProductDataHistoryEntity(
      product: _mapProductHistoryDtoToEntity(dto.product),
      quantity: dto.quantity ?? 0,
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  ProductHistoryEntity _mapProductHistoryDtoToEntity(ProductHistoryDto dto) {
    return ProductHistoryEntity(
      id: dto.id ?? "",
      name: dto.name ?? "",
      owner: dto.owner ?? "",
      stock: dto.stock ?? 0,
      price: dto.price ?? 0,
      category: _mapCategoryHistoryDtoToEntity(dto.category),
      imageUrl: dto.imageUrl ?? "",
      description: dto.description ?? "",
      userInfo: _mapUserInfoHistoryDtoToEntity(dto.userInfo),
      soldCount: dto.soldCount ?? 0,
      popularity: dto.popularity ?? 0.0,
      createdAt: dto.createdAt ?? "",
      updatedAt: dto.updatedAt ?? "",
    );
  }

  CategoryHistoryEntity _mapCategoryHistoryDtoToEntity(CategoryHistoryDto dto) {
    return CategoryHistoryEntity(
      id: dto.id ?? "",
      name: dto.name ?? "",
      imageIcon: dto.imageIcon ?? "",
      imageCover: dto.imageCover ?? "",
    );
  }

  UserInfoHistoryEntity _mapUserInfoHistoryDtoToEntity(UserInfoHistoryDto dto) {
    return UserInfoHistoryEntity(
      id: dto.id ?? "",
      name: dto.name ?? "",
      city: dto.city ?? "",
    );
  }
}
