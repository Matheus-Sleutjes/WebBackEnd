import 'package:flutter/material.dart';
import 'package:gestor_estoque/models/commodityHive.dart';
import 'package:gestor_estoque/pages/commodity/commodity_create_page.dart';
import 'package:hive/hive.dart';

class CommodityListHive extends StatefulWidget {
  const CommodityListHive({super.key});

  @override
  _CommodityListHiveState createState() => _CommodityListHiveState();
}

class _CommodityListHiveState extends State<CommodityListHive> {
  late Box<CommodityHive> commodityBox;

  @override
  void initState() {
    super.initState();
    commodityBox = Hive.box<CommodityHive>('commodities');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Commmodities'),
      ),
      body: ListView.builder(
        itemCount: commodityBox.length,
        itemBuilder: (context, index) {
          CommodityHive commodity = commodityBox.getAt(index)!;
          return ListTile(
            title: Text(commodity.name!),
            subtitle: Text(commodity.type!),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Deleta a commodity quando o botão deletar é pressionado.
                commodityBox.deleteAt(index);
                setState(() {});
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the note creation screen.
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CommodityCreatePage()));
        },
      ),
    );
  }
}
