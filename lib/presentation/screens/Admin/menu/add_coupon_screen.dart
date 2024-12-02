import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/coupon.dart';
import '../../../../main.dart';

class AddCouponScreen extends ConsumerStatefulWidget {
  static const String routeName = '/add_coupon';
  final Coupon? coupon;

  const AddCouponScreen({Key? key, this.coupon}) : super(key: key);

  @override
  _AddCouponScreenState createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends ConsumerState<AddCouponScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _poolCodeController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _discountAmountController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  bool _active = true;
  int _totalQuantity = 0;

  @override
  void initState() {
    super.initState();
    if (widget.coupon != null) {
      _poolCodeController.text = widget.coupon!.poolCode;
      _codeController.text = widget.coupon!.code;
      _discountAmountController.text = widget.coupon!.discountAmount.toString();
      _expiryDateController.text = widget.coupon!.expiryDate;
      _active = widget.coupon!.active;
      _totalQuantity = widget.coupon!.totalQuantity;
    }
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _expiryDateController.text =
            DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(pickedDate);
      });
    }
  }

  void _saveCoupon() async {
    if (_formKey.currentState?.validate() ?? false) {
      final poolCode = _poolCodeController.text;
      final code = _codeController.text;
      final discountAmount = double.parse(_discountAmountController.text);
      final expiryDate = _expiryDateController.text;
      final active = _active;
      final totalQuantity = _totalQuantity;

      try {
        print(
            'Coupon Data: $poolCode, $code, $discountAmount, $expiryDate, $active, $totalQuantity');
        if (widget.coupon != null) {
          print('Updating coupon...');
          await ref.read(couponStateProvider.notifier).updateCoupon(
              widget.coupon!.id.toString(),
              poolCode,
              code,
              discountAmount,
              expiryDate,
              active,
              totalQuantity);
        } else {
          print('Creating new coupon...');
          await ref.read(couponStateProvider.notifier).createCoupon(poolCode,
              code, discountAmount, expiryDate, active, totalQuantity);
          Navigator.pop(context);
        }
      } catch (e) {
        print('Error occurred: $e');
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: Text(
                'An error occurred while creating or updating the coupon: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coupon == null ? 'Add Coupon' : 'Edit Coupon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _poolCodeController,
                decoration: const InputDecoration(labelText: 'Pool Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a pool code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: 'Coupon Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a coupon code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _discountAmountController,
                decoration: const InputDecoration(labelText: 'Discount Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a discount amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _expiryDateController,
                decoration: const InputDecoration(labelText: 'Expiry Date'),
                readOnly: true,
                onTap: () => _selectExpiryDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an expiry date';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text('Active'),
                value: _active,
                onChanged: (value) {
                  setState(() {
                    _active = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Total Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _totalQuantity = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCoupon,
                child: const Text('Save Coupon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
