import 'package:flutter/material.dart';
import '../models/review.dart';

class EditReviewPage extends StatefulWidget {
  final Review review;

  const EditReviewPage({super.key, required this.review});

  @override
  State<EditReviewPage> createState() => _EditReviewPageState();
}

class _EditReviewPageState extends State<EditReviewPage> {
  late TextEditingController _titleController;
  late TextEditingController _ratingController;
  late TextEditingController _reviewController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.review.title);
    _ratingController = TextEditingController(text: widget.review.rating);
    _reviewController = TextEditingController(text: widget.review.review);
  }

  void submit() {
    final updatedReview = Review(
      title: _titleController.text,
      rating: _ratingController.text,
      review: _reviewController.text,
    );

    Navigator.pop(context, updatedReview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Review")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _titleController),
            TextField(controller: _ratingController),
            TextField(controller: _reviewController, maxLines: 3),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}