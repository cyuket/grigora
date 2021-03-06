import 'package:flutter_svg/flutter_svg.dart';
import 'package:grigora/constant/app_assets.dart';
import 'package:grigora/model/details_model.dart';
import 'package:grigora/ui/shared/app_colors.dart';
import 'package:grigora/ui/shared/base_view.dart';
import 'package:grigora/ui/shared/shared_styles.dart';
import 'package:grigora/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:grigora/ui/widgets/drawer.dart';
import 'package:grigora/viewmodel/detail_view_model.dart';

class DetailPageScreen extends StatelessWidget {
  final String name;
  final image;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DetailPageScreen({@required this.image, this.name});
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
        onModelReady: (model) => model.fetchDetail(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
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
            body: model.busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Builder(builder: (context) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: screenHeight(context) - 90,
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          model.detial?.profileImage),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.8),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(image),
                                      ),
                                      verticalSpaceMedium,
                                      Text(
                                        "$name",
                                        style: textStyle.copyWith(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      verticalSpaceMedium,
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "${model.detial?.cuisines}",
                                          textAlign: TextAlign.center,
                                          style: textStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      verticalSpaceMedium,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_border_outlined,
                                                color: Colors.white,
                                              ),
                                              horizontalSpaceTiny,
                                              Text(
                                                "${model.detial?.rating} (${model.detial?.review} REVIEWS)",
                                                style: textStyle.copyWith(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          horizontalSpaceTiny,
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 3,
                                          ),
                                          horizontalSpaceSmall,
                                          Text(
                                            "1.65 KM Away",
                                            style: textStyle.copyWith(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpaceMedium,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            !model.detial.busyStatus
                                                ? "OPEN"
                                                : "CLOSED",
                                            style: textStyle.copyWith(
                                              fontSize: 13,
                                              color: !model.detial.busyStatus
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                          horizontalSpaceTiny,
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 3,
                                          ),
                                          horizontalSpaceSmall,
                                          InkWell(
                                            onTap: () {
                                              showBottomSheet(
                                                  context: context,
                                                  builder: (ctxt) {
                                                    return ModalWidget(
                                                      detail: model.detial,
                                                      name: name,
                                                    );
                                                  });
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.info_outlined,
                                                  color: Colors.white,
                                                ),
                                                horizontalSpaceTiny,
                                                Text(
                                                  "MORE INFO",
                                                  style: textStyle.copyWith(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpace(20),
                                      Divider(color: Colors.white),
                                      verticalSpace(20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Min. Order",
                                                style: textStyle.copyWith(
                                                  fontSize: 13,
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                "N 200",
                                                style: textStyle.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Prep. Time",
                                                style: textStyle.copyWith(
                                                  fontSize: 13,
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                "${model.detial.prepTime} mins",
                                                style: textStyle.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Delivery fee",
                                                style: textStyle.copyWith(
                                                  fontSize: 13,
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                "From N ${model.detial.deliveryFee}",
                                                style: textStyle.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      verticalSpace(20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Delivery",
                                                  style: textStyle.copyWith(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                horizontalSpaceSmall,
                                                VerticalDivider(),
                                                horizontalSpaceSmall,
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: AppColors.textColor,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                          horizontalSpaceSmall,
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.white),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.people_alt_outlined,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                horizontalSpaceSmall,
                                                Text(
                                                  "Start Group Order",
                                                  style: textStyle.copyWith(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpace(20),
                                      Column(
                                        children: [
                                          Text(
                                            "Choose Menu",
                                            style: textStyle.copyWith(
                                              fontSize: 13,
                                              color: AppColors.secondaryColor,
                                            ),
                                          ),
                                          verticalSpaceSmall,
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            width: screenWidth(context) - 160,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color:
                                                      AppColors.secondaryColor),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "All Time",
                                                  style: textStyle.copyWith(
                                                      fontSize: 13,
                                                      color: AppColors
                                                          .secondaryColor),
                                                ),
                                                horizontalSpaceSmall,
                                                VerticalDivider(
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                                horizontalSpaceSmall,
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color:
                                                      AppColors.secondaryColor,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
          );
        });
  }
}

class ModalWidget extends StatelessWidget {
  const ModalWidget({
    Key key,
    this.detail,
    this.name,
  }) : super(key: key);
  final String name;
  final DetailModel detail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "X",
                      style: textStyle.copyWith(
                        color: Color(0xff616161),
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(20),
              Text(
                name,
                style: textStyle.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Items(
                      icon: Icons.location_on_outlined,
                      title: "Address",
                      text: detail.address,
                    ),
                    Items(
                      icon: Icons.access_time,
                      title: "Opening Time",
                      text: detail.openingTime,
                    ),
                    Items(
                      icon: Icons.access_time,
                      title: "Closing Time",
                      text: detail.closingTime,
                    ),
                    Items(
                      icon: Icons.star_border_outlined,
                      title: "Address",
                      text: "${detail.rating} Stars",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    Key key,
    this.icon,
    this.text,
    this.title,
  }) : super(key: key);

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.secondaryColor,
          ),
          horizontalSpaceMedium,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: textStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpaceSmall,
              SizedBox(
                width: screenWidth(context) - 150,
                child: RichText(
                  text: TextSpan(
                    text: "$text",
                    style: textStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key key,
    this.isBold = false,
    this.isSmall = false,
    this.label,
    this.text,
  }) : super(key: key);

  final String label;
  final String text;
  final bool isBold, isSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
