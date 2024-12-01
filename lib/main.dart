import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:tracer/view/alumni/alumni_form.dart';
import 'package:tracer/view/fakultas/fakultas_form.dart';
import 'package:tracer/view/home.dart';
import 'package:tracer/view/login_google_page.dart';
import 'package:tracer/view/login_page.dart';
import 'package:tracer/view/prodi/prodi_form.dart';
import 'package:tracer/view/register_page.dart';

final client = OdooClient('http://192.168.1.104:10017');
void main() async {
  try {
    await client.authenticate(
        "TRACERALUMNI", "rizqymauliddinah@gmail.com", "dinaenot123");
    final res = await client.callRPC('/web/session/modules', 'call', {});
    print('Installed modules: \n' + res.toString());
  } on OdooException catch (e) {
    print(e);
    client.close();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracer Alumni',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/fakultas-form': (context) => FormFakultas(),
        '/prodi-form': (context) => FormProdi(),
        '/alumni-form': (context) => AlumniForm(),
        '/login-google': (context) => LoginGooglePage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
