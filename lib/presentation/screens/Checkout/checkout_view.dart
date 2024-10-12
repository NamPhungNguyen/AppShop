import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/Button/button_primary.dart';
import 'package:front_shop/utils/app_colors.dart';
import 'package:front_shop/utils/typography.dart';

import '../Notification/notification_view.dart';

class CheckoutView extends StatelessWidget {
  static const String check_out_view = "/check_out";

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
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
            icon: Icon(
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
            SizedBox(
              height: 16,
            ),
            _buildSectionTitle("Delivery Address", true),
            SizedBox(
              height: 16,
            ),
            _buildDeliveryAddressSection(),
            SizedBox(height: 16),
            Divider(
              height: 1,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 16,
            ),
            _buildSectionTitle("Payment Method", false),
            SizedBox(
              height: 16,
            ),
            _buildPaymentMethodSection(),
            SizedBox(height: 16),
            _buildOrderSummarySection(),
            SizedBox(height: 16),
            _buildPromoCodeSection(),
            Spacer(),
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        isCheck
            ? GestureDetector(
                onTap: () {
                  // Change address action
                },
                child: Text(
                  "Change",
                  style: TextStyle(
                    color: AppColors.primaryTextAndButton,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryTextAndButton,
                  ),
                ),
              )
            : SizedBox(),
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
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
              size: 28,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 8),
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
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            border: Border.all(
              color: Colors.grey[300]!, // Border color
              width: 1.0, // Border width
            ),
          ),
          child: ListTile(
            leading: Icon(Icons.credit_card, color: Colors.black),
            title: Text("VISA **** **** **** 2512"),
            trailing: Icon(Icons.edit, color: Colors.grey),
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
            backgroundColor: isSelected ? AppColors.primaryTextAndButton : Colors.grey[200],
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
        SizedBox(height: 4),
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
        Divider(),
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
              prefixIcon: Icon(Icons.local_offer_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryTextAndButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Apply promo code action
          },
          child: Text("Add", style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
