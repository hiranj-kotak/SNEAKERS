import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

Future<Uint8List> clearImageRetriever(String query) async {
  final response = await http.get(Uri.parse(query));
  var bytes = response.bodyBytes;
  bytes = await removeWhiteBackground(bytes);
  return bytes;
}

Future<Uint8List> removeWhiteBackground(Uint8List bytes) async {
  img.Image image = img.decodeImage(bytes)!;
  var pixels = image.getBytes();
  var height = image.height;
  var width = image.width;
  if (image.width > image.height) {
    return pixels;
  }
  if (pixels[3] == 0) {
    return pixels;
  }
  int red = pixels[0], green = pixels[1], blue = pixels[2];
  if (red != 255 && green != 255 && blue != 255) {
    return pixels;
  }
  for (int i = 0, len = pixels.length; i < len; i += 4) {
    if (pixels[i] == red && pixels[i + 1] == green && pixels[i + 2] == blue) {
      pixels[i + 3] = 0;
    }
  }
  return pixels;
}
