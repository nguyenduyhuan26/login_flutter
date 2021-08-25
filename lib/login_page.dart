// import 'package:flutter/material.dart';
// import 'package:flutter_login/login_getx/login/login_controller.dart';
// import 'package:get/get.dart';

// class LoginPage extends GetView<LoginController> {
//   final LoginController loginController = Get.put(LoginController());

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: loginController.formKey,
//       child: GestureDetector(
//         onTap: () {
//           loginController.hideKeyboard();
//         },
//         child: SafeArea(
//           child: Scaffold(
//             // resizeToAvoidBottomInset: false,
//             body: SingleChildScrollView(
//               reverse: true,
//               child: Column(
//                 children: [
//                   _image(),
//                   _label(),
//                   _usernameInput(),
//                   _passwordInput(),
//                   _btnLogin(),
//                   _text(),
//                   _icon(),
//                   _textEnd(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _usernameInput() {
//     return baseInput(
//         validator: (val) {
//           if (val?.isEmpty ?? true) {
//             return 'Khong duoc de trong';
//           }
//           return null;
//         },
//         text: "User Name:",
//         icon: Icon(Icons.clear),
//         onTap: () {
//           loginController.deleteTextUserName();
//         },
//         iconForm: Icons.person,
//         controller: loginController.username,
//         isShowText: false,
//         focusNode: loginController.nodeOne,
//         onSubmitted: (s) {
//           loginController.focusPasswordText();
//         });
//   }

//   Widget _passwordInput() {
//     return Obx(() => baseInput(
//           validator: (val) {
//             if (val?.isEmpty ?? true) {
//               return 'Khong duoc de trong';
//             }
//             return null;
//           },
//           text: "Password:",
//           icon: !loginController.isHidePassword.value
//               ? Icon(Icons.visibility)
//               : Icon(Icons.visibility_off),
//           onTap: () {
//             loginController.hidePassword();
//           },
//           iconForm: Icons.password,
//           controller: loginController.password,
//           isShowText: loginController.isHidePassword.value,
//           focusNode: loginController.nodeTwo,
//           onSubmitted: (s) {
//             loginController.submitLogin();
//           },
//         ));
//   }

//   Widget _image() {
//     return Image(
//       image: AssetImage('assets/login.png'),
//       width: Get.width / 1.5,
//       height: Get.height / 4,
//     );
//   }

//   Widget _label() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(32, 26, 32, 26),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           "Login",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 33,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _btnLogin() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(32, 0, 32, 26),
//       child: Container(
//         width: 350,
//         child: TextButton(
//           child: Text("Login", style: TextStyle(fontSize: 20)),
//           style: ButtonStyle(
//               backgroundColor:
//                   MaterialStateProperty.all<Color>(Colors.blue.shade600),
//               padding:
//                   MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
//               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ))),
//           onPressed: () {
//             loginController.submitLogin();
//           },
//         ),
//       ),
//     );
//   }
// }

// Widget _text() {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(0, 0, 0, 26),
//     child: Text(
//       "Or, login with...",
//       style: TextStyle(
//         color: Colors.grey,
//       ),
//     ),
//   );
// }

// Widget _icon() {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(32, 0, 32, 26),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _iconGoogle(),
//         _iconFaceBook(),
//         _iconApple(),
//       ],
//     ),
//   );
// }

// Widget _iconApple() {
//   return baseIcon(
//     assetImage: AssetImage('assets/apple.png'),
//   );
// }

// Widget _iconGoogle() {
//   return baseIcon(
//     assetImage: AssetImage('assets/search.png'),
//   );
// }

// Widget _iconFaceBook() {
//   return baseIcon(
//     assetImage: AssetImage('assets/facebook.png'),
//   );
// }

// Widget baseIcon({
//   required AssetImage assetImage,
// }) {
//   return Container(
//     // margin: EdgeInsets.all(20),
//     padding: EdgeInsets.fromLTRB(34, 8, 34, 8),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       border: Border.all(width: 1, color: Colors.grey),
//     ),
//     child: Image(
//       image: assetImage,
//       width: 30,
//       height: 30,
//     ),
//   );
// }

// Widget _textEnd() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       _textLogistics(),
//       _textRegister(),
//     ],
//   );
// }

// Widget _textLogistics() {
//   return Text(
//     "New to iThinklogistics? ",
//     style: TextStyle(
//       color: Colors.grey,
//     ),
//   );
// }

// Widget _textRegister() {
//   return Text(
//     "Register",
//     style: TextStyle(
//       color: Colors.lightBlue,
//     ),
//   );
// }

// Widget baseInput({
//   required FocusNode focusNode,
//   required TextEditingController controller,
//   required String text,
//   required Icon icon,
//   required IconData iconForm,
//   bool isShowText = false,
//   required FormFieldValidator<String>? validator,
//   required void Function(String)? onSubmitted,
//   required void Function()? onTap,
// }) {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(32, 0, 32, 26),
//     child: TextFormField(
//       onFieldSubmitted: onSubmitted,
//       controller: controller,
//       obscureText: isShowText,
//       validator: validator,
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           iconForm,
//           color: Colors.grey,
//         ),
//         suffixIcon: InkWell(
//           onTap: onTap,
//           child: icon,
//         ),
//         hintText: "$text",
//         hintStyle: TextStyle(
//           fontWeight: FontWeight.w300,
//           color: Colors.grey,
//         ),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey,
//           ),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.black),
//         ),
//       ),
//     ),
//   );
// }
