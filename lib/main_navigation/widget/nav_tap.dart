import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelecte,
    required this.icon,
    required this.onTap,
  });

  final bool isSelecte;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isSelecte ? 1 : 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              color: isSelecte ? Colors.black : Colors.grey,
              size: Sizes.size32,
            ),
            Gaps.v2,
          ],
        ),
      ),
    );
  }
}
