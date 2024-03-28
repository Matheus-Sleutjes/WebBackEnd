
import 'package:flutter/material.dart';
import 'package:gestor_estoque/commons/appbar_ui.dart';
import 'package:gestor_estoque/helpers/responsive.dart';
import 'package:gestor_estoque/pages/admin/admin_page.dart';
import 'package:gestor_estoque/pages/home/home_page.dart';
import 'package:gestor_estoque/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Responsive.isMobile(context) ? 50 : 60,
              Responsive.isMobile(context) ? 50 : 60),
          child: AppBarUI()),
      body: [
        const HomePage(), //representa a posição zero da lista
        const AdminPage(), //representa a posição um da lista
        const ProfilePage(), //representa a posição dois da lista
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_applications),
            label: 'Administração',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_4_rounded),
            label: 'Perfil de Usuário',
          ),
        ],
      ),
    );
  }
}
