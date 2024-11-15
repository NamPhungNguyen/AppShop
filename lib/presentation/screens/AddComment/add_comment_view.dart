import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/domain_modules.dart';

class AddCommentSection extends ConsumerStatefulWidget {
  final String productId;
  final VoidCallback onCommentAdded;  // Add callback

  const AddCommentSection({
    Key? key,
    required this.productId,
    required this.onCommentAdded,  // Accept callback in constructor
  }) : super(key: key);

  @override
  ConsumerState<AddCommentSection> createState() => _AddCommentSectionState();
}

class _AddCommentSectionState extends ConsumerState<AddCommentSection> {
  final TextEditingController _commentController = TextEditingController();
  final List<XFile> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  double _rating = 0.0;

  // Pick multiple images
  void _pickImages() async {
    final images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages.addAll(images);
      });
    }
  }

  // Upload images to Firebase Storage
  Future<List<String>> uploadImages(List<XFile> images) async {
    List<String> downloadUrls = [];
    for (var image in images) {
      String fileName =
          "comment_images/${DateTime.now().millisecondsSinceEpoch}_${image.name}";
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      await storageRef.putFile(File(image.path));
      String downloadUrl = await storageRef.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }

  // Submit comment and images using the API
  Future<void> _submitComment(WidgetRef ref) async {
    if (_commentController.text.isEmpty && _selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please add text or images!")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Upload images to Firebase and get URLs
      List<String> imageUrls = await uploadImages(_selectedImages);

      // Call API to add comment
      final commentUsecase = ref.read(commentUsecaseProvider);
      await commentUsecase.addComment(
        widget.productId, // Pass productId from widget
        _commentController.text,
        _rating.toInt(),
        imageUrls,
      );

      // After comment is added, call the callback to invalidate and refresh comments
      widget.onCommentAdded();  // Trigger the refresh callback

      // Clear inputs after submission
      _commentController.clear();
      _selectedImages.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Comment submitted successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to submit comment: $e")),
      );
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add a Review",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),

        // Input for comment text
        TextField(
          controller: _commentController,
          decoration: const InputDecoration(
            hintText: "Write your review...",
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 10),

        // Rating input
        const Text(
          "Rating:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Slider(
          value: _rating,
          min: 0,
          max: 5,
          divisions: 5,
          label: _rating.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _rating = value;
            });
          },
        ),
        Text("Rating: ${_rating.toStringAsFixed(1)} / 5"),
        const SizedBox(height: 10),

        // Buttons to add images or submit the comment
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: _pickImages,
              icon: const Icon(Icons.image),
              label: const Text("Add Images"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : () => _submitComment(ref),
              child: _isLoading
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : const Text("Submit"),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Display selected images
        if (_selectedImages.isNotEmpty) ...[
          const Text(
            "Selected Images:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _selectedImages
                .map(
                  (image) => Image.file(
                File(image.path),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

