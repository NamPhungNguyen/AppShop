import 'package:flutter/material.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  static const String routeName = "/add_new_address";

  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
                  const SizedBox(width: AppSizes.spaceBtwInputFields),
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
                  const SizedBox(width: AppSizes.spaceBtwInputFields),
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Save')))
            ],
          )),
        ),
      ),
    );
  }
}
