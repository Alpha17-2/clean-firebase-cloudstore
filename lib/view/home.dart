import 'package:firebase_dev_demo/models/api_res_model.dart';
import 'package:firebase_dev_demo/services/api/api_services.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Firebase Demo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final snack = ScaffoldMessenger.of(context);
          ResponseModel responseModel =
              await login(email: "email25@gmail.com", password: "123456");
          if (responseModel.data != null) {
            //* Successfully created account //
            debugPrint(responseModel.data.toString());
          } else {
            snack.showSnackBar(
                SnackBar(content: Text(responseModel.error.toString())));
          }
        },
      ),
    );
  }
}
