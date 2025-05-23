import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:landmark_assignment/core/firebase/firebase_auth_type.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/auth/models/user_model.dart';

Future<void> fireBaseAuthCall<T>({
  FirebaseAuthType? firebaseAuthType,
  String? email,
  String? password,
  required Function(int statusCode, String errorDesc) failed,
  required Function(dynamic response) success,
}) async {
  try {
    switch (firebaseAuthType) {
      case FirebaseAuthType.login:
        try {
          final userCredential = await _auth.signInWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          if (userCredential.user != null) {
            success(
              UserModel(
                uid: userCredential.user!.uid,
                email: userCredential.user!.email ?? '',
                displayName: userCredential.user!.displayName,
              ),
            );
          } else {
            failed(-1, 'Failed to login. User not found.');
          }
        } on FirebaseAuthException catch (e) {
          failed(-1, _handleAuthError(e.code));
        } catch (e) {
          failed(-1, Constants.noNetworkErrMsg);
        }
        break;
      case FirebaseAuthType.signIN:
        try {
          final userCredential = await _auth.createUserWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          if (userCredential.user != null) {
            success(
              UserModel(
                uid: userCredential.user!.uid,
                email: userCredential.user!.email ?? '',
                displayName: userCredential.user!.displayName,
              ),
            );
          } else {
            failed(-1, 'Failed to register user.');
          }
        } on FirebaseAuthException catch (e) {
          failed(-1, _handleAuthError(e.code));
        } catch (e) {
          failed(-1, Constants.noNetworkErrMsg);
        }
        break;
      case FirebaseAuthType.registerWithMail: // THIS IS YOUR "SIGN IN WITH GOOGLE" CASE
        try {
          UserCredential userCredential;

          if (kIsWeb) {
            final googleProvider = GoogleAuthProvider();
            userCredential = await FirebaseAuth.instance.signInWithPopup(
              googleProvider,
            );
          } else {
            final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
            if (googleUser == null) {
              failed(-1, 'Google sign-in cancelled by user.');
              return;
            }
            final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
            final AuthCredential credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            userCredential = await _auth.signInWithCredential(credential);
          }
          final user = userCredential.user;
          if (user != null) {
            success(
              UserModel(
                uid: user.uid,
                email: user.email ?? '',
                displayName: user.displayName,
              ),
            );
          } else {
            failed(-1, 'Google sign-in failed. User not found.');
          }
        } on FirebaseAuthException catch (e) {
          failed(-1, _handleAuthError(e.code));
        } on Exception catch (e) {
          if (e.toString().contains('sign_in_failed') || e.toString().contains('PlatformException')) {
            failed(-1, 'Google sign-in failed. Please try again or check device settings.');
          } else {
            failed(-1, 'An unexpected error occurred during Google Sign-In: $e');
          }
        }
        break;
      case FirebaseAuthType.logOut:
        try {
          await _auth.signOut();
          success("");
        } on FirebaseAuthException catch (e) {
          failed(-1, _handleAuthError(e.code));
        } catch (e) {
          failed(-1, Constants.noNetworkErrMsg);
        }
        break;
      default:
        try {
          final userCredential = await _auth.signInWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          if (userCredential.user != null) {
            success(
              UserModel(
                uid: userCredential.user!.uid,
                email: userCredential.user!.email ?? '',
                displayName: userCredential.user!.displayName,
              ),
            );
          } else {
            failed(-1, 'Failed to login. User not found.');
          }
        } on FirebaseAuthException catch (e) {
          failed(-1, _handleAuthError(e.code));
        } catch (e) {
          failed(-1, Constants.noNetworkErrMsg);
        }
    }
  } catch (e) {
    print("catch  ${e.toString()}");
    failed(-1, e.toString());
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
String _handleAuthError(String code) {
  print("_handleAuthError  ${code.toString()}");
  switch (code) {
    case 'invalid-email':
      return 'Invalid email address.';
    case 'user-disabled':
      return 'This account has been disabled.';
    case 'user-not-found':
      return 'No user found with this email.';
    case 'wrong-password':
      return 'Incorrect password.';
    case 'email-already-in-use':
      return 'The email address is already in use by another account.';
    case 'weak-password':
      return 'The password is too weak.';
    case 'operation-not-allowed':
      return 'This operation is not allowed.'; // This is the error you were getting for Google Sign-in *before* enabling it in Firebase.
    case 'account-exists-with-different-credential':
      return 'An account already exists with a different credential.';
    case 'invalid-credential':
      return 'The credential is malformed or has expired.';
    case 'auth/network-request-failed': // Common error for network issues
      return 'Network error. Please check your internet connection.';
    case 'auth/popup-blocked-by-browser': // Specific to web
      return 'Pop-up blocked by browser. Please allow pop-ups for this site.';
    case 'auth/cancelled-by-user': // Specific to web and sometimes mobile
      return 'Sign-in process cancelled.';
  // Add more specific error codes if you encounter them
    default:
      return 'An unknown error occurred.';
  }
}

