import 'package:flutter/material.dart';

class StatusTidakBekerjaForm extends StatefulWidget {
  const StatusTidakBekerjaForm({super.key});

  @override
  _StatusTidakBekerjaFormState createState() => _StatusTidakBekerjaFormState();
}

class _StatusTidakBekerjaFormState extends State<StatusTidakBekerjaForm> {
  String? selectedEtika = "";
  String? selectedKeahlian = "";
  String? selectedBahasaAsing = "";
  String? selectedPenguasaanTI = "";
  String? selectedKomunikasi = "";
  String? selectedKerjasama = "";
  String? selectedPengembanganDiri = "";

  final saranMasukanController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Status Melanjutkan Pendidikan"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(height: 24),
              // Etika - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Etika",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedEtika,
                    onChanged: (value) {
                      setState(() {
                        selectedEtika = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedEtika,
                    onChanged: (value) {
                      setState(() {
                        selectedEtika = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedEtika,
                    onChanged: (value) {
                      setState(() {
                        selectedEtika = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedEtika,
                    onChanged: (value) {
                      setState(() {
                        selectedEtika = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedEtika,
                    onChanged: (value) {
                      setState(() {
                        selectedEtika = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Keahlian - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Keahlian",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedKeahlian,
                    onChanged: (value) {
                      setState(() {
                        selectedKeahlian = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedKeahlian,
                    onChanged: (value) {
                      setState(() {
                        selectedKeahlian = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedKeahlian,
                    onChanged: (value) {
                      setState(() {
                        selectedKeahlian = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedKeahlian,
                    onChanged: (value) {
                      setState(() {
                        selectedKeahlian = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedKeahlian,
                    onChanged: (value) {
                      setState(() {
                        selectedKeahlian = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Bahasa Asing - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Bahasa Asing",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedBahasaAsing,
                    onChanged: (value) {
                      setState(() {
                        selectedBahasaAsing = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedBahasaAsing,
                    onChanged: (value) {
                      setState(() {
                        selectedBahasaAsing = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedBahasaAsing,
                    onChanged: (value) {
                      setState(() {
                        selectedBahasaAsing = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedBahasaAsing,
                    onChanged: (value) {
                      setState(() {
                        selectedBahasaAsing = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedBahasaAsing,
                    onChanged: (value) {
                      setState(() {
                        selectedBahasaAsing = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Penguasaan TI - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Penguasaan TI",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedPenguasaanTI,
                    onChanged: (value) {
                      setState(() {
                        selectedPenguasaanTI = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedPenguasaanTI,
                    onChanged: (value) {
                      setState(() {
                        selectedPenguasaanTI = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedPenguasaanTI,
                    onChanged: (value) {
                      setState(() {
                        selectedPenguasaanTI = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedPenguasaanTI,
                    onChanged: (value) {
                      setState(() {
                        selectedPenguasaanTI = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedPenguasaanTI,
                    onChanged: (value) {
                      setState(() {
                        selectedPenguasaanTI = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Komunikasi - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Komunikasi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedKomunikasi,
                    onChanged: (value) {
                      setState(() {
                        selectedKomunikasi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedKomunikasi,
                    onChanged: (value) {
                      setState(() {
                        selectedKomunikasi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedKomunikasi,
                    onChanged: (value) {
                      setState(() {
                        selectedKomunikasi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedKomunikasi,
                    onChanged: (value) {
                      setState(() {
                        selectedKomunikasi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedKomunikasi,
                    onChanged: (value) {
                      setState(() {
                        selectedKomunikasi = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Kerjasama - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Kerjasama",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedKerjasama,
                    onChanged: (value) {
                      setState(() {
                        selectedKerjasama = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedKerjasama,
                    onChanged: (value) {
                      setState(() {
                        selectedKerjasama = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedKerjasama,
                    onChanged: (value) {
                      setState(() {
                        selectedKerjasama = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedKerjasama,
                    onChanged: (value) {
                      setState(() {
                        selectedKerjasama = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedKerjasama,
                    onChanged: (value) {
                      setState(() {
                        selectedKerjasama = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Pengembangan Diri - Radio Buttons dengan isi sangat tinggi, tinggi, cukup, rendah, sangat rendah
              Text(
                "Pengembangan Diri",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat tinggi"),
                    value: "sangat tinggi",
                    groupValue: selectedPengembanganDiri,
                    onChanged: (value) {
                      setState(() {
                        selectedPengembanganDiri = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedPengembanganDiri,
                    onChanged: (value) {
                      setState(() {
                        selectedPengembanganDiri = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedPengembanganDiri,
                    onChanged: (value) {
                      setState(() {
                        selectedPengembanganDiri = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedPengembanganDiri,
                    onChanged: (value) {
                      setState(() {
                        selectedPengembanganDiri = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Sangat rendah"),
                    value: "sangat rendah",
                    groupValue: selectedPengembanganDiri,
                    onChanged: (value) {
                      setState(() {
                        selectedPengembanganDiri = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Saran dan Masukan - TextField
              Text(
                "Saran dan Masukan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: saranMasukanController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Masukkan Saran dan Masukan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          setState(() {
                            isLoading = true;
                          });
                
                          // Simulate form submission
                          print('Etika: $selectedEtika');
                          print('Keahlian: $selectedKeahlian');
                          print('Bahasa Asing: $selectedBahasaAsing');
                          print('Penguasaan TI: $selectedPenguasaanTI');
                          print('Komunikasi: $selectedKomunikasi');
                          print('Kerjasama: $selectedKerjasama');
                          print('Pengembangan Diri: $selectedPengembanganDiri');
                          print(
                              'Saran dan Masukan: ${saranMasukanController.text}');
                          print('Form submitted successfully!');
                
                          // Simulate delay for loading
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        },
                  child: isLoading ? CircularProgressIndicator() : Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
