import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  final double size;

  const UserProfile({super.key, this.size = 100.0});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final savedImage = await _saveImage(file);
        setState(() {
          _imageFile = savedImage;
        });
      }
    } catch (e) {
      debugPrint("Ошибка при выборе изображения: $e");
    }
  }

  Future<File?> _saveImage(File image) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName =
          'user_profile_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final savedImage = await image.copy('${appDir.path}/$fileName');

      final prefs = await SharedPreferences.getInstance();
      List<String> imagePaths = prefs.getStringList('profileImages') ?? [];
      imagePaths.add(savedImage.path);
      await prefs.setStringList('profileImages', imagePaths);

      return savedImage;
    } catch (e) {
      debugPrint("Ошибка при сохранении изображения: $e");
      return null;
    }
  }

  Future<void> _loadImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> imagePaths = prefs.getStringList('profileImages') ?? [];

      if (imagePaths.isNotEmpty) {
        setState(() {
          _imageFile = File(imagePaths.last);
        });
      }
    } catch (e) {
      debugPrint("Ошибка при загрузке изображений: $e");
    }
  }

  Future<void> _deleteImage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> imagePaths = prefs.getStringList('profileImages') ?? [];

    if (imagePaths.isNotEmpty && _imageFile != null) {
      imagePaths.remove(_imageFile!.path);
      await prefs.setStringList('profileImages', imagePaths);

      await _imageFile!.delete();
      setState(() {
        _imageFile = null;
      });

      debugPrint("Изображение удалено и из стека, и с устройства");
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
          title: const Text(
            "Удалить изображение?",
            style: TextStyle(color: Colors.blueAccent),
          ),
          content: const Text(
            "Вы уверены, что хотите удалить фото профиля?",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Отмена",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteImage();
              },
              child: const Text(
                "Удалить",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_imageFile != null) {
          _showDeleteDialog();
        } else {
          _pickImage();
        }
      },
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: widget.size,
              height: widget.size,
              color: Colors.grey[300],
              child: _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                      width: widget.size,
                      height: widget.size,
                    )
                  : Icon(
                      Icons.person,
                      size: widget.size * 0.6,
                      color: Colors.grey[700],
                    ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
