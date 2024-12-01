import 'package:tracer/model/alumni_model.dart';
import 'package:tracer/model/fakultas_model.dart';
import 'package:tracer/model/prodi_model.dart';
import 'package:tracer/services/alumni_service.dart';
import 'package:tracer/services/fakultas_service.dart';
import 'package:tracer/services/prodi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tracer/view/alumni/status_bekerja_form.dart';
import 'package:tracer/view/alumni/status_melanjutkanpendidikan_form.dart';
import 'package:tracer/view/alumni/status_tidakbekerja_form.dart';
import 'package:tracer/view/alumni/status_wiraswasta_form.dart';

class AlumniForm extends StatefulWidget {
  const AlumniForm({super.key});

  @override
  State<AlumniForm> createState() => _AlumniFormState();
}

class _AlumniFormState extends State<AlumniForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tahunLulusController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  bool isLoading = false;
  List<FakultasModel> fakultasData = [];
  List<ProdiModel> prodiData = [];
  int? selectedFakultas;
  int? selectedProdi;
  String selectedStatus = "Sedang Bekerja"; // Default status
  DateTime? tahun;
  bool isUpdateState = true;

  Future<void> fetchFakultas(int? id) async {
    try {
      fakultasData = [];
      final response = await FakultasService.fetchFakultas();
      fakultasData = response;
      selectedFakultas = id ?? fakultasData.first.id;
      setState(() {});
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchProdi(int? id) async {
    try {
      prodiData = [];
      final response = await ProdiService.fetchProdi();
      prodiData = response;
      selectedProdi = id ?? prodiData.first.id;
      setState(() {});
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AlumniModel? data =
        ModalRoute.of(context)?.settings.arguments as AlumniModel?;

    if (isUpdateState && data != null) {
      nimController.value = TextEditingValue(text: data.nim);
      nameController.value = TextEditingValue(text: data.name);
      nomorController.value = TextEditingValue(text: data.nomor);
      emailController.value = TextEditingValue(text: data.email);
      alamatController.value = TextEditingValue(text: data.alamat);
      tahunLulusController.value = TextEditingValue(text: data.tahun);
      tahun = DateTime.parse(data.tahun);
      selectedFakultas = data.fakultas.id;
      selectedProdi = data.prodi.id;
      selectedStatus = data.status;
      isUpdateState = false;
      fetchFakultas(selectedFakultas);
      fetchProdi(selectedProdi);
    }

    if (isUpdateState && data == null) {
      isUpdateState = false;
      fetchFakultas(null);
      fetchProdi(null);
    }

    void _submitForm() async {
      setState(() {
        isLoading = true;
      });
      if (data != null) {
        print("update su");
        final AlumniModel dataModel = AlumniModel(
            id: -1,
            nim: nimController.text,
            name: nameController.text,
            alamat: alamatController.text,
            email: emailController.text,
            nomor: nomorController.text,
            fakultas: FakultasModel(id: selectedFakultas!, name: "name"),
            prodi: ProdiModel(
                id: selectedProdi!,
                fakultas: FakultasModel(id: 0, name: "name"),
                name: "name"),
            status: selectedStatus,
            tahun: tahun!.toString());
        await AlumniService.updateAlumni(data.id, dataModel);
      } else {
        final AlumniModel data = AlumniModel(
            id: -1,
            nim: nimController.text,
            name: nameController.text,
            alamat: alamatController.text,
            email: emailController.text,
            nomor: nomorController.text,
            fakultas: FakultasModel(id: selectedFakultas!, name: "name"),
            prodi: ProdiModel(
                id: selectedProdi!,
                fakultas: FakultasModel(id: 0, name: "name"),
                name: "name"),
            status: selectedStatus,
            tahun: tahun!.toString());
        await AlumniService.createAlumni(data);
      }
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data Alumni"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          controller: nimController,
                          keyboardType: TextInputType.number,
                          decoration: customInputDecoration('NIM'),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: customInputDecoration('Nama'),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextField(
                          controller: alamatController,
                          keyboardType: TextInputType.text,
                          decoration: customInputDecoration('Alamat'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: tahunLulusController,
                          canRequestFocus: false,
                          keyboardType: TextInputType.datetime,
                          decoration: customInputDecoration('Tahun Lulus'),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1995),
                              lastDate: DateTime.now(),
                            );
                            if (date != null) {
                              tahun = date;
                              tahunLulusController.text =
                                  "${date.day}/${date.month}/${date.year}";
                            }
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: customInputDecoration('Email'),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextField(
                          controller: nomorController,
                          keyboardType: TextInputType.phone,
                          decoration: customInputDecoration('No. Telepon'),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        fakultasData.isNotEmpty
                            ? DropdownButtonFormField(
                                decoration: customInputDecoration("Fakultas"),
                                value: selectedFakultas,
                                items: fakultasData
                                    .map((fakultas) => DropdownMenuItem(
                                          child: Text(fakultas.name),
                                          value: fakultas.id,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  selectedFakultas = value;
                                  selectedProdi = prodiData
                                      .where(
                                        (prodi) =>
                                            prodi.fakultas.id ==
                                            selectedFakultas,
                                      )
                                      .first
                                      .id;
                                  setState(() {});
                                },
                              )
                            : Container(),
                        SizedBox(
                          height: 24,
                        ),
                        prodiData.isNotEmpty
                            ? DropdownButtonFormField(
                                decoration: customInputDecoration("Prodi"),
                                value: selectedProdi,
                                items: prodiData
                                    .where(
                                      (prodi) =>
                                          prodi.fakultas.id == selectedFakultas,
                                    )
                                    .map((prodi) => DropdownMenuItem(
                                          child: Text(prodi.name),
                                          value: prodi.id,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  selectedProdi = value;
                                  setState(() {});
                                },
                              )
                            : Container(),
                        SizedBox(
                          height: 20,
                        ),
                        // Replace Dropdown with Radio buttons for status
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height:
                                    8), // Memberikan jarak antara label dan radio button
                            RadioListTile<String>(
                              title: Text("Bekerja(full time/part time)"),
                              value: "bekerja",
                              groupValue: selectedStatus,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text("Wiraswasta"),
                              value: "wiraswasta",
                              groupValue: selectedStatus,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text("Melanjutkan Pendidikan"),
                              value: "melanjutkan_pendidikan",
                              groupValue: selectedStatus,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text("Tidak Bekerja"),
                              value: "tidak_bekerja",
                              groupValue: selectedStatus,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value!;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        _submitForm();
                      },
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Save',
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (selectedStatus == 'bekerja') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatusBekerjaForm()));
                    } else if (selectedStatus == 'wiraswasta') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatusWiraswastaForm()));
                    } else if (selectedStatus == 'melanjutkan_pendidikan') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StatusMelanjutkanPendidikanForm()));
                    } else if (selectedStatus == 'tidak_bekerja') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatusTidakBekerjaForm()));
                    }
                  },
                  child: Text("Next")),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      border: OutlineInputBorder(),
      alignLabelWithHint: true,
      hintText: hintText,
      floatingLabelStyle: TextStyle(
        color: Colors.green,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    );
  }
}
