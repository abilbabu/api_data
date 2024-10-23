import 'package:api_data/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomescreenController>().getFact();
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<HomescreenController>(
            builder: (context, providerObj, child) => providerObj.isLoading
                ? CircularProgressIndicator()
                : Text(
                    context.watch<HomescreenController>().Catfact ?? "No Data"),
          ),
        ),
      ),
    );
  }
}
