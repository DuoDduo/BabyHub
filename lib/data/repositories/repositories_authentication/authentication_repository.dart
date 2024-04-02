import 'package:babyhub/data/repositories/user/user_repository.dart';
import 'package:babyhub/features/authentication/screens/onboarding/login/login.dart';
import 'package:babyhub/features/authentication/screens/onboarding/onboarding.dart';
import 'package:babyhub/features/authentication/screens/onboarding/signup/verify_email.dart';
import 'package:babyhub/navigation_menu.dart';
import 'package:babyhub/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:babyhub/utils/exceptions/firebase_exceptions.dart';
import 'package:babyhub/utils/exceptions/format_exceptions.dart';
import 'package:babyhub/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    // Remove the splash screen
    SplashScreen.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print(" something went wrong: $e");
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw " Something went wrong, Please try again";
    }
  }
}

class SplashScreen {
  static void remove() {
    Get.back(); // This will remove the current screen (splash screen) from the navigation stack.
  }
}
