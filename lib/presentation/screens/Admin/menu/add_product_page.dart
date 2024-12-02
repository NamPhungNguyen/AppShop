import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';

class AddProductPage extends ConsumerStatefulWidget {
  static const String routeName = '/add_product';

  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController customColorController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFiles = [];

  List<String> selectedSizes = [];
  List<String> customColors = [];

  String? selectedCategory;

  // Firebase Storage instance
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Method to pick multiple images
  Future<void> _pickImages() async {
    try {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        setState(() {
          _imageFiles = pickedFiles;
        });
        print("Đã chọn ${_imageFiles.length} ảnh");
      } else {
        print("Không có ảnh nào được chọn.");
      }
    } catch (e) {
      print("Lỗi khi chọn ảnh: $e");
    }
  }

  // Method to upload images to Firebase Storage
  Future<List<String>> _uploadImages() async {
    List<String> imageUrls = [];
    try {
      for (var imageFile in _imageFiles) {
        String fileName = imageFile.name;
        Reference storageRef = _storage.ref().child('product_images/$fileName');
        await storageRef.putFile(File(imageFile.path)); // Upload image

        String downloadUrl = await storageRef.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
    } catch (e) {
      print("Error uploading images: $e");
    }
    return imageUrls;
  }

  void _submitForm() {
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        stockController.text.isEmpty ||
        brandController.text.isEmpty ||
        discountController.text.isEmpty ||
        _imageFiles.isEmpty ||
        selectedSizes.isEmpty ||
        customColors.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Please fill in all the fields and upload at least one image."),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please select a category."),
        backgroundColor: Colors.red,
      ));
      return;
    }
    _uploadImages().then((imageUrls) {
      ref.read(productStateProvider.notifier).createProduct(
            name: nameController.text,
            description: descriptionController.text,
            price: double.parse(priceController.text),
            stock: int.parse(stockController.text),
            size: selectedSizes,
            color: customColors,
            brand: brandController.text,
            imgProduct: imageUrls,
            categoryId: int.parse(selectedCategory!),
            discount: int.parse(discountController.text),
          );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Product added successfully!"),
        backgroundColor: Colors.green,
      ));

      // Reset form after submission
      nameController.clear();
      descriptionController.clear();
      priceController.clear();
      stockController.clear();
      brandController.clear();
      discountController.clear();
      customColorController.clear();
      setState(() {
        _imageFiles.clear();
        selectedSizes.clear();
        customColors.clear();
      });
    }).catchError((e) {
      // Handle image upload error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Image upload failed: $e"),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Product',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // Set the back icon color to white
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  _buildTextField(nameController, 'Product Name'),

                  const SizedBox(height: 10),

                  // Product Description
                  _buildTextField(descriptionController, 'Product Description'),

                  const SizedBox(height: 10),

                  // Product Price
                  _buildTextField(priceController, 'Product Price',
                      keyboardType: TextInputType.number),

                  const SizedBox(height: 10),

                  // Product Stock
                  _buildTextField(stockController, 'Stock Quantity',
                      keyboardType: TextInputType.number),

                  const SizedBox(height: 10),

                  // Product Brand
                  _buildTextField(brandController, 'Brand'),

                  const SizedBox(height: 10),

                  // Discount
                  _buildTextField(discountController, 'Discount Percentage',
                      keyboardType: TextInputType.number),

                  const SizedBox(height: 10),
                  _buildCategoryDropdown(),
                  const SizedBox(height: 20),

                  const SizedBox(height: 20),

                  // Multi-select Size
                  _buildMultiSelectField('Size', ['S', 'M', 'L', 'XL', 'XXL'],
                      (value) {
                    setState(() {
                      if (selectedSizes.contains(value)) {
                        selectedSizes.remove(value);
                      } else {
                        selectedSizes.add(value);
                      }
                    });
                  }),

                  const SizedBox(height: 10),

                  // Custom Color Input (User can input multiple colors separated by commas)
                  _buildTextField(customColorController,
                      'Custom Color(s) (separate by commas)',
                      hintText: 'Enter color names or hex codes',
                      onChanged: (text) {
                    setState(() {
                      customColors =
                          text.split(',').map((color) => color.trim()).toList();
                    });
                  }),
                  const SizedBox(height: 20),

                  /// Image Picker with Preview
                  GestureDetector(
                    onTap: _pickImages,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo,
                              color: AppColors.primaryColor),
                          SizedBox(width: 10),
                          Text(
                            'Pick Product Images',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_imageFiles.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _imageFiles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.file(
                              File(_imageFiles[index].path),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 20),

                  /// Submit Button
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child:
                            Text('Add Product', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method for creating text fields
  Widget _buildTextField(TextEditingController controller, String label,
      {String hintText = '',
      TextInputType keyboardType = TextInputType.text,
      Function(String)? onChanged}) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildMultiSelectField(
      String label, List<String> options, Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Wrap(
          children: options
              .map((option) => Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                    child: ChoiceChip(
                      label: Text(option),
                      selected: selectedSizes.contains(option),
                      onSelected: (selected) {
                        onSelect(option);
                      },
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    final categoryState = ref.watch(categoryStateProvider);
    return categoryState.when(
      data: (categories) {
        return DropdownButtonFormField<String>(
          value: selectedCategory,
          decoration: InputDecoration(
            labelText: 'Category',
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          items: categories.result
              .map((category) => DropdownMenuItem<String>(
                    value: category.categoryId.toString(),
                    child: Text(category.name),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value;
            });
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
