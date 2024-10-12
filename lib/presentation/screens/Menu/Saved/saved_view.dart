import 'package:flutter/material.dart';
import '../../../widgets/common/product_item.dart';
import '../../Notification/notification_view.dart';

class SavedView extends StatelessWidget {
  static const String saved_view = '/saved_view';

  // List of saved items (mock data)
  final List<Map<String, dynamic>> savedItems = [
    {
      'imageUrl': 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp',
      'name': 'Bàn phím cơ',
      'price': '12.14',
      'discount': '15.99', // Original price for discount
      'isSaved': true, // Whether item is saved
    },
    {
      'imageUrl': 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvl9lctiz9u9dc_tn.webp',
      'name': 'Chuột gaming',
      'price': '18.00',
      'discount': '22.00',
      'isSaved': false, // This one is unsaved
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter the list to only include saved items
    final List<Map<String, dynamic>> filteredItems =
    savedItems.where((item) => item['isSaved'] == true).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Saved Items',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.notification);
            },
            icon: const Icon(
              Icons.notifications_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: filteredItems.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 100,
              color: Colors.grey[300],
            ),
            SizedBox(height: 16),
            Text(
              'No Saved Items!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You don\'t have any saved items.\nGo to home and add some.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            final item = filteredItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProductItem(
                imageUrl: item['imageUrl'],
                name: item['name'],
                price: '\$${item['price']}', // Format price with $
                discount: '\$${item['discount']}',
                isSaved: item['isSaved'],
                index: index,
                onPress: () {
                  // Handle unsave action here
                  print('Unsave item: ${item['name']}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
