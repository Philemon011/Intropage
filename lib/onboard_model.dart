import 'package:flutter/material.dart';

class OnboardModel {
  String image;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.image,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
  
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    image: "lib/assets/images/image1.jpg",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
    bg: Colors.white,
    button: const Color(0xFFFFC801),
  ),
  OnboardModel(
    image: "lib/assets/images/image2.jpg",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
    bg: Colors.white,
    button: const Color(0xFFFFC801),
  ),
  OnboardModel(
    image: "lib/assets/images/image3.jpg",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
    bg: Colors.white,
    button: const Color(0xFFFFC801),
  ),
];
