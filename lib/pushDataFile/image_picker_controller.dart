import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final picker = ImagePicker();
  XFile? file;
  RxString imagePathSt = "".obs;

  Future<void> getImage() async {
    file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      print("Image Selected");
      imagePathSt.value = file!.path.toString();
    }
  }
}
