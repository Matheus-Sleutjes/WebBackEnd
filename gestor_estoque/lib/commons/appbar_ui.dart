import 'package:flutter/material.dart';
import 'package:gestor_estoque/commons/appbar_icons.dart';
import 'package:gestor_estoque/helpers/responsive.dart';
import 'package:gestor_estoque/pages/authentication/login_page.dart';
import 'package:gestor_estoque/services/user_services.dart';

class AppBarUI extends StatelessWidget {
  AppBarUI({super.key, this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          Text(
            'Commodities',
            style: TextStyle(
              fontFamily: 'Aptos',
              fontWeight: FontWeight.w500,
              fontSize: Responsive.isMobile(context) ? 20 : 24,
            ),
          ),
          // SvgPicture.asset(),
          const Spacer(),
          AppBarIcons(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
          AppBarIcons(
            icon: Icons.logout_rounded,
            onTap: () async {
              UserServices userServices = UserServices();

              bool ok = await userServices.logout();
              if (ok) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        PopupMenuButton<Text>(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Primeiro'),
              ),
              const PopupMenuItem(
                child: Text('Segundo'),
              ),
              const PopupMenuItem(
                child: Text('Terceiro'),
              ),
            ];
          },
        )
      ],
    );
  }
}
