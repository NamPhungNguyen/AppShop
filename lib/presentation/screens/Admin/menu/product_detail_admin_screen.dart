import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import '../../../../domain/models/product.dart';
import '../../../../main.dart';

class ProductDetailAdminPage extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailAdminPage({Key? key, required this.product}) : super(key: key);

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
  late bool _isAvailable;
  late String _selectedCategory;
  late List<String> _selectedImages;
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(text: widget.product.price.toString());
    _stockController = TextEditingController(text: widget.product.stock.toString());
    _discountController = TextEditingController(text: widget.product.discount?.toString() ?? "");
    _isAvailable = widget.product.available;
    _selectedCategory = widget.product.categoryName;
    _selectedImages = List.from(widget.product.imgProduct);  // Handle images
    _selectedSize = widget.product.size.isNotEmpty ? widget.product.size[0] : "M";  // Default to first size if available
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _discountController.dispose();
    super.dispose();
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
            // Product Name
            _buildTextField(_nameController, "Product Name", false),

            // Product Description
            _buildTextField(_descriptionController, "Description", true),

            // Product Price
            _buildTextField(_priceController, "Price", false, TextInputType.number),

            // Product Stock
            _buildTextField(_stockController, "Stock", false, TextInputType.number),

            // Discount (optional)
            _buildTextField(_discountController, "Discount", false, TextInputType.number),

            // Availability Switch
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Is Available", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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

            // Category Dropdown
            _buildCategoryDropdown(),

            // Size Selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: DropdownButton<String>(
                value: _selectedSize,
                onChanged: (String? newSize) {
                  setState(() {
                    _selectedSize = newSize ?? _selectedSize;
                  });
                },
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 30,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                items: widget.product.size.map((size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(size, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Image Selection (Multiple Images)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Product Images", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  for (var image in _selectedImages)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.network(image),
                    ),
                  // Add UI for adding/removing images if needed
                ],
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              child: const Text("Update Product", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to create TextField widgets
  Widget _buildTextField(TextEditingController controller, String label, bool isMultiline, [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: isMultiline ? 3 : 1,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  // Function to handle category dropdown
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
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  onChanged: (String? newCategory) {
                    setState(() {
                      _selectedCategory = newCategory ?? _selectedCategory;
                    });
                  },
                  isExpanded: true,
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  items: categories.result.map((category) {
                    return DropdownMenuItem<String>(
                      value: category.name,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          category.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
}

