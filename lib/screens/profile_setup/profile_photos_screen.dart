import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/storage_service.dart';
import 'package:flutter_application_1/services/database_service.dart';

class ProfilePhotosScreen extends StatefulWidget {
  const ProfilePhotosScreen({super.key});

  @override
  State<ProfilePhotosScreen> createState() => _ProfilePhotosScreenState();
}

class _ProfilePhotosScreenState extends State<ProfilePhotosScreen> {
  final List<String?> _photos = List.filled(6, null); // 6 slots
  final ImagePicker _picker = ImagePicker();
  final StorageService _storageService = StorageService();
  final DatabaseService _databaseService = DatabaseService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load existing photos if any (omitted for now, starting fresh)
  }

  Future<void> _pickAndUploadPhoto(int index) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() => _isLoading = true);

      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in");

      final String downloadUrl = await _storageService.uploadProfilePhoto(
        image,
        user.uid,
      );

      setState(() {
        _photos[index] = downloadUrl;
      });

      // Save to Firestore immediately (optional, or save all on Next)
      await _databaseService.updateUser(user.uid, {
        'photos': _photos.where((p) => p != null).toList(),
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error uploading photo: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _onNext() async {
    final validPhotos = _photos.where((p) => p != null).toList();
    if (validPhotos.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please add at least 3 photos")),
      );
      return;
    }

    // Navigate to next screen
    Navigator.pushNamed(context, '/allow_permissions');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [const Color(0xFF221019), const Color(0xFF432233)]
                : [const Color(0xFFFFDAB9), const Color(0xFFFFC0CB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: textColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Upload Your Photos",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Progress Bar
                          Container(
                            width: 100,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 1.0, // 4/4
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              if (_isLoading) const LinearProgressIndicator(),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Your profile starts with a great photo. Add at least 3.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor?.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Main Photo
                      AspectRatio(
                        aspectRatio: 4 / 5,
                        child: _buildPhotoSlot(context, 0, isMain: true),
                      ),
                      const SizedBox(height: 12),

                      // Secondary Photos Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                        itemCount: 4, // Showing 4 more slots
                        itemBuilder: (context, index) {
                          return _buildPhotoSlot(context, index + 1);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Next Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: Theme.of(
                        context,
                      ).primaryColor.withOpacity(0.3),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSlot(
    BuildContext context,
    int index, {
    bool isMain = false,
  }) {
    final photoUrl = _photos[index];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (photoUrl != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(photoUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _photos[index] = null;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
          if (isMain)
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Main Photo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: () => _pickAndUploadPhoto(index),
        child: Container(
          decoration: BoxDecoration(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate,
                size: 32,
                color: Theme.of(context).primaryColor.withOpacity(0.7),
              ),
            ],
          ),
        ),
      );
    }
  }
}
