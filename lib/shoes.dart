import 'package:flutter/material.dart';

class Shoes extends ChangeNotifier {
  String id;
  String name;
  String brand;
  String image;
  String price;
  Color color;
  String Colorway;
  String style;
  String releaseDate;
  String description;
  String make;
  String model;
  String shortDescription;
  Map<String, String> cdc;

  Shoes({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.color,
    required this.Colorway,
    required this.description,
    required this.releaseDate,
    required this.style,
    required this.make,
    required this.model,
    required this.shortDescription,
    required this.cdc,
  });
  @override
  String toString() {
    print("id: $id");
    print("name: $name");
    print("brand: $brand");
    print("image: $image");
    print("price: $price");
    print("color: $color");
    print("Colorway: $Colorway");
    print("description: $description");
    return super.toString();
  }
}

List<Shoes> sneaks = [];

// List<Shoes> sneaks = [
//   Shoes(
//     name: "Jordan 4 Bred Reimagined",
//     image:
//         "https://firebasestorage.googleapis.com/v0/b/whatsapp-b80e1.appspot.com/o/Air-Jordan-4-Retro-Bred-Reimagined-Product-removebg-preview.png?alt=media&token=eea3826c-950c-4635-8d56-34e45cd10ed2",
//     price: "\$300",
//     color: const Color(0xffbcbdc1),
//   ),
//   Shoes(
//     name: "Jordan 1 Retro High Dior",
//     image:
//         "https://firebasestorage.googleapis.com/v0/b/whatsapp-b80e1.appspot.com/o/Air-Jordan-1-Retro-High-Dior-Product-removebg-preview.png?alt=media&token=624943a6-3e6b-4a59-bc54-e4b0351a2e3a",
//     price: "\$6533",
//     color: const Color(0xff91bfe0),
//   ),
//   Shoes(
//     name: "Jordan 1 Chicago Lost and Found",
//     image:
//         "https://firebasestorage.googleapis.com/v0/b/whatsapp-b80e1.appspot.com/o/profilePictures%2FAir-Jordan-1-Retro-High-OG-Chicago-Reimagined-Product-removebg-preview.png?alt=media&token=aea854df-9320-4da9-9ea3-d3f54e66dab7",
//     price: "\$254",
//     color: const Color.fromARGB(255, 251, 200, 207),
//   ),
//   Shoes(
//     name: "Jordan 1 Off-White University Blue",
//     image:
//         "https://firebasestorage.googleapis.com/v0/b/whatsapp-b80e1.appspot.com/o/Air-Jordan-1-Retro-High-Off-White-University-Blue-Product-removebg-preview.png?alt=media&token=691f5fe0-fe40-4e76-8578-b659e6365dd9",
//     price: "\$1150",
//     color: const Color(0xfff7bb76),
//   ),
//   Shoes(
//     name: "adidas Yeezy 350 Carbon Beluga",
//     image:
//         "https://firebasestorage.googleapis.com/v0/b/whatsapp-b80e1.appspot.com/o/%2B-removebg-preview.png?alt=media&token=d95fc635-2e9f-4c06-bc98-d15fab68ce9f",
//     price: "\$211",
//     color: const Color(0xffc5c7e0),
//   ),
// ];
