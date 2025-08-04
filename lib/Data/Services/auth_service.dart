import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'realName': name.trim(),
          'email': email.trim(),
          'uid': user.uid,
          'createdAt': Timestamp.now(),
          'username': '',
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'كلمة المرور التي أدخلتها ضعيفة جدًا.';
      } else if (e.code == 'email-already-in-use') {
        throw 'هذا البريد الإلكتروني مسجل بالفعل. حاول تسجيل الدخول.';
      } else if (e.code == 'invalid-email') {
        throw 'البريد الإلكتروني الذي أدخلته غير صالح.';
      } else {
        throw 'حدث خطأ أثناء التسجيل. يرجى المحاولة مرة أخرى.';
      }
    } catch (e) {
      throw 'حدث خطأ غير متوقع. يرجى التحقق من اتصالك بالإنترنت.';
    }
  }

  Future<void> updateUsername(String username) async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await currentUser.updateDisplayName(username.trim());
        await _firestore.collection('users').doc(currentUser.uid).update({
          'username': username.trim(),
        });
      }
    } catch (e) {
      throw 'Failed to update username. Please try again.';
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
      } else if (e.code == 'user-disabled') {
        throw 'تم تعطيل هذا الحساب.';
      } else {
        throw 'حدث خطأ أثناء تسجيل الدخول. يرجى المحاولة مرة أخرى.';
      }
    } catch (e) {
      throw 'حدث خطأ غير متوقع. يرجى التحقق من اتصالك بالإنترنت.';
    }
  }
}