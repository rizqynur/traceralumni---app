import 'package:odoo_rpc/odoo_rpc.dart';

class LoginService {
  final OdooClient _client;

  LoginService(String baseUrl) : _client = OdooClient(baseUrl);

  // Metode authenticate untuk login Odoo
  Future<void> authenticate(String db, String email, String password) async {
    try {
      await _client.authenticate(db, email, password);
      print('Login berhasil!');
    } catch (e) {
      throw Exception('Login gagal: ${e.toString()}');
    }
  }

  OdooClient get client => _client;
}
