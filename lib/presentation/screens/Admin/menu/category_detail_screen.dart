import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/category.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  final Category category;

  static const String routeName = '/category_detail';

  const CategoryDetailScreen({super.key, required this.category});

  @override
  ConsumerState<CategoryDetailScreen> createState() =>
      _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  File? _selectedImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
    _descriptionController =
        TextEditingController(text: widget.category.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadImageToFirebase(File image) async {
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = 'categories/${DateTime.now().millisecondsSinceEpoch}.png';
    final uploadTask = storageRef.child(fileName).putFile(image);

    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> _updateCategory() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final name = _nameController.text;
      final description = _descriptionController.text;
      String imageUrl = widget.category.image;

      if (_selectedImage != null) {
        try {
          imageUrl = await _uploadImageToFirebase(_selectedImage!);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image upload failed: $e')),
          );
          setState(() {
            _isLoading = false;
          });
          return;
        }
      }

      // Update the category
      await ref
          .read(categoryStateProvider.notifier)
          .updateCategory(
        widget.category.categoryId.toString(),
        name,
        description,
        imageUrl,
      )
          .then((_) {
        // Fetch all categories after updating
        ref.read(categoryStateProvider.notifier).fetchAllCategories();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Category updated successfully')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update category: $error')),
        );
      }).whenComplete(() {
        setState(() {
          _isLoading = false;
        });
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (widget.category.image.isNotEmpty
                        ? NetworkImage(widget.category.image)
                        : null) as ImageProvider?,
                    child: _selectedImage == null &&
                        widget.category.image.isEmpty
                        ? const Icon(Icons.add_a_photo, size: 30)
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Category Name',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Category Description',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _updateCategory,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Save Change'),
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
