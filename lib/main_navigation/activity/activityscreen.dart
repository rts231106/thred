import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';

final tabs = [
  "All",
  "Replies",
  "Menteions",
  "Likes",
  "LIVE",
  "Shopping",
  "Brands",
];

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final List<String> _notifications = List.generate(20, (index) => "${index}h");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            150,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
            ),
            child: AppBar(
              title: const Text(
                'Activity',
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                padding: const EdgeInsets.only(
                  left: Sizes.size16,
                ),
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                indicatorColor: Colors.black,
                indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                    Sizes.size10,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                ),
                tabs: [
                  for (var tab in tabs)
                    Tab(
                      text: tab,
                    ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var _notification in _notifications) ...[
                    Dismissible(
                      key: Key(_notification),
                      child: ListTile(
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
                        title: Row(
                          children: [
                            const Text(
                              "cat ",
                              style: TextStyle(
                                fontSize: Sizes.size20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _notification,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.size20,
                              ),
                            ),
                          ],
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: "mentioned you\n",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: Sizes.size20,
                            ),
                            children: const [
                              TextSpan(
                                text: "Here's a thread you should follow @dongglix haha hoho huhu",
                                style: TextStyle(
                                  fontSize: Sizes.size20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        isThreeLine: true,
                      ),
                    ),
                    Divider(
                      indent: 82,
                      endIndent: 5,
                      color: Colors.grey.withOpacity(0.5),
                      height: 0.5,
                    ),
                  ],
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
