import 'package:flutter/material.dart';

class StatusBekerjaForm extends StatefulWidget {
  const StatusBekerjaForm({super.key});

  @override
  _StatusBekerjaFormState createState() => _StatusBekerjaFormState();
}

class _StatusBekerjaFormState extends State<StatusBekerjaForm> {
  TextEditingController perusahaanController = TextEditingController();
  TextEditingController bidangController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tahunMasukController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController saranMasukanController = TextEditingController();
  
  String? selectedStatus = "full_time"; // Default status
  String? selectedGaji = "0 - 5 juta"; // Default Gaji Range
  String? selectedHubungan = "erat"; // Default hubungan
  String? selectedKepuasan = "tinggi"; // Default Kepuasan
  String? selectedPeluangKarir = "tinggi"; // Default Peluang Karir
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
              // Nama Perusahaan
              Text(
                "Instansi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: perusahaanController,
                decoration: InputDecoration(
                  labelText: 'Nama Perusahaan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat Perusahaan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: bidangController,
                decoration: InputDecoration(
                  labelText: 'Bidang Perusahaan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: jabatanController,
                decoration: InputDecoration(
                  labelText: 'Jabatan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Nomor Telepon
              TextField(
                controller: nomorTeleponController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Tahun Masuk Perusahaan
              TextField(
                controller: tahunMasukController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Tahun Masuk Perusahaan',
                  border: OutlineInputBorder(),
                ),
              ),
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
                    title: Text("Full Time"),
                    value: "full_time",
                    groupValue: selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Part Time"),
                    value: "part_time",
                    groupValue: selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Freelance"),
                    value: "freelance",
                    groupValue: selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Internship"),
                    value: "internship",
                    groupValue: selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Gaji - Radio Buttons
              Text(
                "Gaji",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("0 - 5 juta"),
                    value: "0 - 5 juta",
                    groupValue: selectedGaji,
                    onChanged: (value) {
                      setState(() {
                        selectedGaji = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("5 - 10 juta"),
                    value: "5 - 10 juta",
                    groupValue: selectedGaji,
                    onChanged: (value) {
                      setState(() {
                        selectedGaji = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("10 - 15 juta"),
                    value: "10 - 15 juta",
                    groupValue: selectedGaji,
                    onChanged: (value) {
                      setState(() {
                        selectedGaji = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Lebih dari 15 juta"),
                    value: "lebih dari 15 juta",
                    groupValue: selectedGaji,
                    onChanged: (value) {
                      setState(() {
                        selectedGaji = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Hubungan dengan Pekerjaan - Radio Buttons
              Text(
                "Hubungan dengan Pekerjaan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat Erat"),
                    value: "sangat_erat",
                    groupValue: selectedHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Erat"),
                    value: "erat",
                    groupValue: selectedHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup Erat"),
                    value: "cukup_erat",
                    groupValue: selectedHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedHubungan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Kurang Erat"),
                    value: "kurang_erat",
                    groupValue: selectedHubungan,
                    onChanged: (value) {
                      setState(() {
                        selectedHubungan = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Kepuasan Kerja - Radio Buttons
              Text(
                "Kepuasan Kerja",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat Tinggi"),
                    value: "sangat_tinggi",
                    groupValue: selectedKepuasan,
                    onChanged: (value) {
                      setState(() {
                        selectedKepuasan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedKepuasan,
                    onChanged: (value) {
                      setState(() {
                        selectedKepuasan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedKepuasan,
                    onChanged: (value) {
                      setState(() {
                        selectedKepuasan = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedKepuasan,
                    onChanged: (value) {
                      setState(() {
                        selectedKepuasan = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Peluang Karir - Radio Buttons
              Text(
                "Peluang Karir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text("Sangat Tinggi"),
                    value: "sangat_tinggi",
                    groupValue: selectedPeluangKarir,
                    onChanged: (value) {
                      setState(() {
                        selectedPeluangKarir = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Tinggi"),
                    value: "tinggi",
                    groupValue: selectedPeluangKarir,
                    onChanged: (value) {
                      setState(() {
                        selectedPeluangKarir = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Cukup"),
                    value: "cukup",
                    groupValue: selectedPeluangKarir,
                    onChanged: (value) {
                      setState(() {
                        selectedPeluangKarir = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Rendah"),
                    value: "rendah",
                    groupValue: selectedPeluangKarir,
                    onChanged: (value) {
                      setState(() {
                        selectedPeluangKarir = value;
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
                          print('Perusahaan: ${perusahaanController.text}');
                          print('Alamat: ${alamatController.text}');
                          print('Bidang: ${bidangController.text}');
                          print('Jabatan: ${jabatanController.text}');
                          print('Nomor Telepon: ${nomorTeleponController.text}');
                          print('Email: ${emailController.text}');
                          print('Tahun Masuk: ${tahunMasukController.text}');
                          print('Status: $selectedStatus');
                          print('Gaji: $selectedGaji');
                          print('Hubungan: $selectedHubungan');
                          print('Kepuasan: $selectedKepuasan');
                          print('Peluang Karir: $selectedPeluangKarir');
                          print('Saran: ${saranMasukanController.text}');
                
                          // Simulate delay for loading
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}