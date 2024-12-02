import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';
import 'category_detail_screen.dart';

class CategoryFormScreen extends ConsumerStatefulWidget {
  static const String routeName = '/manage_categories';

  const CategoryFormScreen({super.key});

  @override
  ConsumerState<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends ConsumerState<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;
  bool _isUploading = false;


  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef =
          FirebaseStorage.instance.ref().child('categories/$fileName');
      final uploadTask = await storageRef.putFile(imageFile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoryStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Categories'),
      ),
      body: Column(
        children: [
          // Form Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Category Name',
                      border: OutlineInputBorder(),
                    ),
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
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!, fit: BoxFit.cover)
                          : const Center(
                              child: Text('Tap to select an image'),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isUploading
                        ? null
                        : () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              if (_selectedImage == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select an image'),
                                  ),
                                );
                                return;
                              }

                              setState(() {
                                _isUploading = true;
                              });

                              final imageUrl =
                                  await _uploadImage(_selectedImage!);

                              if (imageUrl == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Image upload failed')),
                                );
                                setState(() {
                                  _isUploading = false;
                                });
                                return;
                              }

                              final name = _nameController.text;
                              final description = _descriptionController.text;

                              ref
                                  .read(categoryStateProvider.notifier)
                                  .createCategory(name, description, imageUrl)
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Category added successfully')),
                                );
                                _nameController.clear();
                                _descriptionController.clear();
                                setState(() {
                                  _selectedImage = null;
                                  _isUploading = false;
                                });

                                // Fetch all categories again
                                ref
                                    .read(categoryStateProvider.notifier)
                                    .fetchAllCategories();
                              });
                            }
                          },
                    child: _isUploading
                        ? const CircularProgressIndicator()
                        : const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Add Category'),
                        ),
                  ),
                ],
              ),
            ),
          ),

          /// Divider
          const Divider(thickness: 1, height: 1, color: Colors.grey),

          /// List Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: categoryState.when(
                data: (categories) {
                  return ListView.builder(
                    itemCount: categories.result.length,
                    itemBuilder: (context, index) {
                      final category = categories.result[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(category.name),
                          subtitle: Text(category.description),
                          leading: category.image != null
                              ? Image.network(category.image!, width: 50)
                              : const Icon(Icons.image_not_supported),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.grey),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryDetailScreen(
                                        category: category,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirm Deletion'),
                                        content: const Text(
                                            'Are you sure you want to delete this category?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              try {
                                                await ref
                                                    .read(categoryStateProvider
                                                        .notifier)
                                                    .deleteCategory(category
                                                        .categoryId
                                                        .toString());

                                                await ref
                                                    .read(categoryStateProvider
                                                        .notifier)
                                                    .fetchAllCategories();

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Category deleted successfully'),
                                                  ),
                                                );
                                              } catch (error) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'Error: $error')),
                                                );
                                              }
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Error: $error')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
