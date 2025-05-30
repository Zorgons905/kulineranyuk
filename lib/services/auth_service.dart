import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signUp(
    String email,
    String password,
    String name,
  ) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    final userId = response.user?.id;

    if (userId != null) {
      await supabase.from('users').insert({
        'id': userId,
        'name': name,
        'email': email,
        'role': 'user',
      });
    }
    return response;
  }

  Future<AuthResponse> signIn(String email, String password) {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() => supabase.auth.signOut();
}
