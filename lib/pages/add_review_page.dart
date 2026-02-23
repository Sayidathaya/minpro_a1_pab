import 'package:flutter/material.dart';
import '../models/review.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final _titleController = TextEditingController();
  final _ratingController = TextEditingController();
  final _reviewController = TextEditingController();

  void submit() {
    if (_titleController.text.isEmpty ||
        _ratingController.text.isEmpty ||
        _reviewController.text.isEmpty) {
      return;
    }

    final review = Review(
      title: _titleController.text,
      rating: _ratingController.text,
      review: _reviewController.text,
    );

    Navigator.pop(context, review);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Review")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Judul Film"),
            ),
            TextField(
              controller: _ratingController,
              decoration: const InputDecoration(labelText: "Rating (1-10)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _reviewController,
              decoration: const InputDecoration(labelText: "Review"),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}