Berikut isi **README.md** untuk aplikasi kamu. Tinggal copy–paste saja 🚀

---

# 🎬 CineScope – Film Review App

CineScope adalah aplikasi mobile berbasis Flutter yang memungkinkan pengguna untuk menambahkan, mengedit, dan menghapus review film dengan tampilan modern bertema dark (bioskop vibes 🎥). Aplikasi ini dirancang dengan struktur folder yang profesional dan scalable sehingga mudah dikembangkan ke level lebih lanjut seperti integrasi database, state management, maupun fitur premium lainnya.

Aplikasi ini mengimplementasikan konsep CRUD (Create, Read, Update, Delete) sederhana menggunakan stateful widget dan navigasi antar halaman.

---

## 📌 Deskripsi Aplikasi

CineScope merupakan aplikasi review film dengan tampilan dark theme elegan yang memberikan pengalaman seperti berada di dalam bioskop. Pengguna dapat:

* Menambahkan review film baru
* Memberikan rating (1–10)
* Menuliskan komentar atau ulasan film
* Mengedit review yang sudah dibuat
* Menghapus review yang tidak diperlukan

Struktur project dibuat modular dengan pemisahan model, pages, widgets, dan theme agar clean architecture tetap terjaga dan mudah dikembangkan.

---

## 🚀 Fitur Aplikasi

Berikut fitur utama dalam CineScope:

### 🎥 1. Dark Theme Modern

* Menggunakan custom ThemeData
* Background gelap dengan aksen merah
* Card elegan dengan rounded corner
* Floating Action Button modern

### ➕ 2. Tambah Review (Create)

* Input judul film
* Input rating (1–10)
* Input teks review
* Validasi sederhana (tidak boleh kosong)

### 📖 3. Tampilkan Review (Read)

* ListView dinamis
* Tampilan dalam bentuk card
* Informasi judul, rating, dan review

### ✏️ 4. Edit Review (Update)

* Navigasi ke halaman edit
* Data lama otomatis terisi
* Bisa memperbarui isi review

### 🗑️ 5. Hapus Review (Delete)

* Tombol delete pada setiap card
* Data langsung terhapus dari list

### 🔄 6. Navigasi Antar Halaman

* Menggunakan Navigator.push
* Mengirim dan menerima data antar halaman

---

## 🧩 Widget yang Digunakan

Berikut daftar widget utama yang digunakan dalam pengembangan aplikasi ini:

### 🔹 Struktur Dasar

* `MaterialApp`
* `Scaffold`
* `AppBar`
* `ThemeData`

### 🔹 Layout & Struktur

* `Column`
* `Row`
* `Padding`
* `SizedBox`
* `Center`
* `ListView.builder`
* `Card`

### 🔹 Input & Interaksi

* `TextField`
* `ElevatedButton`
* `FloatingActionButton`
* `IconButton`
* `Navigator`

### 🔹 State Management

* `StatefulWidget`
* `setState()`

---

## 📁 Struktur Project

```
lib/
│
├── main.dart
│
├── models/
│   └── review.dart
│
├── pages/
│   ├── home_page.dart
│   ├── add_review_page.dart
│   └── edit_review_page.dart
│
├── widgets/
│   └── review_card.dart
│
└── theme/
    └── app_theme.dart
```

Struktur ini membuat aplikasi:

* Lebih rapi
* Mudah dipelihara
* Mudah dikembangkan ke level berikutnya (database, provider, dll)

---

## 🎯 Tujuan Pengembangan

Aplikasi ini dibuat untuk:

* Memahami konsep CRUD di Flutter
* Memahami navigasi antar halaman
* Memahami struktur project yang scalable
* Mengimplementasikan custom theme
* Melatih clean architecture dalam Flutter

---

# 📁 Isi Struktur Folder

---

# 1️⃣ main.dart

## 📄 Kode

```dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const CineScopeApp());
}

class CineScopeApp extends StatelessWidget {
  const CineScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineScope',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
```

## 🧠 Penjelasan

* `runApp()` menjalankan aplikasi
* `MaterialApp` adalah root aplikasi
* `theme` mengambil dari `AppTheme`
* `home` adalah halaman pertama → `HomePage`

---

# 2️⃣ models/review.dart

## 📄 Kode

```dart
class Review {
  String title;
  double rating;
  String review;

  Review({
    required this.title,
    required this.rating,
    required this.review,
  });
}
```

## 🧠 Penjelasan

Model ini menyimpan data review:

* `title` → Judul film
* `rating` → Rating dalam bentuk double
* `review` → Isi komentar

Kenapa rating jadi `double`?
Agar nanti bisa dikembangkan ke star rating ⭐

---

# 3️⃣ theme/app_theme.dart

## 📄 Kode

```dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.redAccent,
    scaffoldBackgroundColor: const Color(0xFF121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      elevation: 0,
      centerTitle: true,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.redAccent,
    ),

    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
```

## 🧠 Penjelasan

* Dark theme bioskop 🎥
* Background hitam elegan
* Card rounded 16px
* Accent warna merah

Semua styling terpusat di sini → clean & scalable.

---

# 4️⃣ widgets/review_card.dart

## 📄 Kode

```dart
import 'package:flutter/material.dart';
import '../models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ReviewCard({
    super.key,
    required this.review,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text("${review.rating}/10"),
              ],
            ),

            const SizedBox(height: 8),
            Text(review.review),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
```

## 🧠 Penjelasan

* StatelessWidget karena hanya menampilkan data
* Menerima:

  * data review
  * fungsi edit
  * fungsi delete
* Card reusable → clean component design

---

# 5️⃣ pages/home_page.dart

## 📄 Kode

```dart
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
      ),
      body: reviews.isEmpty
          ? const Center(
              child: Text(
                "Belum ada review...\nTambahkan film favoritmu 🎥",
                textAlign: TextAlign.center,
              ),
            )
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
                          builder: (_) =>
                              EditReviewPage(review: reviews[index]),
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
```

## 🧠 Penjelasan

Ini adalah pusat logika aplikasi.

* Menyimpan list review
* Mengatur add, edit, delete
* Menggunakan `setState()` untuk refresh UI
* Navigasi menggunakan `Navigator.push()`

---

# 6️⃣ pages/add_review_page.dart

## 📄 Kode

```dart
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
      rating: double.parse(_ratingController.text),
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
```

---

# 7️⃣ pages/edit_review_page.dart

## 📄 Kode

```dart
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
    _ratingController =
        TextEditingController(text: widget.review.rating.toString());
    _reviewController =
        TextEditingController(text: widget.review.review);
  }

  void submit() {
    final updatedReview = Review(
      title: _titleController.text,
      rating: double.parse(_ratingController.text),
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
```

---

# 🔥 Alur Kerja Aplikasi

1. User membuka aplikasi → HomePage
2. Klik tombol ➕
3. Masuk ke AddReviewPage
4. Data dikirim kembali ke HomePage
5. ListView update otomatis
6. User bisa edit atau delete

---

✨ CineScope – Because every movie deserves a meaningful review.
