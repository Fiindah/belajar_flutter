import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Profil Saya"),
      ),

      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama: Andi Rahmat",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Row(children: [
            Icon(Icons.location_on),
            Text(
            "Jakarta",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
            ],),
          
          Text(
            "Seorang pelajar yang sedang belajar Flutter",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
}
}