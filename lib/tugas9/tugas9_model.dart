import 'package:belajar_flutter/constant/app_image.dart';
import 'package:belajar_flutter/tugas9/modelA/product_model.dart';
import 'package:flutter/material.dart';

class Model9 extends StatefulWidget {
  const Model9({super.key});

  @override
  State<Model9> createState() => _Model9State();
}

class _Model9State extends State<Model9> {
  final List<ProductModel> dataProduct = [
    ProductModel(
      id: "1",
      productName: "Wajan",
      productPrice: "35000",
      productImage: AppImage.wajan,
    ),
    ProductModel(
      id: "2",
      productName: "Panci",
      productPrice: "45000",
      productImage: AppImage.panci,
    ),
    ProductModel(
      id: "3",
      productName: "Kompor",
      productPrice: "150000",
      productImage: AppImage.kompor,
    ),
    ProductModel(
      id: "4",
      productName: "Centong",
      productPrice: "15000",
      productImage: AppImage.centong,
    ),
    ProductModel(
      id: "5",
      productName: "Piring",
      productPrice: "150000",
      productImage: AppImage.piring,
    ),
    ProductModel(
      id: "6",
      productName: "Sendok",
      productPrice: "30000",
      productImage: AppImage.sendok,
    ),
    ProductModel(
      id: "7",
      productName: "Garpu",
      productPrice: "30000",
      productImage: AppImage.garpu,
    ),
    ProductModel(
      id: "8",
      productName: "Pisau",
      productPrice: "150000",
      productImage: AppImage.pisau,
    ),
    ProductModel(
      id: "9",
      productName: "Talenan",
      productPrice: "50000",
      productImage: AppImage.talenan,
    ),
    ProductModel(
      id: "10",
      productName: "Serbet",
      productPrice: "15000",
      productImage: AppImage.serbet,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Peralatan Dapur")),
      body: ListView.builder(
        itemCount: dataProduct.length,
        itemBuilder: (BuildContext context, int index) {
          final product = dataProduct[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(product.productImage),
            ),
            title: Text(product.productName),
            subtitle: Text("Rp. ${product.productPrice}"),
          );
        },
      ),
    );
  }
}
