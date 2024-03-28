import 'package:flutter/material.dart';
import 'package:gestor_estoque/models/commodity.dart';
import 'package:gestor_estoque/services/commodity_services.dart';

class CommodityEditPage extends StatelessWidget {
  CommodityEditPage({super.key, this.commodity});
  final Commodity? commodity;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = commodity!.name!;
    _typeController.text = commodity!.type!;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Text(
              'Editando Commodity',
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'id: ${commodity!.id}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 17, 1),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                label: Text('Nome:'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2),
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 17, 1),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(
                label: Text('Tipo:'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2),
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 17, 1),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancelar')),
                OutlinedButton.icon(
                    onPressed: () {
                      commodity!.name = _nameController.text;
                      commodity!.type = _typeController.text;
                      CommodityServices commodityServices = CommodityServices();
                      commodityServices
                          .updateCommodity(commodity!)
                          .then((value) => Navigator.pop(context));
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Atualizar')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
