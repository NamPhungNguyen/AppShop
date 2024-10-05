import 'package:flutter/material.dart';
import 'package:front_shop/presentation/widgets/Search/input_search_primary.dart';
import 'package:front_shop/utils/app_colors.dart';
import 'package:front_shop/utils/typography.dart';

class EnterYourLocationView extends StatefulWidget {
  static const String enter_your_location = "/enter_your_location";

  const EnterYourLocationView({super.key});

  @override
  State<EnterYourLocationView> createState() => _EnterYourLocationViewState();
}

class _EnterYourLocationViewState extends State<EnterYourLocationView> {
  final locationController = TextEditingController();
  List<String> allLocations = [
    'Dhanmondi, Dhaka',
    'Gulshan, Dhaka',
    'Banani, Dhaka',
    'Uttara, Dhaka',
  ];
  List<String> filteredLocations = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationController.addListener(() {
      setState(() {
        filteredLocations = allLocations
            .where((location) => location
                .toLowerCase()
                .contains(locationController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Enter Your Location",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SearchInputPrimary(controller: locationController),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.near_me,
                      color: AppColors.primaryTextAndButton,
                      size: 38,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "User my current location",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 20),
              if (filteredLocations.isNotEmpty) ...[
                Divider(),
                Text(
                  "Search Result",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredLocations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.near_me,
                          color: AppColors.primaryTextAndButton,
                        ),
                        title: Text(filteredLocations[index]),
                        subtitle: Text("34/5 Golden House"),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}