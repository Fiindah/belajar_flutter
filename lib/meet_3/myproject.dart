import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [buildStack(), buildStack()]),
            ),
            Text("adasfaf"),
            SizedBox(height: 20),
            buildStack(),
            
          ],
        ),
      ),
    );
  }
}

Center buildStack() {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow,
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
        Column(children: [Text("data1"), Text("data2"), Text("data3")]),
      ],
    ),
  );
}
