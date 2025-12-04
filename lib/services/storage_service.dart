import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload Profile Photo with Compression (Web Compatible)
  Future<String> uploadProfilePhoto(XFile file, String uid) async {
    try {
      // Read file as bytes
      final Uint8List imageData = await file.readAsBytes();
      Uint8List dataToUpload = imageData;

      // Compress image (Skip on Web for now if it causes issues)
      // On Web, flutter_image_compress might need extra setup or fail.
      // For now, we upload original on web to be safe.
      // Check if running on web (kIsWeb) is ideal, but for now we catch the error or skip.

      try {
        final Uint8List compressedData =
            await FlutterImageCompress.compressWithList(
              imageData,
              minHeight: 1024,
              minWidth: 1024,
              quality: 70,
            );
        dataToUpload = compressedData;
      } catch (e) {
        print("Compression failed (likely web issue), uploading original: $e");
      }

      // Create storage reference
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final Reference ref = _storage.ref().child(
        'users/$uid/profile_photos/$fileName',
      );

      // Upload file data
      final SettableMetadata metadata = SettableMetadata(
        contentType: 'image/jpeg',
      );
      final UploadTask uploadTask = ref.putData(dataToUpload, metadata);
      final TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading photo: $e");
      throw e;
    }
  }
}
