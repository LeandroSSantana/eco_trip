import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? errorMessage; // Adicione esta linha para armazenar a mensagem de erro

  Future<String?> cadastrarUsuario({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(fullName);
      errorMessage = null; // Limpa a mensagem de erro se não houver erro
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        errorMessage = 'email já cadastrado!';
      } else {
        errorMessage = 'error desconhecido!';
      }
      return errorMessage;
    }
  }

  Future<String?> logarUsuario({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      errorMessage = null;
      return null;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.code}, ${e.message}');

      if (e.code == "invalid-login-credentials") {
        errorMessage = 'E-mail ou senha incorretos';
      } else {
        errorMessage = 'Erro desconhecido ao fazer login';
      }
      return errorMessage;
    }
  }
}
