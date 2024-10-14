import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/typography.dart';

import '../../commom/Button/button_primary.dart';
import '../Notification/notification_view.dart';

class CheckoutView extends StatelessWidget {
  static const String check_out_view = "/check_out";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.notification);
            },
            icon: const Icon(
              Icons.notifications_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 1,
              color: Colors.grey[200],
            ),
            const SizedBox(
              height: 16,
            ),
            _buildSectionTitle("Delivery Address", true),
            const SizedBox(
              height: 16,
            ),
            _buildDeliveryAddressSection(),
            const SizedBox(height: 16),
            Divider(
              height: 1,
              color: Colors.grey[200],
            ),
            const SizedBox(
              height: 16,
            ),
            _buildSectionTitle("Payment Method", false),
            const SizedBox(
              height: 16,
            ),
            _buildPaymentMethodSection(),
            const SizedBox(height: 16),
            _buildOrderSummarySection(),
            const SizedBox(height: 16),
            _buildPromoCodeSection(),
            const Spacer(),
            ButtonPrimary(text: "Place Order", onPressed: (){}),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isCheck) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        isCheck
            ? GestureDetector(
                onTap: () {
                  // Change address action
                },
                child: const Text(
                  "Change",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildDeliveryAddressSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
              size: 28,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "925 S Chugach St #Apt 10, Alaska 99645",
                  style: TypographyClass.Regular.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildPaymentMethodButton("Card", Icons.credit_card_outlined, true),
            _buildPaymentMethodButton("Cash", Icons.money_outlined, false),
            _buildPaymentMethodButton("Apple Pay", Icons.apple_outlined, false),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            border: Border.all(
              color: Colors.grey[300]!, // Border color
              width: 1.0, // Border width
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.credit_card, color: Colors.black),
            title: const Text("VISA **** **** **** 2512"),
            trailing: const Icon(Icons.edit, color: Colors.grey),
            onTap: () {
              // Edit card action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodButton(
      String label, IconData icon, bool isSelected) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.white : Colors.black,
            backgroundColor: isSelected ? AppColors.primaryColor : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          onPressed: () {
            // Select payment method
          },
          child: Icon(icon),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildOrderSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSummaryRow("Sub-total", "\$170.75"),
        _buildSummaryRow("Delivery Fee", "\$20.00"),
        _buildSummaryRow("Discount", "\$10"),
        const Divider(),
        _buildSummaryRow("Total", "\$180.99", isBold: true),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeSection() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter promo code",
              prefixIcon: const Icon(Icons.local_offer_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Apply promo code action
          },
          child: const Text("Add", style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
