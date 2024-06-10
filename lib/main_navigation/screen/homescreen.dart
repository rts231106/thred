import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';
import 'package:thred/main_navigation/widget/threadtext.dart';
import 'package:thred/main_navigation/widget/thredImg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ThreadText(
                icon: FontAwesomeIcons.passport,
                name: "Pubity",
                text: "Vine after seeing the Threads logo inveiled",
              ),
              Gaps.v14,
              ThreadText(
                icon: FontAwesomeIcons.pooStorm,
                name: "posts",
                text: "On this couple of days we are going to clone",
              ),
              Gaps.v14,
              ThreadText(
                icon: FontAwesomeIcons.rainbow,
                name: "Dong",
                text: "here are two kinds of posts, one with text and ",
              ),
              Gaps.v14,
              ThreadText(
                icon: FontAwesomeIcons.youtube,
                name: "Nico",
                text: "When the post has images, the user should be",
              ),
              Gaps.v14,
              ThreadText(
                icon: FontAwesomeIcons.cloud,
                name: "cloud",
                text: "Try to clone the design as close as possible.",
              ),
              Gaps.v14,
              ThreadText(
                icon: FontAwesomeIcons.user,
                name: "flutter",
                text: "Vine after seeing the Threads logo inveiled",
              ),
              ThreadImg( 
                icon: FontAwesomeIcons.cat,
                name: "cat",
                text: "Cute Cat",
              )
            ],
          ),
        ),
      ),
    );
  }
}
