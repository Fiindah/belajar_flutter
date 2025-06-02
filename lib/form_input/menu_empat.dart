import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuEmpat extends StatefulWidget {
  const MenuEmpat({super.key});

  @override
  State<MenuEmpat> createState() => _MenuEmpatState();
}

class _MenuEmpatState extends State<MenuEmpat> {
  DateTime? isSelectDate;

  Future<void> selectedDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isSelectDate ?? DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != isSelectDate) {
      setState(() {
        isSelectDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Pilih Tanggal Lahir',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => selectedDate(context),
                child: const Text('Pilih Tanggal Lahir'),
              ),
              const SizedBox(height: 16),
              Text(
                isSelectDate == null
                    ? 'Belum memilih tanggal'
                    : 'Tanggal Lahir: ${DateFormat('d MMMM y').format(isSelectDate!)}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
