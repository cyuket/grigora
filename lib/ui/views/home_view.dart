import 'package:flutter_svg/flutter_svg.dart';
import 'package:grigora/constant/app_assets.dart';
import 'package:grigora/constant/route_names.dart';
import 'package:grigora/model/resturant_model.dart';
import 'package:grigora/ui/shared/app_colors.dart';
import 'package:grigora/ui/shared/base_view.dart';
import 'package:grigora/ui/shared/shared_styles.dart';
import 'package:grigora/ui/shared/ui_helpers.dart';

import 'package:flutter/material.dart';
import 'package:grigora/ui/views/details.dart';
import 'package:grigora/ui/widgets/custom_card.dart';
import 'package:grigora/ui/widgets/drawer.dart';
import 'package:grigora/viewmodel/home_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class HomeViewScreen extends StatefulWidget {
  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  PageController _pageController;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int currentIndex = 0;
  bool isLast = false;
  bool isFirst = true;
  bool isLast2 = false;
  bool isFirst2 = true;

  ScrollController _controller;
  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isLast2 = true;
      });
    } else {
      setState(() {
        isLast2 = false;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isFirst2 = true;
      });
    } else {
      setState(() {
        isFirst2 = false;
      });
    }
  }

  previousPage() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;

      if (index == 2) {
        isLast = true;
      } else {
        isLast = false;
      }

      if (index == 0) {
        isFirst = true;
      } else {
        isFirst = false;
      }
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) => model.fetchResturant(),
        builder: (context, model, child) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 50,
                  child: SvgPicture.asset(AppAssets.logo),
                ),
              ),
              leadingWidth: 50,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: AppColors.textColor,
                    size: 20,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    "Wuse 2, Abuja",
                    style: textStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalSpaceTiny,
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.textColor,
                    size: 20,
                  ),
                ],
              ),
              actions: [
                Icon(Icons.notifications_outlined, color: AppColors.textColor),
                horizontalSpaceSmall,
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.textColor,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState.openEndDrawer();
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            endDrawer: CustomDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for vendors and cuisines",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Container(
                      height: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ListView(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            children: [
                              RowWidget(
                                text: "Bakery & Cakes",
                                image: AppAssets.back1,
                              ),
                              RowWidget(
                                text: "Fries & Grills",
                                image: AppAssets.back2,
                              ),
                              RowWidget(
                                text: "Dishes",
                                image: AppAssets.back3,
                              ),
                              RowWidget(
                                text: "Drinks",
                                image: AppAssets.back4,
                              ),
                              RowWidget(
                                text: "Fast Foods",
                                image: AppAssets.back5,
                              ),
                              RowWidget(
                                text: "Daily Meals & Diets",
                                image: AppAssets.back6,
                              ),
                              RowWidget(
                                text: "Swallow",
                                image: AppAssets.back7,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              !isFirst2
                                  ? InkWell(
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.secondaryColor),
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: AppColors.secondaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              Spacer(),
                              !isLast2
                                  ? InkWell(
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.secondaryColor),
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.secondaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          )
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _items(
                            text: "Above 3",
                            isStar: true,
                            isRow: true,
                          ),
                          _items(
                            text: "##",
                            isRow: true,
                          ),
                          _items(
                            text: "Currently Open",
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          _items(
                            text: "Pickup",
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          _items(
                            text: "Trending",
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          _items(
                            text: "Vegetarian",
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "New ",
                                style: textStyle.copyWith(
                                  fontSize: 24,
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "in Grigora",
                                    style: textStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Recently added vendors",
                              style: textStyle.copyWith(
                                fontSize: 13,
                                color: Colors.grey.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "View all",
                          style: textStyle.copyWith(
                            fontSize: 15,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: model.busy
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  shadowColor: Colors.black.withOpacity(0.2),
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                PageView(
                                  controller: _pageController,
                                  onPageChanged: onChangedFunction,
                                  children: [
                                    ...List.generate(model.resturant.length,
                                        (index) {
                                      return CustomCard(
                                        resturant: model.resturant[index],
                                      );
                                    })
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    !isFirst
                                        ? InkWell(
                                            onTap: () {
                                              previousPage();
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors
                                                        .secondaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color:
                                                      AppColors.secondaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    Spacer(),
                                    !isLast
                                        ? InkWell(
                                            onTap: () {
                                              nextFunction();
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors
                                                        .secondaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color:
                                                      AppColors.secondaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                )
                              ],
                            ),
                    ),
                    verticalSpace(20),
                    RichText(
                      text: TextSpan(
                        text: "Restaurants ",
                        style: textStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "Near ",
                            style: textStyle.copyWith(
                              fontSize: 24,
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "You",
                            style: textStyle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Enjoy delicious meals from restaurants\nand vendors around you",
                          style: textStyle.copyWith(
                            fontSize: 13,
                            color: Colors.grey.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View all",
                          style: textStyle.copyWith(
                            fontSize: 15,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    model.busy
                        ? Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.grey[100],
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    shadowColor: Colors.black.withOpacity(0.2),
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.grey[100],
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    shadowColor: Colors.black.withOpacity(0.2),
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.grey[100],
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    shadowColor: Colors.black.withOpacity(0.2),
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              ...List.generate(model.resturant.length, (index) {
                                return CustomCard(
                                  resturant: model.resturant[index],
                                );
                              })
                            ],
                          )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container _items({
    String text,
    Color color,
    bool isStar = false,
    isRow = false,
  }) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            color: color != null ? color : Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textStyle.copyWith(
                    fontSize: 13, fontWeight: FontWeight.w900),
              ),
              horizontalSpaceSmall,
              isStar
                  ? Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 20,
                    )
                  : SizedBox(),
              isRow
                  ? Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColors.textColor,
                      size: 20,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.07),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(image),
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            text,
            style: textStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
