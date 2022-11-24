import 'package:flutter/material.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/budgethandler.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  int? _nominalBudget = 0;
  String? _tipeBudget;
  DateTime? _date;
  final _judulController = TextEditingController();
  final _nominalController = TextEditingController();

  void clearText() {
    _judulController.clear();
    _nominalController.clear();

    setState(() {
      _tipeBudget = null;
      _date = null;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: buildDrawer(context),
      body: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                      // Menggunakan padding sebesar 8 pixel
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Contoh: Beli Sate Pacil",
                                labelText: "Judul",

                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _judulController,
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  _judulBudget = value!;
                                  }
                                );
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _judulBudget = value!;
                                  }
                                );
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Input Judul tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10, // <-- SEE HERE
                            ),
                            TextFormField(
                              controller: _nominalController,
                              decoration: InputDecoration(
                                hintText: "Contoh: 2100",
                                labelText: "Nominal",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _nominalBudget = int.tryParse(value!);
                                  }
                                );
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _nominalBudget = int.parse(value!);
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Input Nominal tidak boleh kosong';
                                } else if (_nominalBudget == null) {
                                  return 'Input Nominal harus angka';
                                }
                                return null;
                              },
                            )
                          ]
                        )
                      ),

                  TextButton(
                    child: Text(_date == null
                        ? "Pick a date"
                        : "${_date!.day}/${_date!.month}/${_date!.year}"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        //tambahkan setState dan panggil variabel _dateTime.
                        setState(() {
                          _date = date;
                          }
                        );
                      }
                      );
                    },
                  ),

                  SizedBox(
                    width: 120,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        // isCollapsed: true,
                        enabledBorder: InputBorder.none,
                      ),
                      hint: const Text("Pilih Jenis"),
                      value: _tipeBudget,
                      validator: (value) =>
                          value == null ? "Pilih Jenis" : null,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Pengeluaran',
                          child: Text('Pengeluaran'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Pemasukan',
                          child: Text('Pemasukan'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _tipeBudget = value!;
                        });
                      },
                    ), 
                  ),

                  // kebawahin button
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _date != null) {
                          ListBudget.data.add(Budget(_judulBudget,
                              _nominalBudget, _tipeBudget!, _date!));

                          clearText();
                        }
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            )
          ),
    );
  }
}
