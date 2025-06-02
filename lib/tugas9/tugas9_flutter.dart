import 'package:belajar_flutter/tugas9/tugas9_list.dart';
import 'package:belajar_flutter/tugas9/tugas9_map.dart';
import 'package:belajar_flutter/tugas9/tugas9_model.dart';
import 'package:flutter/material.dart';

class TugasSembilan extends StatelessWidget {
  const TugasSembilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas Sembilan"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlatDapur()),
                  );
                },
                child: Text("List"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KategoriAlat()),
              );
            },
            child: Text("Map"),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ListInMapWidget()),
          //     );
          //   },
          //   child: Text("List and Map"),
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Model9()),
              );
            },
            child: Text("Model"),
          ),
        ],
      ),
    );
  }
}
