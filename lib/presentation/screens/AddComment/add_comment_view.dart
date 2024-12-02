import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/domain_modules.dart';

class AddCommentSection extends ConsumerStatefulWidget {
  final String productId;
  final VoidCallback onCommentAdded;

  const AddCommentSection({
    Key? key,
    required this.productId,
    required this.onCommentAdded,
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

  Future<void> _submitComment(WidgetRef ref) async {
    if (_commentController.text.isEmpty && _selectedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please add text or images!")),
      );
      return;
    }

    if (_rating == 0.0) { // Check if rating is 0
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a rating!")),
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
        widget.productId,
        _commentController.text,
        _rating.toInt(),
        imageUrls,
      );

      widget.onCommentAdded(); // Refresh callback

      _commentController.clear();
      _selectedImages.clear();
      _rating = 0.0;  // Reset the rating stars

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
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add a Review",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            // Comment Text Field
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: "Write your review...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),

            // Rating section with stars
            const Text(
              "Rating:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            Text("${_rating.toStringAsFixed(1)} / 5"),
            const SizedBox(height: 10),

            // Buttons for adding images and submitting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.image),
                    label: const Text("Add Images"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : () => _submitComment(ref),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14.5),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : const Text("Submit"),
                  ),
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
                      (image) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(image.path),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    .toList(),
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),

        // Full-screen loading overlay
        if (_isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
