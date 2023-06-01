import 'dart:developer';

import 'package:chat/common/entities/user.dart';
import 'package:chat/common/routes/routes.dart';
import 'package:chat/common/store/user.dart';
import 'package:chat/common/widgets/widgets.dart';
import 'package:chat/pages/signIn/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SignInController extends GetxController {
  final state = SignInState();
  SignInController();
  final db = FirebaseFirestore.instance;

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      var user = await _googleSignIn.signIn();
      if (user != null) {
        final gAuthentication = await user.authentication;

        final credentials = GoogleAuthProvider.credential(
            idToken: gAuthentication.idToken,
            accessToken: gAuthentication.accessToken);

        await FirebaseAuth.instance.signInWithCredential(credentials);

        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? '';
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photoUrl;

        UserStore.to.saveProfile(userProfile);
        var userBase = await db
            .collection('users')
            .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userData, options) =>
                    userData.toFirestore())
            .where('id', isEqualTo: id)
            .get();

        if (userBase.docs.isEmpty) {
          //Si esta vacio
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photourl: photoUrl,
              location: '',
              fcmtoken: '',
              addtime: Timestamp.now());

          await db
              .collection('users')
              .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userData, options) =>
                      userData.toFirestore())
              .add(data); //Se llena
        }

        toastInfo(msg: 'LogIn success');

        Get.offAndToNamed(AppRoutes.Application);
      }
    } catch (e) {
      toastInfo(msg: 'LogIn Error');
      log('$e');
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User logged out');
      } else {
        log('User logged in');
      }
    });
  }
}
