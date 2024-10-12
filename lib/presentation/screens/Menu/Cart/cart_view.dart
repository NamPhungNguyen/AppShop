import 'package:flutter/material.dart';
import 'package:front_shop/presentation/screens/Notification/notification_view.dart';
import 'package:front_shop/presentation/widgets/Button/button_primary.dart';
import 'package:front_shop/presentation/widgets/common/item_cart_view.dart';
import 'package:front_shop/utils/app_colors.dart';

class CartView extends StatefulWidget {
  static const String cart = "/cart";

  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<Map<String, dynamic>> cartItems = [
    {
      "id": "1",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Bluetooth Headphone",
      "size": "XL",
      "price": 40.50,
      "quantity": 1,
    },
    {
      "id": "2",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Summer Dress",
      "size": "XL",
      "price": 100.99,
      "quantity": 2,
    },
    {
      "id": "3",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Women T-Shirt",
      "size": "XL",
      "price": 30.99,
      "quantity": 1,
    },
    {
      "id": "1",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Bluetooth Headphone",
      "size": "XL",
      "price": 40.50,
      "quantity": 1,
    },
    {
      "id": "2",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Summer Dress",
      "size": "XL",
      "price": 100.99,
      "quantity": 2,
    },
    {
      "id": "3",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Women T-Shirt",
      "size": "XL",
      "price": 30.99,
      "quantity": 1,
    },
    {
      "id": "1",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Bluetooth Headphone",
      "size": "XL",
      "price": 40.50,
      "quantity": 1,
    },
    {
      "id": "2",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Summer Dress",
      "size": "XL",
      "price": 100.99,
      "quantity": 2,
    },
    {
      "id": "3",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Women T-Shirt",
      "size": "XL",
      "price": 30.99,
      "quantity": 1,
    },
    {
      "id": "1",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Bluetooth Headphone",
      "size": "XL",
      "price": 40.50,
      "quantity": 1,
    },
    {
      "id": "2",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Summer Dress",
      "size": "XL",
      "price": 100.99,
      "quantity": 2,
    },
    {
      "id": "3",
      "imageUrl":
      "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp",
      "productName": "Women T-Shirt",
      "size": "XL",
      "price": 30.99,
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item["price"] * item["quantity"]);
    double deliveryFee = 20.0;
    double discount = 10.0;
    double total = subtotal + deliveryFee - discount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
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
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Dismissible(
                    key: Key(item["id"]),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.redAccent,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      return await _showRemoveDialog(context, item["productName"], index);
                    },
                    onDismissed: (direction) {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                    child: CartItem(
                      imageUrl: item["imageUrl"],
                      productName: item["productName"],
                      size: item["size"],
                      price: item["price"],
                      quantity: item["quantity"],
                      onRemove: () {},
                      onIncrease: () {
                        setState(() {
                          cartItems[index]["quantity"]++;
                        });
                      },
                      onDecrease: () {
                        setState(() {
                          if (cartItems[index]["quantity"] > 1) {
                            cartItems[index]["quantity"]--;
                          }
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildSummaryRow("Sub-total", "\$$subtotal"),
                _buildSummaryRow("Delivery Fee", "\$$deliveryFee"),
                _buildSummaryRow("Discount", "-\$$discount"),
                Divider(),
                _buildSummaryRow("Total", "\$$total", isBold: true),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: ButtonPrimary(text: "Go To Checkout", onPressed: (){}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> _showRemoveDialog(BuildContext context, String productName, int index) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Remove from Cart"),
          content: Text("Are you sure you want to remove $productName from the cart?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  cartItems.removeAt(index);
                });
                Navigator.pop(context, true);
              },
              child: Text(
                "Yes, Remove",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
