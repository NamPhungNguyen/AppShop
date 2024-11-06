import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/main.dart';
import 'package:front_shop/presentation/commom/widgets/Appbar/appbar.dart';
import 'package:front_shop/presentation/screens/Address/add_new_address.dart';
import 'package:front_shop/presentation/screens/Address/widgets/single_address.dart';
import 'package:iconsax/iconsax.dart';

class AddressView extends ConsumerWidget {
  static const String routeName = "/address_view";

  const AddressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingAddress = ref.watch(shippingAddressStateProvider);
    ref.read(shippingAddressStateProvider.notifier).fetchAllShippingAdress();
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
            itemCount: addresses.result.length,
            itemBuilder: (context, index) {
              final address = addresses.result[index];
              return TSingleAddress(
                selectedAddress: address.isDefault,
                // You can handle the selected logic differently
                address: address,
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
