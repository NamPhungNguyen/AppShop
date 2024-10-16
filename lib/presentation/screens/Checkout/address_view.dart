import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/typography.dart';
import '../../commom/widgets/Button/button_primary.dart';
import '../Notification/notification_view.dart';

class AddressView extends StatefulWidget {
  static const String routeName = "/address";

  const AddressView({super.key});

  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  int _selectedAddressIndex = 0;

  final List<Map<String, String>> _addresses = [
    {
      'label': 'Home',
      'address': '925 S Chugach St #Apt 10',
      'default': 'true',
    },
    {
      'label': 'Office',
      'address': '2438 6th Ave, Ketchikan, AL',
      'default': 'false'
    },
    {
      'label': 'Apartment',
      'address': '2551 Vista Dr #B301, Juneau, AK',
      'default': 'false'
    },
    {
      'label': 'Parent’s House',
      'address': '4821 Ridge Top Cir, Anchorage, AK',
      'default': 'false'
    },
  ];

  void _onAddressSelected(int index) {
    setState(() {
      _selectedAddressIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Address',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.routeName);
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
            Divider(height: 1, color: Colors.grey[200]),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 16),
              child: Text("Saved Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  final bool isDefault = address['default'] == 'true';
                  return InkWell(
                    onTap: () {
                      _onAddressSelected(index);
                    },
                    borderRadius: BorderRadius.circular(8),
                    // Ensures ripple stays within rounded border
                    splashColor:
                        AppColors.primaryColor.withOpacity(0.2),
                    // Ripple color
                    highlightColor: Colors.grey[200],
                    // Color when pressed
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_on_outlined,
                          size: 28,
                        ),
                        title: Row(
                          children: [
                            Text(
                              address['label']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(width: 8),
                            if (isDefault)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'DEFAULT',
                                  style: TypographyClass.Regular.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                          ],
                        ),
                        subtitle: Text(
                          address['address']!,
                          style: TypographyClass.Regular.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Radio(
                          value: index,
                          groupValue: _selectedAddressIndex,
                          onChanged: (int? value) {
                            _onAddressSelected(value!);
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add new address action
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Add New Address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ButtonPrimary(text: "Apply", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
