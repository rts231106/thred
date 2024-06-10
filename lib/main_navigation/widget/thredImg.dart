import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';

class ThreadImg extends StatelessWidget {
  final IconData icon;
  final String name;
  final String text;

  const ThreadImg({
    super.key,
    required this.icon,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v28,
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 40.0, // 원하는 너비로 설정
                  height: 40.0, // 원하는 높이로 설정
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FaIcon(
                      icon,
                      color: Colors.white,
                      size: Sizes.size20,
                    ),
                  ),
                ),
                Positioned(
                  left: 27,
                  top: 22,
                  height: 20,
                  child: Container(
                    width: 20.0, // 원하는 너비로 설정
                    height: 20.0, // 원하는 높이로 설정
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // 외곽선의 색상
                        width: 2.0, // 외곽선의 너비
                      ),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                        size: Sizes.size10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  bottom: 15,
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size20,
                    ),
                  ),
                ),
                const Positioned(
                  left: 320,
                  top: 0,
                  child: Icon(
                    Icons.list,
                  ),
                ),
                Positioned(
                  left: 50,
                  bottom: 0,
                  child: Text(
                    text,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size14,
                    ),
                  ),
                ),
              ],
            ),
            Gaps.h10,
          ],
        ),
        Gaps.v5,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Gaps.h40,
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Sizes.size5,
                  ),
                ),
                child: Image.asset(
                  'lib/assets/cat.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Gaps.h10,
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Sizes.size5,
                  ),
                ),
                child: Image.asset(
                  'lib/assets/cat.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Gaps.h10,
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Sizes.size5,
                  ),
                ),
                child: Image.asset(
                  'lib/assets/cat.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Gaps.v5,
        const Row(
          children: [
            Gaps.h48,
            FaIcon(
              FontAwesomeIcons.heart,
            ),
            Gaps.h10,
            FaIcon(
              FontAwesomeIcons.comment,
            ),
            Gaps.h10,
            FaIcon(
              FontAwesomeIcons.shareFromSquare,
            ),
            Gaps.h10,
            FaIcon(
              FontAwesomeIcons.paperPlane,
            ),
          ],
        ),
        Gaps.v20,
        Divider(
          color: Colors.grey.withOpacity(0.5),
          height: 0.5,
        ),
      ],
    );
  }
}
