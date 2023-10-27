import 'package:image_picker/image_picker.dart';

class Image_Picker {
  static Future<XFile?> pickFile() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      return returnedImage;
    }
  }
}
