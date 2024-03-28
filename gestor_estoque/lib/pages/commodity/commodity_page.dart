import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estoque/models/commodity.dart';
import 'package:gestor_estoque/pages/commodity/commodity_edit_page.dart';
import 'package:gestor_estoque/services/commodity_services.dart';

class CommodityPage extends StatelessWidget {
  CommodityPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final Commodity commodity = Commodity();
  final CommodityServices commodityServices = CommodityServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Commodity'),
      ),
      body: StreamBuilder(
          stream: commodityServices.getCommodities(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot ds = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 10,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text('Nome: ${ds.id}'),
                                Text(
                                  'Nome: ${ds['name']}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 7, 48, 8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Tipo: ${ds['type']}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 7, 48, 8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    commodityServices.deleteCommodity(ds.id);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    commodity.id = ds.id;
                                    commodity.name = ds['name'];
                                    commodity.type = ds['type'];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommodityEditPage(
                                          commodity: commodity,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            } else {
              return Container();
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openDialog(context);
        },
        child: const Text(
          '+',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar Commodity'),
        content: SizedBox(
          height: 150,
          width: 250,
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Nome'),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 17, 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _typeController,
                decoration: const InputDecoration(hintText: 'Tipo'),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 17, 1),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 17, 1),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              commodity.name = _nameController.text;
              commodity.type = _typeController.text;
              commodityServices.addCommodity(commodity);
              _nameController.clear();
              _typeController.clear();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Salvar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 17, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
