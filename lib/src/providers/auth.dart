import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

String mensaje;

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future registro(String email, String password) async {
    try {
      // ignore: unused_local_variable
      var user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firebaseAuth
          .currentUser()
          .then((user) => user.sendEmailVerification());

      return "si";
    } catch (e) {
      print(e.code);
      
      String men = e.code;
      if (e.code == "ERROR_API_NOT_AVAILABLE") {
        men = pre.idioma?"Este equipo no cuenta con los servicios de google":"This equipment does not have google services";
      }
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        men = pre.idioma?"Este correo ya esta en uso":"This email is already in use";
      }
      if (e.code == "ERROR_INVALID_EMAIL") {
        men = pre.idioma?"Formato de correo invalido":"Invalid email format";
      }
      if (e.code == "ERROR_WEAK_PASSWORD") {
        men = pre.idioma?"La contraseña debe contener al menos 6 caracteres":"Password must contain at least 6 characters";
      }
      if (e.code == "ERROR_NETWORK_REQUEST_FAILED") {
        men = pre.idioma?"verifique su conexion a internet":"check your internet connection";
      }
      print(e.code);
      return men;
    }
  }

  Future login(String email, String password) async {
    try {
      String veri;

      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser vf = await firebaseAuth.currentUser();

      if (vf.isEmailVerified) {
        veri = "si";
        pre.nombre = vf.displayName;
        String x = vf.email;
        pre.correoreal = x;
        String y = x.replaceAll("@", "_");
        String z = y.replaceAll(".", "_");
        pre.correo = z;
      } else {
        veri =pre.idioma?
            "El correo no ha sido validado, por favor revise su correo de validacion":"The email has not been validated, please check your validation email";
      }

      return veri;
    } catch (e) {
      // ignore: unused_local_variable
      String men = e.code;
      if (e.code == "ERROR_API_NOT_AVAILABLE") {
        men = pre.idioma?"Este equipo no cuenta con los servicios de google":"This equipment does not have google services";
      }
      if (e.code == "ERROR_USER_NOT_FOUND") {
        men = pre.idioma?"Este correo no esta registrado":"This email is not registered";
      }
      if (e.code == "ERROR_NETWORK_REQUEST_FAILED") {
        men = pre.idioma?"verifique su conexion a internet":"check your internet connection";
      }
      if (e.code == "ERROR_WRONG_PASSWORD") {
        List<String> metodos =
            await firebaseAuth.fetchSignInMethodsForEmail(email: email);
        print("metodos ${metodos.length}");
        if (metodos.length > 0) {
          men = pre.idioma?"Usuario ya registrado con otro proveedor":"User already registered with another provider";
        } else {
          men = pre.idioma?"Clave incorrecta":"incorrect password";
        }
      }

      if (e.code == "ERROR_INVALID_EMAIL") {
        men = pre.idioma?"ormato de correo invalido":"Invalid email format";
      }

      print(e.code);
      return men;
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount cuenta = await googleSignIn.signIn();
      final GoogleSignInAuthentication cuentauth = await cuenta.authentication;

      final AuthCredential credencial = GoogleAuthProvider.getCredential(
        accessToken: cuentauth.accessToken,
        idToken: cuentauth.idToken,
      );

      final AuthResult authResult =
          await firebaseAuth.signInWithCredential(credencial);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await firebaseAuth.currentUser();
      assert(user.uid == currentUser.uid);

      return user;
    } catch (e) {
      return e.code;
    }
  }

  final FacebookLogin facebookSignIn = new FacebookLogin();

  Future loginfb2() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    try {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          print("logeado con facebook ");
          final respuesta = await FirebaseAuth.instance.signInWithCredential(
              FacebookAuthProvider.getCredential(
                  accessToken: result.accessToken.token));

          final FirebaseUser user = respuesta.user;

          pre.nombre = user.displayName;
          String x = user.email;
          pre.correoreal = x;
          String y = x.replaceAll("@", "_");
          String z = y.replaceAll(".", "_");
          pre.correo = z;
          pre.foto = user.photoUrl;
          pre.fb = true;
          break;
        case FacebookLoginStatus.cancelledByUser:
          print('Login cancelado por usuario');

          break;
        case FacebookLoginStatus.error:
          print("error login fb ${result.errorMessage}");
          break;
      }
    } catch (e) {
      print('Failed with error code: ${e.code}');

      if (e.code == 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL') {
        pre.fb = false;
      }
    }
  }
}
