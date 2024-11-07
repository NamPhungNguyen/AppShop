import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../main.dart';

class UpdateAddress extends ConsumerStatefulWidget {
  static const String routeName = "/update_address";

  const UpdateAddress({super.key, required this.address});

  final ShippingAddress address;

  @override
  ConsumerState<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends ConsumerState<UpdateAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _provinceController;
  late TextEditingController _cityController;
  late TextEditingController _streetController;
  late TextEditingController _additionalAddressController;

  bool isDefault = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address.fullName);
    _phoneController = TextEditingController(text: widget.address.phoneNumber);
    _provinceController = TextEditingController(text: widget.address.province);
    _cityController = TextEditingController(text: widget.address.city);
    _streetController =
        TextEditingController(text: widget.address.addressDetail);
    _additionalAddressController =
        TextEditingController(text: widget.address.additionalAddress ?? '');
    isDefault = widget.address.isDefault;
  }

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

  Future<void> _updateAddress() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(shippingAddressStateProvider.notifier)
          .updateShippingAddress(
            widget.address.addressId.toString(),
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
    }

    Fluttertoast.showToast(
      msg: "Update address successfully!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: const Text('Update Address'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              if (widget.address.isDefault) {
                Fluttertoast.showToast(
                  msg:
                      'You cannot delete the default address. Please set another address as default first.',
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Delete Address"),
                      content: const Text(
                          "Are you sure you want to delete this address?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Proceed with deleting the address
                            await ref
                                .read(shippingAddressStateProvider.notifier)
                                .deleteShippingAddress(
                                    widget.address.addressId.toString());
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                              msg: 'Delete address successfully!',
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                            Navigator.of(context)
                                .pop(); // Pop back after deleting
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          )
        ],
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
                    onPressed: _updateAddress,
                    child: const Text('Update'),
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
