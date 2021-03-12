import 'package:flutter/material.dart';
import 'package:grigora/model/resturant_model.dart';
import 'package:grigora/ui/shared/app_colors.dart';
import 'package:grigora/ui/shared/shared_styles.dart';
import 'package:grigora/ui/shared/ui_helpers.dart';
import 'package:grigora/ui/views/details.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    this.resturant,
  }) : super(key: key);

  final ResturantModel resturant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPageScreen(
                image: resturant.image,
                name: resturant.name,
              ),
            ),
          );
        },
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.07),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                height: double.infinity,
                width: 100,
                child: Image.network(resturant.image),
              ),
              horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${resturant.name}",
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceTiny,
                  Text(
                    "1.65 KM Away",
                    style: textStyle.copyWith(
                      fontSize: 13,
                      color: Color(0xff616161),
                    ),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xff616161),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            ),
                            horizontalSpaceTiny,
                            Text(
                              "${resturant.averageRating}",
                              style: textStyle.copyWith(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      horizontalSpaceTiny,
                      CircleAvatar(
                        backgroundColor: AppColors.secondaryColor,
                        radius: 3,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "${resturant.preparingTime} mins",
                        style: textStyle.copyWith(
                          fontSize: 13,
                          color: Color(0xff616161),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
