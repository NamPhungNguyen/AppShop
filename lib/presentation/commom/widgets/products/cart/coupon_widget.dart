import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../../main.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

final selectedCouponCodeProvider = StateProvider<String?>((ref) => null);

class TCouponCode extends ConsumerWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final couponState = ref.watch(couponStateProvider);
    final selectedCouponCode =
        ref.watch(selectedCouponCodeProvider); // Watch the coupon code state

    void _showCouponModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        isScrollControlled: true,
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            builder: (_, controller) {
              return couponState.when(
                data: (coupons) {
                  return ListView.builder(
                    controller: controller,
                    itemCount: coupons.length,
                    itemBuilder: (context, index) {
                      final coupon = coupons[index];
                      return ListTile(
                        leading: Icon(
                          coupon.active
                              ? Icons.local_offer
                              : Icons.remove_circle_outline,
                          color: coupon.active ? Colors.green : Colors.red,
                        ),
                        title: Text(
                          coupon.code,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Discount: ${coupon.discountAmount}đ'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            // Update the selected coupon code in state
                            ref
                                .read(selectedCouponCodeProvider.notifier)
                                .state = coupon.code;
                            print('Applying coupon: ${coupon.code}');
                            Navigator.pop(context);
                            ref
                                .read(couponStateProvider.notifier)
                                .applyCoupon(coupon.code);
                          },
                          child: const Text('Apply'),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) {
                  return Center(
                    child: Text('Error: ${error.toString()}'),
                  );
                },
              );
            },
          );
        },
      );
    }

    return TRoundedContainer(
      showBorder: false,
      backgroundColor: Colors.white,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: selectedCouponCode ?? 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {
                _showCouponModal(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Choose'),
            ),
          )
        ],
      ),
    );
  }
}
