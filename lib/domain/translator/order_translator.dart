import 'package:front_shop/domain/models/order.dart';
import 'package:front_shop/server/data/entities/order_entity.dart';

import '../../server/data/entities/order_pages_entity.dart';
import '../../server/data/entities/product_page_entity.dart';
import '../models/order_pages.dart';

class OrderTranslator {
  static List<Order> translate(List<OrderEntity> entities) {
    return entities
        .map((entity) => Order(
              orderId: entity.orderId,
              totalAmount: entity.totalAmount,
              status: entity.status,
              products: entity.products
                  .map((productEntity) => translatorProductOrder(productEntity))
                  .toList(),
              addressId: entity.addressId,
              shippingAddress: translateAddress(entity.shippingAddress),
            ))
        .toList();
  }

  static ProductOrder translatorProductOrder(ProductOrderEntity entity) {
    return ProductOrder(
      productId: entity.productId,
      productName: entity.productName,
      imageUrl: entity.imageUrl,
      price: entity.price,
      size: entity.size,
      color: entity.color,
      quantity: entity.quantity,
      discount: entity.discount,
      totalPrice: entity.totalPrice,
      discountPrice: entity.discountPrice,
    );
  }

  static Address translateAddress(AddressEntity entity) {
    return Address(
      addressId: entity.addressId,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      addressDetail: entity.addressDetail,
      additionalAddress: entity.additionalAddress,
      province: entity.province,
      city: entity.city,
      country: entity.country,
      isDefault: entity.isDefault,
    );
  }

  static OrderPages translateOrderPages(OrderPagesEntity entity) {
    return OrderPages(
      content: entity.content.map(translateOrderContent).toList(),
      pageable: translatePageable(entity.pageable),
      last: entity.last,
      totalElements: entity.totalElements,
      totalPages: entity.totalPages,
      size: entity.size,
      number: entity.number,
      sort: translateSort(entity.sort),
    );
  }

  static PageableEntity translatePageable(PageableEntity entity) {
    return PageableEntity(
      pageNumber: entity.pageNumber,
      pageSize: entity.pageSize,
      sort: translateSort(entity.sort),
      offset: entity.offset,
      paged: entity.paged,
      unpaged: entity.unpaged,
    );
  }

  static SortEntity translateSort(SortEntity entity) {
    return SortEntity(
      empty: entity.empty,
      sorted: entity.sorted,
      unsorted: entity.unsorted,
    );
  }

  static OrderContent translateOrderContent(OrderContentEntity entity) {
    return OrderContent(
      orderId: entity.orderId,
      totalAmount: entity.totalAmount,
      status: entity.status,
      products: entity.products.map(translateProductPageOrder).toList(),
      addressId: entity.addressId,
      shippingAddress: translateShippingPageAddress(entity.shippingAddress),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  static ProductPageOrder translateProductPageOrder(
      ProductPageOrderEntity entity) {
    return ProductPageOrder(
      cartItemId: entity.cartItemId,
      productId: entity.productId,
      productName: entity.productName,
      imageUrl: entity.imageUrl,
      price: entity.price,
      size: entity.size,
      color: entity.color,
      quantity: entity.quantity,
      discount: entity.discount,
      totalPrice: entity.totalPrice,
      discountPrice: entity.discountPrice,
    );
  }

  static ShippingPageAddress translateShippingPageAddress(
      ShippingPageAddressEntity entity) {
    return ShippingPageAddress(
      addressId: entity.addressId,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      addressDetail: entity.addressDetail,
      province: entity.province,
      city: entity.city,
      country: entity.country,
      isDefault: entity.isDefault,
    );
  }
}
