import 'package:tracer/services/alumni_service.dart';
import 'package:tracer/services/fakultas_service.dart';
import 'package:tracer/services/prodi_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Menyimpan indeks tab aktif

  // List widget untuk BottomNavigationBar
  final List<Widget> _pages = [
    _FakultasPage(),
    _ProdiPage(),
    _AlumniPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracer Alumni"),
        // create style for appBar
        backgroundColor: Colors.blue.shade300,

        // add button for logout and function for logout
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Menampilkan halaman berdasarkan indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Fakultas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Prodi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Alumni",
          ),
        ],
      ),
    );
  }
}

// Halaman Fakultas
class _FakultasPage extends StatelessWidget {
  const _FakultasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              "Data Fakultas",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 14),
            FutureBuilder(
              future: FakultasService.fetchFakultas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index].name}"),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        await Navigator.pushNamed(
                                            context, "/fakultas-form",
                                            arguments: snapshot.data![index]);
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.edit),
                                      title: Text("Edit"),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        await FakultasService.deleteFakultas(
                                            snapshot.data![index].id);
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.delete),
                                      title: Text("Delete"),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.more_horiz),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/fakultas-form");
        },
        child: Icon(Icons.add),
        tooltip: "Tambah Data Fakultas",
      ),
    );
  }
}

// Halaman Prodi
class _ProdiPage extends StatelessWidget {
  const _ProdiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              "Data Prodi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 14),
            FutureBuilder(
              future: ProdiService.fetchProdi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index].name}"),
                      subtitle: Text("${snapshot.data![index].fakultas.name}"),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        await Navigator.pushNamed(
                                            context, "/prodi-form",
                                            arguments: snapshot.data![index]);
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.edit),
                                      title: Text("Edit"),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        await ProdiService.deleteProdi(
                                            snapshot.data![index].id);
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.delete),
                                      title: Text("Delete"),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.more_horiz),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/prodi-form");
        },
        child: Icon(Icons.add),
        tooltip: "Tambah Data Prodi",
      ),
    );
  }
}

// Halaman Alumni
class _AlumniPage extends StatelessWidget {
  const _AlumniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Data Alumni",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 14),
              FutureBuilder(
                future: AlumniService.fetchAlumni(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  return ListView.separated(
                    itemCount: snapshot.data!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${snapshot.data![index].name}"),
                        subtitle: Text("${snapshot.data![index].nim}"),
                        trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      ListTile(
                                        onTap: () async {
                                          await Navigator.pushNamed(
                                              context, "/alumni-form",
                                              arguments: snapshot.data![index]);
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(Icons.edit),
                                        title: Text("Edit"),
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          await AlumniService.deleteAlumni(
                                              snapshot.data![index].id);
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(Icons.delete),
                                        title: Text("Delete"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.more_horiz),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/alumni-form");
        },
        child: Icon(Icons.add),
        tooltip: "Tambah Data Alumni",
      ),
    );
  }
}
