import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';
import 'package:thred/main_navigation/screen/video_recording_screen.dart';

class VideoComments extends StatefulWidget {
  final XFile? image;
  final bool isPicked;

  const VideoComments({super.key, required this.image, required this.isPicked});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onCameraTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const VideoRecordingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          title: const Text(
            "New Thread",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size10,
          ),
          child: Expanded(
            child: Stack(
              children: [
                const Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: Sizes.size28,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("lib/assets/cat.png"),
                        ),
                        Gaps.h16,
                        Text(
                          "dong gyoon park",
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Positioned(
                  left: 75,
                  top: 40,
                  child: SizedBox(
                    width: 270,
                    height: 300,
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent, // 테두리 색상 투명
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 65,
                  top: 110,
                  child: widget.isPicked
                      ? Container(
                          width: 250,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Sizes.size14,
                            ),
                            image: DecorationImage(
                              image: FileImage(
                                File(
                                  widget.image!.path,
                                ),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          child: IconButton(
                            onPressed: _onCameraTap,
                            icon: const FaIcon(
                              FontAwesomeIcons.camera,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
