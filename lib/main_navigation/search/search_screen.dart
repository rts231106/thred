import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  void _onSearchChaged(String value) {}
  void _onSearchSubmitted(String value) {}

  final List<String> _notifications = List.generate(10, (index) => "$index");

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          130,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size20,
          ),
          child: AppBar(
            title: const Text(
              'Search',
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                child: CupertinoSearchTextField(
                  controller: _textEditingController,
                  onChanged: _onSearchChaged,
                  onSubmitted: _onSearchSubmitted,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Gaps.v10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i in _notifications) ...[
                ListTile(
                  leading: Container(
                    clipBehavior: Clip.hardEdge,
                    width: Sizes.size52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Image.asset(
                        "lib/assets/cat.png",
                      ),
                    ),
                  ),
                  title: const Text(
                    "rjmithun",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "Mithun",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  trailing: Container(
                    width: Sizes.size96,
                    height: Sizes.size36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Gaps.v5,
                const Row(
                  children: [
                    Gaps.h80,
                    Gaps.h2,
                    Text(
                      "26.6k followers",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                  ],
                ),
                Gaps.v10,

              ],
            ],
          ),
        ],
      ),
    );
  }
}
