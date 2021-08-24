// import 'package:flutter/material.dart';
// import 'package:flutter_login/login_getx/home/homepage.dart';
// import 'package:flutter_login/login_getx/login/model/repository.dart';
// import 'package:flutter_login/login_getx/notifications/model/notifications_respository.dart';
// import 'package:flutter_login/login_getx/notifications/notifications_controller.dart';
// import 'package:flutter_login/login_getx/notifications/notifications_page.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class LoginController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   NotificationsRespository notificationsRespository =
//       new NotificationsRespository();

//   Repository repository = new Repository();
//   FocusNode nodeOne = FocusNode();
//   FocusNode nodeTwo = FocusNode();

//   String textPassword = 'Password';
//   Icon iconPassword = Icon(Icons.visibility);

//   TextEditingController username = TextEditingController(text: "0868851924");
//   TextEditingController password = TextEditingController(text: '123456');
//   RxBool isHidePassword = true.obs;
//   // bool isButtonDisabled = false;
//   Future<void> funcLogin(String username, String password) async {
//     if (formKey.currentState!.validate()) {
//       // isButtonDisabled = !isButtonDisabled;
//       print("Login!!");

//       Get.dialog(
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: 50,
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.red,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(90),
//             ),
//           ),
//         ),
//         barrierDismissible: false,
//       );
//       var userResponse = await repository.login(username, password);
//       Get.back();

//       if (userResponse.status == 0) {
//         print("Susses!!");
//         Get.to(
//           () => HomePage(),
//           arguments: userResponse,
//           binding: BindingsBuilder(() {
//             Get.put(NotificationsController);
//           }),
//         );
//       } else {
//         Get.snackbar("Thông báo!!!", "Vui lòng kiểm tra lại thông tin.");
//         print("Fail!!!");
//       }
//       // isButtonDisabled = !isButtonDisabled;
//     }
//   }

//   void submitLogin() {
//     funcLogin(
//       username.text,
//       password.text,
//     );
//   }

//   void deleteTextUserName() {
//     username.text = "";
//   }

//   void focusPasswordText() {
//     FocusScope.of(Get.context!).requestFocus(nodeTwo);
//     print(":))!");
//   }

//   void hidePassword() {
//     isHidePassword.toggle();
//   }

//   void hideKeyboard() {
//     FocusManager.instance.primaryFocus?.unfocus();
//   }
// }
