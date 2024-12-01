import 'package:tracer/model/user_model.dart';
import 'package:tracer/main.dart';

class LoginGoogleService {
  // Metode untuk memeriksa apakah email sudah ada
  static Future<bool> checkEmailExists(String email) async {
    final response = await client.callKw({
      'model': 'traceralumni.user',
      'method': 'search_count',
      'args': [
        [['email', '=', email]], // Pencarian berdasarkan email
      ],
      'kwargs': {},
    });

    return response > 0; // Jika ada hasil, berarti email sudah ada
  }

  // Metode untuk menambahkan pengguna baru
  static Future<void> createUser(String email) async {
    await client.callKw({
      'model': 'traceralumni.user',
      'method': 'create',
      'args': [
        {
          'email': email,
          'role': 'User',
        },
      ],
      'kwargs': {},
    });
  }
}

