import 'package:flutter/material.dart';
import 'package:grigora/ui/shared/app_colors.dart';
import 'package:grigora/ui/shared/shared_styles.dart';
import 'package:grigora/ui/shared/ui_helpers.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Text(
                      "X",
                      style: textStyle.copyWith(
                        color: AppColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              DrawerItem(
                icon: Icons.person_outline_rounded,
                text: "Sign In / Sign Up",
                color: AppColors.secondaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(),
              ),
              DrawerItem(
                icon: Icons.home,
                text: "Home",
                color: Colors.red,
              ),
              DrawerItem(
                icon: Icons.info_outline,
                text: "About Grigora",
              ),
              DrawerItem(
                icon: Icons.help_outline,
                text: "Help & Support",
              ),
              DrawerItem(
                icon: Icons.add_box,
                text: "Partner with us  ",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(),
              ),
              DrawerItem(
                icon: Icons.phone_outlined,
                text: "+234 901 066 9160",
                isSmall: true,
              ),
              DrawerItem(
                icon: Icons.email_outlined,
                text: "hello@grigora.ng",
                isSmall: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key key,
    @required this.icon,
    @required this.text,
    this.isSmall = false,
    this.color,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color != null ? color : AppColors.textColor,
            size: isSmall ? 15 : 25,
          ),
          horizontalSpaceMedium,
          Text(
            text,
            style: textStyle.copyWith(
              color: AppColors.textColor,
              fontSize: isSmall ? 15 : 20,
              fontWeight: isSmall ? FontWeight.normal : FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
