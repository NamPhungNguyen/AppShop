import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import 'category_detail_screen.dart'; // Add import for the edit screen

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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final name = _nameController.text;
                        final description = _descriptionController.text;
                        final image = 'categories.png';
                        ref
                            .read(categoryStateProvider.notifier)
                            .createCategory(name, description, image)
                            .then((_) {
                          // Show confirmation message and clear the form
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Category added successfully')),
                          );
                          _nameController.clear();
                          _descriptionController.clear();

                          // After adding a new category, fetch all categories again
                          ref
                              .read(categoryStateProvider.notifier)
                              .fetchAllCategories();
                        });
                      }
                    },
                    child: const Text('Add Category'),
                  ),
                ],
              ),
            ),
          ),

          // Divider
          const Divider(thickness: 1, height: 1, color: Colors.grey),

          // List Section
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  // Navigate to CategoryDetailScreen to edit
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
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  // Show confirmation dialog before deleting
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirm Deletion'),
                                        content: const Text('Are you sure you want to delete this category?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Close the dialog
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              // Perform delete action
                                              try {
                                                // Delete the category
                                                await ref.read(categoryStateProvider.notifier).deleteCategory(
                                                  category.categoryId.toString(),
                                                );
                                                print(category.categoryId.toString());
                                                // Close the dialog
                                                Navigator.of(context).pop();

                                                // Fetch all categories again after deletion
                                                await ref.read(categoryStateProvider.notifier).fetchAllCategories();

                                                // Show confirmation message
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Category deleted successfully'),
                                                  ),
                                                );
                                              } catch (error) {
                                                // Close the dialog on error
                                                Navigator.of(context).pop();

                                                // Handle any errors that might occur during the delete operation
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('Error: $error')),
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
                loading: () {
                  // Show loading indicator while fetching categories
                  return const Center(child: CircularProgressIndicator());
                },
                error: (error, stackTrace) {
                  // Show error message if any issue occurs
                  return Center(child: Text('Error: $error'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
