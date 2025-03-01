// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';

// class AddMedicinesPage extends StatefulWidget {
//   const AddMedicinesPage({super.key});

//   @override
//   _AddMedicinesPageState createState() => _AddMedicinesPageState();
// }

// class _AddMedicinesPageState extends State<AddMedicinesPage> {
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final TextEditingController _totalCountController = TextEditingController();
//   double _sliderValue = 1;
//   String _frequency = 'Everyday';
//   String _timesADay = 'Three Time';
//   final List<String> _doses = ['Dose 1', 'Dose 2', 'Dose 3'];
//   String _selectedFoodTiming = 'Before Food';
//   int _selectedCompartment = -1;
//   Color? _selectedColor;

//   void _addMedicine() {
//     final medicine = {
//       'name': _searchController.text,
//       'quantity': _quantityController.text,
//       'totalCount': _totalCountController.text,
//       'frequency': _frequency,
//       'timesADay': _timesADay,
//       'foodTiming': _selectedFoodTiming,
//       'compartment': _selectedCompartment + 1,
//       'color': _selectedColor,
//     };

//     Navigator.pop(context, medicine);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text('Add Medicines'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: const InputDecoration(
//                 hintText: 'Search Medicine Name',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text('Compartment',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(6, (index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedCompartment = index;
//                     });
//                   },
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       border: Border.all(),
//                       borderRadius: BorderRadius.circular(8),
//                       color: _selectedCompartment == index
//                           ? Colors.blue[100]
//                           : Colors.transparent,
//                     ),
//                     child: Center(child: Text('${index + 1}')),
//                   ),
//                 );
//               }),
//             ),
//             const SizedBox(height: 16),
//             const Text('Colour', style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Colors.pink[300],
//                 Colors.purple[300],
//                 Colors.red[300],
//                 Colors.green[300],
//                 Colors.blue[300],
//                 Colors.yellow[300],
//               ].map((color) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedColor = color;
//                     });
//                   },
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: color,
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: _selectedColor == color
//                             ? Colors.blue
//                             : Colors.transparent,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 16),
//             const Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildTypeIcon('Tablet', 'assets/tablet.png'),
//                 _buildTypeIcon('Capsule', 'assets/capsule.png'),
//                 _buildTypeIcon('Cream', 'assets/cream.png'),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text('Quantity',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _quantityController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Take 1/2 Pill',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 _buildQuantityButton('-', () {
//                   int currentQuantity =
//                       int.tryParse(_quantityController.text) ?? 0;
//                   if (currentQuantity > 0) {
//                     _quantityController.text = (currentQuantity - 1).toString();
//                   }
//                 }),
//                 const SizedBox(width: 8),
//                 _buildQuantityButton('+', () {
//                   int currentQuantity =
//                       int.tryParse(_quantityController.text) ?? 0;
//                   _quantityController.text = (currentQuantity + 1).toString();
//                 }),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text('Total Count',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
// TextField(
//   controller: _totalCountController,
//   decoration: const InputDecoration(
//     border: OutlineInputBorder(),
//     hintText: '01',
//   ),
// ),
//             Slider(
//               value: _sliderValue,
//               min: 1,
//               max: 100,
//               divisions: 99,
//               onChanged: (value) {
//                 setState(() {
//                   _sliderValue = value;
//                   _totalCountController.text = value.toInt().toString();
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             const Text('Set Date',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Today'),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('End Date'),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text('Frequency of Days',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             DropdownButtonFormField(
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//               value: _frequency,
//               items: ['Everyday', 'Every 2 Days', 'Every Week']
//                   .map((label) => DropdownMenuItem(
//                         child: Text(label),
//                         value: label,
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _frequency = value!;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             const Text('How many times a Day',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             DropdownButtonFormField(
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//               value: _timesADay,
//               items: ['Three Time', 'Two Time', 'One Time']
//                   .map((label) => DropdownMenuItem(
//                         child: Text(label),
//                         value: label,
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _timesADay = value!;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             const Text('Doses', style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Column(
//               children: _doses.map((dose) {
//                 return _buildDoseButton(dose);
//               }).toList(),
//             ),
//             const SizedBox(height: 16),
//             const Text('Before/After Food',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 _buildFoodButton(
//                     'Before Food', _selectedFoodTiming == 'Before Food'),
//                 const SizedBox(width: 8),
//                 _buildFoodButton(
//                     'After Food', _selectedFoodTiming == 'After Food'),
//                 const SizedBox(width: 8),
//                 _buildFoodButton(
//                     'Before Sleep', _selectedFoodTiming == 'Before Sleep'),
//               ],
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _addMedicine,
//               child: const Text('Add'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// Widget _buildTypeIcon(String label, String imageUrl) {
//   return Column(
//     children: [
//       Image.asset(imageUrl, width: 40, height: 40),
//       const SizedBox(height: 4),
//       Text(label, style: const TextStyle(fontSize: 12)),
//     ],
//   );
// }

// Widget _buildQuantityButton(String label, VoidCallback onPressed) {
//   return GestureDetector(
//     onTap: onPressed,
//     child: Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         border: Border.all(),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Center(child: Text(label)),
//     ),
//   );
// }

//   Widget _buildDoseButton(String label) {
//     return GestureDetector(
//       onTap: () {
//         print('$label tapped');
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 8),
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         decoration: BoxDecoration(
//           border: Border.all(),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(label),
//             const Icon(Icons.chevron_right),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFoodButton(String label, bool selected) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             _selectedFoodTiming = label;
//           });
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           decoration: BoxDecoration(
//             color: selected ? Colors.blue[100] : Colors.transparent,
//             border: Border.all(),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Center(child: Text(label)),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMedicinesPage extends StatefulWidget {
  const AddMedicinesPage({super.key});

  @override
  _AddMedicinesPageState createState() => _AddMedicinesPageState();
}

class _AddMedicinesPageState extends State<AddMedicinesPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController =
      TextEditingController(text: '1');
  double _totalCount = 1;
  String _frequency = 'Everyday';
  String _timesADay = 'Three Times';
  String _selectedFoodTiming = 'Before Food';
  int _selectedCompartment = -1;
  Color? _selectedColor;
  DateTime? _selectedDate;
  final List<String> _doses = ['Dose 1', 'Dose 2', 'Dose 3'];
  String formattedDate = '';
  String _medicineType = 'Tablet';
  final List<String> _medicineTypes = [
    'Tablet',
    'Capsule',
    'Cream',
    'Injection'
  ];
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    // _addMedicine();
  }

  void _addMedicine() {
    final medicineSend = {
      'name': _nameController.text,
      'quantity': _quantityController.text,
      'totalCount': _totalCount.toInt(),
      'frequency': _frequency,
      'timesADay': _timesADay,
      'foodTiming': _selectedFoodTiming,
      'compartment': _selectedCompartment + 1,
      'color': _selectedColor?.value.toRadixString(16),
      'date': formattedDate,
      'medicineType': _medicineType,
    };

    print("Medicine Data: $medicineSend");
    Navigator.pop(context, medicineSend);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Medicines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            _buildTextField('Search Medicine Name', _nameController),
            const SizedBox(height: 16),
            _buildSectionTitle('Compartment'),
            _buildCompartmentSelector(),
            _buildSectionTitle('Colour'),
            _buildColorSelector(),
            _buildSectionTitle('Medicine Type'),
            _buildMedicineTypeSelector(),
            _buildSectionTitle('Quantity'),
            _buildQuantitySelector(),
            _buildSectionTitle('Total Count'),
            _buildSlider(),
            _buildSectionTitle('Set Date'),
            _buildDateButtons(),
            _buildSectionTitle('Frequency of Days'),
            _buildDropdown(['Everyday', 'Every 2 Days', 'Every Week'],
                _frequency, (value) => setState(() => _frequency = value!)),
            _buildSectionTitle('How many times a Day'),
            _buildDropdown(['Three Times', 'Two Times', 'One Time'], _timesADay,
                (value) => setState(() => _timesADay = value!)),
            _buildSectionTitle('Doses'),
            ..._doses.map((dose) => _buildDoseButton(dose)),
            _buildSectionTitle('Before/After Food'),
            _buildFoodTimingButtons(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  _addMedicine();
                } else {
                  print("Medicine name is empty, not sending data.");
                }
              },
              child: Text("Add Medicine"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
        prefixIcon: hint.contains('Search') ? const Icon(Icons.search) : null,
      ),
    );
  }

  Widget _buildCompartmentSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return GestureDetector(
          onTap: () => setState(() => _selectedCompartment = index),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
              color: _selectedCompartment == index
                  ? Colors.blue[100]
                  : Colors.transparent,
            ),
            child: Center(child: Text('${index + 1}')),
          ),
        );
      }),
    );
  }

  Widget _buildColorSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Colors.pink.withOpacity(0.4),
        Colors.purple.withOpacity(0.4),
        Colors.red.withOpacity(0.4),
        Colors.green.withOpacity(0.4),
        Colors.orange.withOpacity(0.4),
        Colors.blue.withOpacity(0.4),
      ].map((color) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    _selectedColor == color ? Colors.blue : Colors.transparent,
                width: 2,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        Expanded(child: _buildTextField('Take 1 Pill', _quantityController)),
        const SizedBox(width: 8),
        _buildQuantityButton('-', () {
          int currentQuantity = int.tryParse(_quantityController.text) ?? 0;
          if (currentQuantity > 0) {
            _quantityController.text = (currentQuantity - 1).toString();
          }
        }),
        const SizedBox(width: 8),
        _buildQuantityButton('+', () {
          int currentQuantity = int.tryParse(_quantityController.text) ?? 0;
          _quantityController.text = (currentQuantity + 1).toString();
        }),
      ],
    );
    // return Row(
    //   children: [
    //     Expanded(child: _buildTextField('Take 1 Pill', _quantityController)),
    //     _buildAdjustButton('-', () {
    //       int current = int.parse(_quantityController.text);
    //       if (current > 1) {
    //         setState(() => _quantityController.text = (current - 1).toString());
    //       }
    //     }),
    //     _buildAdjustButton('+', () {
    //       int current = int.parse(_quantityController.text);
    //       setState(() => _quantityController.text = (current + 1).toString());
    //     }),
    //   ],
    // );
  }

  Widget _buildSlider() {
    return Slider(
      value: _totalCount,
      min: 1,
      max: 100,
      onChanged: (value) => setState(() => _totalCount = value),
    );
  }

  Widget _buildDropdown(
      List<String> items, String value, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }

  Widget _buildDoseButton(String dose) {
    return ListTile(
      title: Text(dose),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildFoodTimingButtons() {
    return Row(
      children: ['Before Food', 'After Food', 'Before Sleep']
          .map((label) => Expanded(child: _buildFoodButton(label)))
          .toList(),
    );
  }

  Widget _buildFoodButton(String label) {
    return ElevatedButton(
      onPressed: () => setState(() => _selectedFoodTiming = label),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedFoodTiming == label
            ? Colors.purple[300]
            : Colors.grey[300],
        foregroundColor:
            _selectedFoodTiming == label ? Colors.white : Colors.black,
      ),
      child: Text(label),
    );
  }

  Widget _buildQuantityButton(String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(label)),
      ),
    );
  }

  Widget _buildDateButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null) {
                setState(() => _selectedDate = picked);
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(_selectedDate == null
                    ? 'Today'
                    : _selectedDate!.toLocal().toString().split(' ')[0]),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null) {
                setState(() => _selectedDate = picked);
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(_selectedDate == null
                    ? 'End Date'
                    : _selectedDate!.toLocal().toString().split(' ')[0]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMedicineTypeSelector() {
    final List<Map<String, String>> medicineTypes = [
      {'label': 'Tablet', 'image': 'assets/tablet.png'},
      {'label': 'Capsule', 'image': 'assets/capsule.png'},
      {'label': 'Cream', 'image': 'assets/cream.png'},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: medicineTypes.length,
        itemBuilder: (context, index) {
          final type = medicineTypes[index];
          final isSelected = _medicineType == type['label'];

          return GestureDetector(
            onTap: () {
              setState(() => _medicineType = type['label']!);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Image.asset(type['image']!, width: 50, height: 50),
                ),
                Text(type['label']!, style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
