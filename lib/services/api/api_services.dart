import 'package:firebase_dev_demo/constants/databases.dart';
import 'package:firebase_dev_demo/models/api_res_model.dart';
import 'package:firebase_dev_demo/models/user_model.dart';
import 'package:flutter/material.dart';

/// This function registers a user by adding their email and password to a database and returns a
/// response model.
///
/// Args:
///   email (String): A required string parameter representing the email address of the user being
/// registered.
///   password (String): The password parameter is a required string that represents the user's password
/// for registration.
///
/// Returns:
///   A `Future` object that resolves to a `ResponseModel` object.
Future<ResponseModel> registerUser(
    {required String email, required String password}) async {
  ResponseModel responseModel = ResponseModel();
  try {
    UserModel user =
        UserModel(email: email, password: password, isValidated: false, id: '');
    var res = await userdb.add(user.toMap());
    user.copyWith(id: res.id);
    responseModel.data = user;
  } catch (e) {
    responseModel.error = e;
  }
  return responseModel;
}

/// The `login` function checks if a user exists with the provided email and password, and returns a
/// response model with the user data or an error message.
///
/// Args:
///   email (String): A required string parameter representing the email of the user trying to log in.
///   password (String): The password parameter is a required string that represents the password
/// entered by the user during the login process.
///
/// Returns:
///   a `Future` that resolves to a `ResponseModel` object.
Future<ResponseModel> login(
    {required String email, required String password}) async {
  ResponseModel responseModel = ResponseModel();

  try {
    var res = await userdb.where('email', isEqualTo: email).get();

    debugPrint(res.docs.length.toString());

    /// This code block is checking if the query result `res` has any documents matching the provided
    /// email. If the size of the result is 0, it means that no user was found with the provided email,
    /// so the `responseModel.error` property is set to a message indicating that no user was found.
    if (res.docs.isEmpty) {
      responseModel.error = "No user found with this email";
    } else {
      var userDoc = res.docs.first;
      debugPrint(userDoc.data().toString());
      UserModel currentUser = UserModel.fromMap(userDoc.data());
      debugPrint("reach 2 : ${currentUser.toString()}");
      if (password == currentUser.password) {
        responseModel.data = currentUser;
      } else {
        responseModel.error = "Password does not match";
      }
    }
  } catch (e) {
    responseModel.error = e;
  }

  return responseModel;
}
