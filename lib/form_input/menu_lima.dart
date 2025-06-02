import 'package:flutter/material.dart';

class MenuLima extends StatefulWidget {
  const MenuLima({super.key});

  @override
  State<MenuLima> createState() => _MenuLimaState();
}

class _MenuLimaState extends State<MenuLima> {
  TimeOfDay? isSelectTime;

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isSelectTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != isSelectTime) {
      setState(() {
        isSelectTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Atur Pengingat',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => selectTime(context),
                child: const Text('Pilih Waktu Pengingat'),
              ),
              const SizedBox(height: 20),
              Text(
                isSelectTime == null
                    ? 'Belum mengatur waktu'
                    : 'Pengingat diatur pukul: ${isSelectTime!.format(context)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
