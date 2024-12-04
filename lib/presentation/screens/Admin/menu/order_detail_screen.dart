import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/order_pages.dart';
import '../../../../main.dart';

final selectedStatusProvider = StateProvider<String>((ref) {
  return '';
});

class OrderDetailScreen extends ConsumerWidget {
  static const String routeName = '/order_detail';

  final OrderContent orderContent;

  const OrderDetailScreen({required this.orderContent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> statuses = [
      'pending',
      'processing',
      'shipped',
      'completed',
      'cancelled'
    ];

    String selectedStatus = ref.watch(selectedStatusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Info
            _buildOrderInfoSection(orderContent),

            const SizedBox(height: 16),

            // Shipping Address
            _buildShippingAddressSection(orderContent.shippingAddress),

            const SizedBox(height: 16),

            // Product List
            Expanded(
              child: _buildProductList(orderContent.products),
            ),
            const SizedBox(height: 16),

            // Update Status Section
            _buildUpdateStatusSection(
              context,
              selectedStatus,
              statuses,
              ref,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingAddressSection(ShippingPageAddress address) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shipping Address:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Full Name: ${address.fullName}'),
              Text('Phone: ${address.phoneNumber}'),
              Text('Address: ${address.addressDetail}'),
              if (address.additionalAddress != null)
                Text('Additional Info: ${address.additionalAddress!}'),
              Text('City: ${address.city}'),
              Text('Province: ${address.province}'),
              Text('Country: ${address.country}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderInfoSection(OrderContent order) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: #${order.orderId}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Created At: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(order.createdAt))}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Divider(height: 20, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${order.totalAmount} đ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(List<ProductPageOrder> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product.productName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quantity: ${product.quantity}'),
                Text('Size: ${product.size}'),
                Text('Color: ${product.color}'),
                Text('Price: ${product.price} đ'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUpdateStatusSection(
    BuildContext context,
    String selectedStatus,
    List<String> statuses,
    WidgetRef ref,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Update Status:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedStatus.isEmpty ? orderContent.status : selectedStatus,
          items: statuses.map((status) {
            return DropdownMenuItem(
              value: status,
              child: Text(status[0].toUpperCase() + status.substring(1)),
            );
          }).toList(),
          onChanged: (newStatus) {
            if (newStatus != null) {
              ref.read(selectedStatusProvider.notifier).state = newStatus;
            }
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (selectedStatus != orderContent.status) {
                _updateOrderStatus(context, selectedStatus, ref);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No changes to update')),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Update Status'),
            ),
          ),
        ),
      ],
    );
  }

  void _updateOrderStatus(
      BuildContext context, String newStatus, WidgetRef ref) {
    final statusToUpdate = newStatus.toLowerCase();

    ref.read(orderPagesStateProvider.notifier).updateStatusOrder(
          orderContent.orderId.toString(),
          statusToUpdate,
        );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order updated to $statusToUpdate')),
    );
  }
}
