import 'package:flutter/material.dart';
import '../models/review.dart';
import '../widgets/review_card.dart';
import 'add_review_page.dart';
import 'edit_review_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Review> reviews = [];

  void addReview(Review review) {
    setState(() {
      reviews.add(review);
    });
  }

  void deleteReview(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

  void updateReview(int index, Review updatedReview) {
    setState(() {
      reviews[index] = updatedReview;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🎬 CineScope Reviews"),
        centerTitle: true,
      ),
      body: reviews.isEmpty
          ? const Center(child: Text("Belum ada review..."))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ReviewCard(
                    review: reviews[index],
                    onDelete: () => deleteReview(index),
                    onEdit: () async {
                      final updatedReview = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditReviewPage(
                            review: reviews[index],
                          ),
                        ),
                      );

                      if (updatedReview != null) {
                        updateReview(index, updatedReview);
                      }
                    },
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newReview = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddReviewPage(),
            ),
          );

          if (newReview != null) {
            addReview(newReview);
          }
        },
      ),
    );
  }
}