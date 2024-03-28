import 'package:flutter/material.dart';
import 'package:gestor_estoque/models/commodityHive.dart';
import 'package:hive/hive.dart';

class CommodityCreatePage extends StatefulWidget {
  const CommodityCreatePage({super.key});

  @override
  _CommodityCreatePageState createState() => _CommodityCreatePageState();
}

class _CommodityCreatePageState extends State<CommodityCreatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  late Box<CommodityHive> commodityBox;

  @override
  void initState() {
    super.initState();
    commodityBox = Hive.box<CommodityHive>('notes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Commodity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Create a new note and add it to the Hive box.
                final newCommodity = CommodityHive(
                  name: _nameController.text,
                  type: _typeController.text,
                );
                commodityBox.add(newCommodity);

                // Navigate back to the note list.
                Navigator.pop(context);
              },
              child: const Text('Salvar Commodity'),
            ),
          ],
        ),
      ),
    );
  }
}
