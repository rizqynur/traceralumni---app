import 'package:odoo_rpc/odoo_rpc.dart';

class RegisterService {
  final OdooClient _client;

  RegisterService(String baseUrl) : _client = OdooClient(baseUrl);

  Future<void> register(
      String db, String name, String email, String password) async {
    try {
      // Autentikasi dengan akun admin (sesuaikan dengan admin yang sesuai)
      await _client.authenticate(
          'rizqymauliddinah@gmail.com', 'dinaenot123', db);

      // Data pengguna yang akan didaftarkan
      final userData = {
        'name': name,
        'login': email,
        'password': password,
        'active': true, // Pastikan pengguna aktif
      };

      // Membuat pengguna baru menggunakan method 'create'
      final result = await _client.callKw({
        'model': 'res.users',
        'method': 'create',
        'args': [userData],
        'kwargs': {},
      });

      if (result == null) {
        throw Exception('User registration failed on server side');
      }

      print('User created successfully with ID: $result');
    } on OdooException catch (e) {
      // Menangani error spesifik dari Odoo
      throw Exception('OdooException: ${e.message}');
    } on Exception catch (e) {
      // Menangani error umum
      throw Exception('Connection Error: ${e.toString()}');
    }
  }

  OdooClient get client => _client;
}
