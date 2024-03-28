
import 'package:flutter/material.dart';
import 'package:gestor_estoque/helpers/responsive.dart';
import 'package:gestor_estoque/pages/commodity/commodity_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(255, 7, 48, 8),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.15,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Administração",
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 80,
                    width: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/alberto - münch.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: Responsive.isMobile(context)
                ? height * .5
                : Responsive.isTablet(context)
                    ? height * .6
                    : height * .8,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                // bottomLeft: Radius.circular(25),
                // bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio:
                    Responsive.isMobile(context) ? 1 : (width / height),
                padding: EdgeInsets.only(
                  top: Responsive.isMobile(context)
                      ? 15
                      : Responsive.isTablet(context)
                          ? 20
                          : 30,
                  right: Responsive.isMobile(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 100
                          : 200,
                  left: Responsive.isMobile(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 20
                          : 30,
                ),
                mainAxisSpacing: Responsive.isMobile(context)
                    ? 10
                    : Responsive.isTablet(context)
                        ? 12
                        : 15,
                crossAxisSpacing: Responsive.isMobile(context)
                    ? 10
                    : Responsive.isTablet(context)
                        ? 12
                        : 15,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommodityPage(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/soja.png',
                              height: Responsive.isMobile(context)
                                  ? 120
                                  : Responsive.isTablet(context)
                                      ? 125
                                      : 400,
                              width: Responsive.isMobile(context)
                                  ? 120
                                  : Responsive.isTablet(context)
                                      ? 125
                                      : 400,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            'Commodity',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 7, 48, 8),
                              fontSize: Responsive.isMobile(context)
                                  ? 14
                                  : Responsive.isTablet(context)
                                      ? 16
                                      : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/cotacao.jpg',
                            height: Responsive.isMobile(context)
                                ? 120
                                : Responsive.isTablet(context)
                                    ? 125
                                    : 400,
                            width: Responsive.isMobile(context)
                                ? 120
                                : Responsive.isTablet(context)
                                    ? 125
                                    : 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Cotação',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 7, 48, 8),
                            fontSize: Responsive.isMobile(context)
                                ? 14
                                : Responsive.isTablet(context)
                                    ? 16
                                    : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/regioes.png',
                            height: Responsive.isMobile(context)
                                ? 120
                                : Responsive.isTablet(context)
                                    ? 125
                                    : 400,
                            width: Responsive.isMobile(context)
                                ? 120
                                : Responsive.isTablet(context)
                                    ? 125
                                    : 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Regiões',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 7, 48, 8),
                            fontSize: Responsive.isMobile(context)
                                ? 14
                                : Responsive.isTablet(context)
                                    ? 16
                                    : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/cotacao2.png',
                            height: Responsive.isMobile(context)
                                ? 120
                                : Responsive.isTablet(context)
                                    ? 120
                                    : 400,
                            width: Responsive.isMobile(context)
                                ? 120
                                : Responsive.isTablet(context)
                                    ? 120
                                    : 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Grupos',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 7, 48, 8),
                            fontSize: Responsive.isMobile(context)
                                ? 14
                                : Responsive.isTablet(context)
                                    ? 16
                                    : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
