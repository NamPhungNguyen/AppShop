import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends ConsumerStatefulWidget {
  static const String routeName = "/add_new_address";

  const AddNewAddress({super.key});

  @override
  ConsumerState<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends ConsumerState<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _additionalAddressController =
      TextEditingController();
  bool isDefault = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _provinceController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _additionalAddressController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      // Adding a new address
      await ref.read(shippingAddressStateProvider.notifier).addShippingAddress(
            _nameController.text,
            _phoneController.text,
            _streetController.text,
            _provinceController.text,
            _cityController.text,
            additionAddress: _additionalAddressController.text.isNotEmpty
                ? _additionalAddressController.text
                : null,
            isDefault: isDefault,
          );
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: 'Add address successfully!',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Add Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  initialValue: 'Vietnam',
                  enabled: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  controller: _provinceController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.location),
                    labelText: 'Province',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a province';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.building),
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  controller: _streetController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.building_31),
                    labelText: 'Street',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a street address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  controller: _additionalAddressController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.location_tick),
                    labelText: 'Additional Address (optional)',
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Set as Default Address'),
                    Switch(
                      activeColor: AppColors.primaryColor,
                      value: isDefault,
                      onChanged: (value) {
                        setState(() {
                          isDefault = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveAddress,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
