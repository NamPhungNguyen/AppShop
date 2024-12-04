import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import 'add_coupon_screen.dart';

class ManageCouponScreen extends ConsumerStatefulWidget {
  static const String routeName = '/manage_coupon';

  const ManageCouponScreen({super.key});

  @override
  _ManageCouponScreenState createState() => _ManageCouponScreenState();
}

class _ManageCouponScreenState extends ConsumerState<ManageCouponScreen> {
  @override
  Widget build(BuildContext context) {
    final couponState = ref.watch(couponAdminStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Coupons'),
      ),
      body: couponState.when(
        data: (coupons) {
          return ListView.builder(
            itemCount: coupons.length,
            itemBuilder: (context, index) {
              final coupon = coupons[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: const Icon(Icons.local_offer),
                  title: Text(coupon.code),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiry Date: ${coupon.expiryDate}'),
                      Text(
                          'Discount: \$${coupon.discountAmount.toStringAsFixed(2)}'),
                      Text('Total Quantity: ${coupon.totalQuantity}'),
                    ],
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Pass the coupon data to the AddCouponScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCouponScreen(coupon: coupon),
                            ),
                          );
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          // Hiển thị dialog xác nhận
                          final shouldDelete = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm Deletion'),
                                content: const Text('Are you sure you want to delete this coupon?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );

                          // Nếu người dùng xác nhận, thực hiện xóa
                          if (shouldDelete == true) {
                            try {
                              // Call the deleteCoupon method
                              await ref.read(couponAdminStateProvider.notifier).deleteCoupon(coupon.id.toString());

                              // Show success message if widget is still mounted
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Coupon deleted successfully!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            } catch (e) {
                              // Show error message if widget is still mounted
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error deleting coupon: $e'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCoupon = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCouponScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

