import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/constant/app_style.dart';
import 'package:belajar_flutter/form_input/checkbox.dart';
import 'package:belajar_flutter/form_input/datepicker.dart';
import 'package:belajar_flutter/form_input/switch.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

// enum Menutype { CheckBoxCustom, switchMode, dropdown, date, time }

class _FormInputState extends State<FormInput> {
  // Checkbox
  bool isChecked = false;
  // Switch
  bool isSwitchOn = false;
  // Dark Mode
  bool isDarkMode = false;

  // Dropdown
  String? _selectedItem;

  final List<String> dropdownItem = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];

  // DatePicker
  DateTime? selectedDate;

  // int _selectIndex = 0;
  // static const List<Widget> _screen = [
  //   WidgetCheckBox(),
  //   BirthDatePage(),
  //   ModeGelap(),
  // ];

  // void _selectScreen(int index) {
  //   setState(() {
  //     _selectIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        backgroundColor: isSwitchOn ? AppColor.gray88 : Colors.white,
        appBar: AppBar(
          backgroundColor: isSwitchOn ? AppColor.gray88 : Colors.white,
          centerTitle: true,
          title: Text("Form Input"),
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 40, backgroundColor: Colors.white),
                    Text(
                      "Endah Fitria",
                      style: AppStyle.fontRegular(fontSize: 16),
                    ),
                    Text(
                      "endahfitri@gmail.com",
                      style: AppStyle.fontBold(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.check_box, color: AppColor.gray88),
                title: Text(
                  "Syarat & Ketentuan",
                  style: AppStyle.fontRegular(fontSize: 14),
                ),
                onTap: () {
                  _selectScreen(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.edit, color: AppColor.gray88),
                title: Text(
                  "Mode Gelap",
                  style: AppStyle.fontRegular(fontSize: 14),
                ),
                onTap: () {
                  _selectScreen(1);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month, color: AppColor.gray88),
                title: Text(
                  "Pilih Tanggal Lahir",
                  style: AppStyle.fontRegular(fontSize: 14),
                ),
                onTap: () {
                  _selectScreen(3);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.watch_sharp, color: AppColor.gray88),
                title: Text(
                  "Atur Pengingat",
                  style: AppStyle.fontRegular(fontSize: 14),
                ),
                onTap: () {
                  // _itemTapped(0);
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),

        body:
        // switch(selectedMenu) {
        //   case Menutype.checkbox:
        //   return Column(
        //     children: [
        //     Row(
        //       children: [
        //         Checkbox(
        //           value: isChecked,
        //           onChanged: (value) {
        //             setState(() {
        //               isChecked = value ?? false;
        //             });
        //           },
        //         ),
        //         const Expanded(
        //           child: Text("Saya menyetujui semua persyaratan yang berlaku"),
        //         ),
        //       ],
        //     ),
        //     SizedBox(height: 8),
        //     Text(
        //       isChecked
        //           ? 'Lanjutkan pendaftaran diperbolehkan'
        //           : 'Anda belum bisa melanjutkan',
        //       style: TextStyle(
        //         fontSize: 16,
        //         color: isChecked ? Colors.green : Colors.red,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),]
        //   )
        // }
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text("Saya menyetujui semua persyaratan yang berlaku"),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              isChecked
                  ? 'Lanjutkan pendaftaran diperbolehkan'
                  : 'Anda belum bisa melanjutkan',
              style: TextStyle(
                fontSize: 16,
                color: isChecked ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("Aktifkan Mode Gelap"),
            Row(
              children: [
                Switch(
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                ),

                Text(
                  isSwitchOn ? "Mode Gelap Aktif" : "Mode Terang Aktif",
                  style: AppStyle.fontBold(fontSize: isSwitchOn ? 25 : 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: isSelected,
              hint: Text("Pilih Kategori Produk"),
              items:
                  dropdownItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
            if (isSelected != null)
              Text(
                'Anda memilih kategori: $isSelected',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1940),
                      lastDate: DateTime(2024),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: Text("Pilih Tanggal Lahir"),
                ),
              ],
            ),

            // Row(
            //   children: [
            //     IconButton(
            //       onPressed: () async {
            //         final DateTime? picked = await showDatePicker(
            //           context: context,
            //           firstDate: DateTime(2000),
            //           lastDate: DateTime(2100),
            //         );
            //         if (picked != null) {
            //           setState(() {
            //             selectedDate = picked;
            //           });
            //         }
            //       },
            //       icon: Icon(Icons.date_range),
            //     ),
            //     Text(
            //       selectedDate == null
            //           ? "Pilih Tanggal"
            //           : "${selectedDate!.day.toString()}/${selectedDate!.timeZoneName.toString()}",
            //     ),
            //   ],
            // ),
            // Text(DateTime.now().toString()),
            // Text(DateFormat.MMMMd().format(selectedDate ?? DateTime.now())),
            // Text(AppFormat.createDateFullDay(selectedDate ?? DateTime.now())),
          ],
        ),
      ),
    );
  }
}
