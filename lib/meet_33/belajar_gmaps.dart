// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class BelajarGmaps extends StatefulWidget {
//   const BelajarGmaps({super.key});

//   @override
//   State<BelajarGmaps> createState() => _BelajarGmapsState();

  
// }

// class _BelajarGmapsState extends State<BelajarGmaps> {
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       appBar: AppBar(title: Text("Gmaps")),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _currentPosition,
//               zoom: 14,
//             ),
//             onMapCreated: (controller) {
//               mapController = controller;
//             },
//             markers: _marker != null ? {_marker!} : {},
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//           ),
//           Positioned(
//             top: 16,
//             left: 16,
//             right: 16,
//             child: Card(
//               color: Colors.white,
//               elevation: 4,
//               child: Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text(_currentAddress, style: TextStyle(fontSize: 14)),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _getCurrentLocation,
//         tooltip: "Refresh Lokasi",
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
