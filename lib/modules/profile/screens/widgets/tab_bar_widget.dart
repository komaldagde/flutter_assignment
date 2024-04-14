import 'package:flutter/material.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/strings/value_string.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> tabBarChildrenList;
  final List<String> tabBarTitleList;
  final String choiceTab;
  final double? examTabHeight;

  const TabBarWidget(
      {super.key,
      required this.tabBarChildrenList,
      required this.tabBarTitleList,
      required this.choiceTab,
      this.examTabHeight});

  @override
  State<TabBarWidget> createState() => _CommonTabBarWidgetState();
}

class _CommonTabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: widget.tabBarTitleList.length,
      // initialIndex: activeTabIndex,
      vsync: this,
    );
    controller!.addListener(() {
      setState(() {
        activeTabIndex = controller!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabBarTitleList.length, // length of tabs
        initialIndex: 0,
        child: switchTabBar(
            widget.choiceTab,
            context,
            controller,
            widget.tabBarTitleList,
            widget.tabBarChildrenList,
            activeTabIndex, (index) {
          setState(() {
            activeTabIndex = index;
          });
        }, widget.examTabHeight));
  }
}

Widget switchTabBar(
    selectedTab,
    context,
    controller,
    List<String> tabBarTitleList,
    tabBarChildrenList,
    activeTabIndex,
    onTap,
    examTabHeight) {
  switch (selectedTab) {
    case ValueString.choosePhotoText:
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: buildWidth(context) * 0.00),
            child: Padding(
              padding: EdgeInsets.only(top: buildHeight(context) * 0.015),
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(
                    horizontal: buildWidth(context) * 0.060),
                labelStyle: TextStyleUtility.commonTextStyle(context,
                    ColorsUtility.primaryBlackColor, 14.0, FontWeight.w500),
                indicatorColor: ColorsUtility.primaryGreenColor,
                unselectedLabelStyle: TextStyleUtility.commonTextStyle(
                  context,
                  ColorsUtility.primaryBlackColor,
                  14.0,
                  FontWeight.w500,
                ),
                labelColor: ColorsUtility.primaryGreenColor,
                unselectedLabelColor: ColorsUtility.primaryWhiteColor,
                tabs: tabBarTitleList.map((selectedTabTitle) {
                  return Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        selectedTabTitle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  );
                }).toList(),
                isScrollable: true,
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
          ),
          Container(
              height: buildHeight(context) * 0.80,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: ColorsUtility.primaryBlackColor, width: 1.5))),
              child: TabBarView(children: tabBarChildrenList))
        ],
      );
    case ValueString.avatarText:
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: buildHeight(context) * 0.015,
                left: buildWidth(context) * 0.05,
                right: buildWidth(context) * 0.05),
            child: TabBar(
              labelStyle: TextStyleUtility.commonTextStyle(context,
                  ColorsUtility.primaryGreyColor, 14.0, FontWeight.w400),
              indicator: const BubbleTabIndicator(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                indicatorColor: ColorsUtility.secondaryGreyColor,
              ),
              unselectedLabelStyle: TextStyleUtility.commonTextStyle(context,
                  ColorsUtility.primaryGreyColor, 14.0, FontWeight.w400),
              labelColor: ColorsUtility.primaryGreenColor,
              unselectedLabelColor: ColorsUtility.primaryGreyColor,
              tabs: tabBarTitleList.map((selectedTabName) {
                return Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      selectedTabName,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      softWrap: false,
                      maxLines: 1,
                    ),
                  ),
                );
              }).toList(),
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          SizedBox(
              height: examTabHeight ?? buildHeight(context),
              child: TabBarView(children: tabBarChildrenList))
        ],
      );

    default:
      return Container();
  }
}
