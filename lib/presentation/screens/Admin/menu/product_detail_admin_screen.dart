import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../domain/models/product.dart';
import '../../../../main.dart';

class ProductDetailAdminPage extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailAdminPage({super.key, required this.product});

  static const String routeName = '/product-detail';

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailAdminPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  late TextEditingController _discountController;
  late TextEditingController _brandController;
  late bool _isAvailable;
  late int _selectedCategory = 0;
  late List<String> _selectedImages;
  late List<String> _selectedSizes;
  late List<String> _selectedColors;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController =
        TextEditingController(text: widget.product.description);
    _priceController =
        TextEditingController(text: widget.product.price.toString());
    _stockController =
        TextEditingController(text: widget.product.stock.toString());
    _discountController =
        TextEditingController(text: widget.product.discount?.toString() ?? "");
    _brandController = TextEditingController(text: widget.product.brand ?? "");
    _isAvailable = widget.product.available;
    _selectedCategory = widget.product.categoryId;
    _selectedImages = List.from(widget.product.imgProduct);
    _selectedSizes = List.from(widget.product.size);
    _selectedColors = List.from(widget.product.color);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _discountController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  Future<void> _addImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        _isUploading = true;
      });

      try {
        for (final pickedFile in pickedFiles) {
          final storageRef = FirebaseStorage.instance.ref().child(
              'product_images/${DateTime.now().millisecondsSinceEpoch}_${pickedFile.name}');

          // Bắt đầu upload ảnh
          final uploadTask = storageRef.putFile(File(pickedFile.path));

          // Chờ upload hoàn thành và lấy URL
          final snapshot = await uploadTask;
          final downloadUrl = await snapshot.ref.getDownloadURL();

          setState(() {
            _selectedImages.add(downloadUrl);
          });
        }

        setState(() {
          _isUploading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Images uploaded successfully')),
        );
      } catch (e) {
        setState(() {
          _isUploading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading images: $e')),
        );
      }
    }
  }

  Future<void> _updateProduct() async {
    try {
      final notifier = ref.read(productStateProvider.notifier);
      await notifier.updateProduct(
        widget.product.productId.toString(),
        _nameController.text,
        _descriptionController.text,
        double.tryParse(_priceController.text),
        int.tryParse(_stockController.text),
        _selectedSizes,
        _selectedColors,
        _brandController.text,
        _selectedImages,
        _selectedCategory,
        double.tryParse(_discountController.text),
        _isAvailable,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product updated successfully')),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildTextField(_nameController, "Product Name", false),
            _buildTextField(_descriptionController, "Description", true),
            _buildTextField(
                _priceController, "Price", false, TextInputType.number),
            _buildTextField(
                _stockController, "Stock", false, TextInputType.number),
            _buildTextField(
                _discountController, "Discount", false, TextInputType.number),
            _buildTextField(_brandController, "Brand", false),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Is Available",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: _isAvailable,
                    onChanged: (value) {
                      setState(() {
                        _isAvailable = value;
                      });
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),

            _buildCategoryDropdown(),

            /// Image management
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Images",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 10,
                    children: _selectedImages.map((image) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: IconButton(
                              icon: const Icon(Icons.remove_circle,
                                  color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _selectedImages.remove(image);
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: _addImages,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Add Image"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Size Selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: _buildSizeSelection(),
            ),

            /// Color Selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: _buildColorSelection(),
            ),

            /// btn update
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProduct,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              child:
                  const Text("Update Product", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, bool isMultiline,
      [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: isMultiline ? 3 : 1,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Consumer(
        builder: (context, ref, child) {
          final categoryState = ref.watch(categoryStateProvider);
          return categoryState.when(
            data: (categories) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                ),
                child: DropdownButton<int>(
                  value: _selectedCategory,
                  onChanged: (int? newCategory) {
                    if (newCategory != null) {
                      setState(() {
                        _selectedCategory = newCategory;
                      });
                    }
                  },
                  isExpanded: true,
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  items: categories.result.map((category) {
                    return DropdownMenuItem<int>(
                      value: category.categoryId,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            category.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, stack) => Text('Error: $e'),
          );
        },
      ),
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sizes",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 10,
          children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: _selectedSizes.contains(size),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedSizes.add(size);
                  } else {
                    _selectedSizes.remove(size);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorSelection() {
    final TextEditingController colorController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Colors",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 10,
          children: _selectedColors.map((color) {
            return Chip(
              label: Text(color),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () {
                setState(() {
                  _selectedColors.remove(color);
                });
              },
            );
          }).toList(),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: colorController,
                decoration: const InputDecoration(
                  labelText: "Add New Color",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                final color = colorController.text.trim();
                if (color.isNotEmpty && !_selectedColors.contains(color)) {
                  setState(() {
                    _selectedColors.add(color);
                  });
                  colorController.clear();
                }
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ],
    );
  }
}
