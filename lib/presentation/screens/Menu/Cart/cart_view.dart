import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/presentation/screens/Checkout/checkout_view.dart';
import 'package:front_shop/utils/constants/sizes.dart';

import '../../../../domain/domain_modules.dart';
import '../../../../main.dart';
import '../../../commom/widgets/products/cart/cart_item.dart';
import '../../../commom/widgets/texts/product_price_text.dart';

class CartView extends ConsumerStatefulWidget {
  static const String routeName = "/cart_view";

  const CartView({super.key});

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  List<bool> selectedItems = [];
  bool selectAll = true;

  @override
  void initState() {
    super.initState();
    selectedItems = [];
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: Theme.of(context).textTheme.headlineMedium),
        automaticallyImplyLeading: false,
      ),
      body: cartState.when(
        data: (cartProducts) {
          if (selectedItems.length != cartProducts.result.length) {
            selectedItems =
                List<bool>.filled(cartProducts.result.length, selectAll);
          }

          if (cartProducts.result.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          double totalPrice = 0.0;

          for (int i = 0; i < selectedItems.length; i++) {
            if (selectedItems[i]) {
              double discountedPrice = cartProducts.result[i].price *
                  (1 - cartProducts.result[i].discount / 100);
              totalPrice += discountedPrice * cartProducts.result[i].quantity;
            }
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: selectAll,
                      onChanged: (value) async {
                        setState(() {
                          selectAll = value ?? false;
                          for (int i = 0; i < selectedItems.length; i++) {
                            selectedItems[i] = selectAll;
                          }
                        });
                        final cartUsecase = ref.read(cartUsecaseProvider);
                        await cartUsecase.updateCheckoutStatus(
                          cartProducts.result
                              .map((product) => product.cartItemId)
                              .toList(),
                          selectAll,
                        );
                      },
                    ),
                    const Text("Select All"),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProducts.result.length,
                    itemBuilder: (context, index) {
                      final product = cartProducts.result[index];
                      return Dismissible(
                        key: Key(product.productId.toString()),
                        background: Container(
                          color: Colors.red,
                          alignment: AlignmentDirectional.centerEnd,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) async {
                          try {
                            if (!mounted) return;
                            bool shouldDelete = await showDialog<bool>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm Deletion'),
                                      content: const Text(
                                          'Are you sure you want to remove this item from the cart?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;

                            if (shouldDelete) {
                              await ref
                                  .read(cartStateProvider.notifier)
                                  .deleteProductFromCart(
                                      product.cartItemId.toString());

                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "${product.productName} removed from cart"),
                                ),
                              );
                            }
                          } catch (e) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error removing item: $e"),
                              ),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  selectedItems[index] = !selectedItems[index];
                                });
                                final cartUsecase =
                                    ref.read(cartUsecaseProvider);
                                await cartUsecase.updateCheckoutStatus(
                                  [product.cartItemId],
                                  selectedItems[index],
                                );
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedItems[index]
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    selectedItems[index] ? Icons.check : null,
                                    color: selectedItems[index]
                                        ? Theme.of(context).primaryColor
                                        : Colors.transparent,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TCartItem(
                                imageUrl: product.imageUrl,
                                title: product.productName,
                                color: product.color,
                                size: product.size,
                                quantity: product.quantity,
                                onIncrement: () async {
                                  await ref
                                      .read(cartStateProvider.notifier)
                                      .updateItemQuantity(
                                        product.cartItemId.toString(),
                                        product.quantity + 1,
                                      );
                                },
                                onDecrement: () async {
                                  if (product.quantity > 1) {
                                    await ref
                                        .read(cartStateProvider.notifier)
                                        .updateItemQuantity(
                                          product.cartItemId.toString(),
                                          product.quantity - 1,
                                        );
                                  }
                                },
                                priceDiscount: product.discountPrice.toString(),
                                totalPrice: product.totalPrice.toString(),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// Display total price
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.spaceBtwItems,
                  ),
                  child: ProductPriceText(
                    price: totalPrice.toStringAsFixed(2),
                    isLarge: true,
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, CheckoutView.routeName);
            ref.read(checkoutStateProvider.notifier).fetchProductCheckout();
          },
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
