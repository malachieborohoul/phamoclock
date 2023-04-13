import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:phamoclock/features/admin/personnel/screens/personnel_screen.dart';
import 'package:phamoclock/features/admin/rapport/screens/all_rapports_screen.dart';
import 'package:phamoclock/features/rapport/screens/create_rapport_screen.dart';
import 'package:phamoclock/features/rapport/screens/rapports_screen.dart';

import '../../constants/colors.dart';
import '../../features/home/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: pageIndex == 0
          ? AllRapportsScreen()
          : pageIndex == 1
              ? RapportsScreen()
              : pageIndex == 2
                  ? RapportsScreen()
                  : Container(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Rédiger rapport",
        onPressed: () {
          // Navigator.pushNamed(context, FilterCourseScreen.routeName);
          showModalBottomSheet(
              useRootNavigator: true,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  builder: (_, controller) => Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: CreateRapportScreen(controller: controller),
                  ),
                );
              });
        },
        backgroundColor: primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getFooter() {
    List items = [
      "assets/images/home_icon.svg",
      "assets/images/play_icon.svg",
      "assets/images/favorite_icon.svg",
    ];
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 80,
          decoration: BoxDecoration(color: textWhite, boxShadow: [
            BoxShadow(
                color: textBlack.withOpacity(0.12),
                blurRadius: 30,
                offset: Offset(0, -10))
          ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        items[0],
                        height: 17.5,
                        color: pageIndex == 0 ? primary : grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      pageIndex == 0
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                height: 5,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        items[1],
                        height: 25,
                        color: pageIndex == 1 ? primary : grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      pageIndex == 1
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                height: 5,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
      ],
    );
  }
}
