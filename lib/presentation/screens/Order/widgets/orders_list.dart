import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:front_shop/domain/models/order.dart';

class TOrderListItems extends StatelessWidget {
  final List<Order> orders;
  final Function(String orderId) onCancelOrder; // Callback to handle order cancellation

  const TOrderListItems({
    super.key,
    required this.orders,
    required this.onCancelOrder, // Pass the cancel order logic from parent
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      // If no orders are present, display a message
      return Center(
        child: Text(
          'No orders available',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: orders.length,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.spaceBtwItems),
      itemBuilder: (_, orderIndex) {
        final order = orders[orderIndex];

        return TRoundedContainer(
          showBorder: true,
          padding: EdgeInsets.all(AppSizes.md),
          backgroundColor: AppColors.light,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Details Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order #${order.orderId}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  _buildOrderStatusBadge(context, order.status),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Text(
                'Total: \$${order.totalAmount.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: AppColors.primaryColor),
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),

              // List of Products
              Column(
                children: order.products.map((product) {
                  return _buildProductItem(context, product);
                }).toList(),
              ),

              // Cancel Order Button (conditionally displayed)
              if (order.status.toLowerCase() != 'completed' &&
                  order.status.toLowerCase() != 'shipped' &&
                  order.status.toLowerCase() != 'cancelled') ...[
                const SizedBox(height: AppSizes.spaceBtwItems),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () => _showCancelConfirmationDialog(context, order.orderId.toString()),
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.cancel, size: 16),
                    ),
                    label: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text('Cancel Order'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrderStatusBadge(BuildContext context, String status) {
    Color backgroundColor;
    switch (status.toLowerCase()) {
      case 'pending':
        backgroundColor = Colors.orange;
        break;
      case 'processing':
        backgroundColor = Colors.yellow.shade600;
        break;
      case 'completed':
        backgroundColor = Colors.green;
        break;
      case 'shipped':
        backgroundColor = Colors.blue;
        break;
      case 'cancelled':
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, ProductOrder product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems / 2),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  product.productName,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems / 4),

                // Product Price and Quantity
                Text(
                  '\$${product.totalPrice.toStringAsFixed(2)} (x${product.quantity})',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems / 4),

                // Product Color and Size
                Row(
                  children: [
                    Text(
                      'Color: ${product.color}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Size: ${product.size}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context, String orderId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Order'),
          content: const Text('Are you sure you want to cancel this order?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onCancelOrder(orderId); // Trigger cancellation logic
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
