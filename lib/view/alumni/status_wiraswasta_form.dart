import 'package:flutter/material.dart';

class StatusWiraswastaForm extends StatefulWidget {
  const StatusWiraswastaForm({super.key});

  @override
  _StatusWiraswastaFormState createState() => _StatusWiraswastaFormState();
}

class _StatusWiraswastaFormState extends State<StatusWiraswastaForm> {
  
  String? selectedPosisi = ""; // Default posisi
  String? selectedTingkatUsaha = ""; // Default tingkat usaha
  String? selectedWaktuTunggu = ""; // Default waktu tunguu
  String? selectedPendapatan = ""; // Default pendapatan
  String? selectedEratHubungan = ""; // Default erat hubungan
  String? selectedTingkatPendidikan = "";
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
        title: Text("Form Status Bekerja"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(height: 24),
              // Status Kerja - Radio Buttons
              Text(
                "Status Kerja",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Founder"),
                    value: "founder",
                    groupValue: selectedPosisi,
                    onChanged: (value) {
                      setState(() {
                        selectedPosisi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Direktur/Manajer"),
                    value: "direktur/manajer",
                    groupValue: selectedPosisi,
                    onChanged: (value) {
                      setState(() {
                        selectedPosisi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Supervisor"),
                    value: "supervisor",
                    groupValue: selectedPosisi,
                    onChanged: (value) {
                      setState(() {
                        selectedPosisi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Staff"),
                    value: "staff",
                    groupValue: selectedPosisi,
                    onChanged: (value) {
                      setState(() {
                        selectedPosisi = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Freelance/Kerja Lepas"),
                    value: "freelance",
                    groupValue: selectedPosisi,
                    onChanged: (value) {
                      setState(() {
                        selectedPosisi = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Tingkat Usaha - Radio Buttons dengan isi Lokal, nasional, multinasional, dan internasional 
              Text(
                "Tingkat Usaha",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Lokal/wilayah/wiraswasta tidak berbadan hukum"),
                    value: "lokal",
                    groupValue: selectedTingkatUsaha,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatUsaha = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Nasional/wiraswasta berbadan hukum"),
                    value: "nasional",
                    groupValue: selectedTingkatUsaha,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatUsaha = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Multinasional"),
                    value: "multinasional",
                    groupValue: selectedTingkatUsaha,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatUsaha = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Internasional"),
                    value: "internasional",
                    groupValue: selectedTingkatUsaha,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatUsaha = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Waktu tunggu - Radio Buttons dengan isi 0-3 bulan, 3-6 bulan, 6-12 bulan, dan lebih dari 12 bulan
              Text(
                "Waktu Tunggu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("0-3 bulan"),
                    value: "0-3 bulan",
                    groupValue: selectedWaktuTunggu,
                    onChanged: (value) {
                      setState(() {
                        selectedWaktuTunggu = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("3-6 bulan"),
                    value: "3-6 bulan",
                    groupValue: selectedWaktuTunggu,
                    onChanged: (value) {
                      setState(() {
                        selectedWaktuTunggu = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("6-12 bulan"),
                    value: "6-12 bulan",
                    groupValue: selectedWaktuTunggu,
                    onChanged: (value) {
                      setState(() {
                        selectedWaktuTunggu = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Lebih dari 12 bulan"),
                    value: "lebih dari 12 bulan",
                    groupValue: selectedWaktuTunggu,
                    onChanged: (value) {
                      setState(() {
                        selectedWaktuTunggu = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Pendapatan - Radio Buttons dengan isi 0-2.150.000, 2.150.001-3.450.000, 3.450.001-9.999.999, dan lebih dari 10.000.000
              Text(
                "Pendapatan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("0-2.150.000"),
                    value: "0-2.150.000",
                    groupValue: selectedPendapatan,
                    onChanged: (value) {
                      setState(() {
                        selectedPendapatan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("2.150.001-3.450.000"),
                    value: "2.150.001-3.450.000",
                    groupValue: selectedPendapatan,
                    onChanged: (value) {
                      setState(() {
                        selectedPendapatan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("3.450.001-9.999.999"),
                    value: "3.450.001-9.999.999",
                    groupValue: selectedPendapatan,
                    onChanged: (value) {
                      setState(() {
                        selectedPendapatan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Lebih dari 10.000.000"),
                    value: "lebih dari 10.000.000",
                    groupValue: selectedPendapatan,
                    onChanged: (value) {
                      setState(() {
                        selectedPendapatan = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Erat Hubungan - Radio Buttons dengan isi Setingkat lebih tinggi, tidak sama sekali, kurang erat, cukup erat, erat 
              Text(
                "Erat Hubungan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Setingkat lebih tinggi"),
                    value: "setingkat lebih tinggi",
                    groupValue: selectedEratHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedEratHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tidak sama sekali"),
                    value: "tidak sama sekali",
                    groupValue: selectedEratHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedEratHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Kurang erat"),
                    value: "kurang erat",
                    groupValue: selectedEratHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedEratHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup erat"),
                    value: "cukup erat",
                    groupValue: selectedEratHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedEratHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Erat"),
                    value: "erat",
                    groupValue: selectedEratHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedEratHubungan = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Tingkat Pendidikan - Radio Buttons dengan isi tidak perlu pendidikan tinggi, setingkat lebih rendah, tingkat yang sama, setingkat lebih tinggi
              Text(
                "Tingkat Pendidikan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Tidak perlu pendidikan tinggi"),
                    value: "tidak perlu pendidikan tinggi",
                    groupValue: selectedTingkatPendidikan,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatPendidikan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Setingkat lebih rendah"),
                    value: "setingkat lebih rendah",
                    groupValue: selectedTingkatPendidikan,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatPendidikan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tingkat yang sama"),
                    value: "tingkat yang sama",
                    groupValue: selectedTingkatPendidikan,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatPendidikan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Setingkat lebih tinggi"),
                    value: "setingkat lebih tinggi",
                    groupValue: selectedTingkatPendidikan,
                    onChanged: (value) {
                      setState(() {
                        selectedTingkatPendidikan = value;
                      });
                    },
                  ),
                ],
              ),
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
                          print('Posisi atau Jabatan: $selectedPosisi');
                          print('Tingkat Usaha: $selectedTingkatUsaha');
                          print('Waktu Tunggu: $selectedWaktuTunggu');
                          print('Pendapatan: $selectedPendapatan');
                          print('Erat Hubungan: $selectedEratHubungan');
                          print('Tingkat Pendidikan: $selectedTingkatPendidikan');
                          print('Etika: $selectedEtika');
                          print('Keahlian: $selectedKeahlian');
                          print('Bahasa Asing: $selectedBahasaAsing');
                          print('Penguasaan TI: $selectedPenguasaanTI');
                          print('Komunikasi: $selectedKomunikasi');
                          print('Kerjasama: $selectedKerjasama');
                          print('Pengembangan Diri: $selectedPengembanganDiri');
                          print('Saran dan Masukan: ${saranMasukanController.text}');
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
