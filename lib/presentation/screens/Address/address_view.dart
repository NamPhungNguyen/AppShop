import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/Address/add_new_address.dart';
import 'package:front_shop/presentation/screens/Address/update_address.dart';
import 'package:front_shop/presentation/screens/Address/widgets/single_address.dart';
import 'package:front_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddressView extends ConsumerStatefulWidget {
  static const String routeName = "/address_view";

  const AddressView({super.key});

  @override
  ConsumerState<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends ConsumerState<AddressView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(shippingAddressStateProvider.notifier).fetchAllShippingAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shippingAddress = ref.watch(shippingAddressStateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewAddress.routeName);
        },
        child: const Icon(Iconsax.add, color: Colors.white),
      ),
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          "Address",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: shippingAddress.when(
        data: (addresses) {
          return ListView.builder(
            padding: const EdgeInsets.all(AppSizes.spaceBtwItems),
            itemCount: addresses.result.length,
            itemBuilder: (context, index) {
              final address = addresses.result[index];
              return TSingleAddress(
                selectedAddress: address.isDefault,
                address: address,
                onSetDefault: () async {
                  await ref
                      .read(shippingAddressStateProvider.notifier)
                      .setDefaultShippingAddress(address.addressId.toString());
                },
                onEdit: () {
                  Navigator.pushNamed(context, UpdateAddress.routeName);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Failed to load addresses: $error'),
        ),
      ),
    );
  }
}
