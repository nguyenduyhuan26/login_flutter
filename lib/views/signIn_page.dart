import 'package:flutter/material.dart';
import 'package:my_app/providers/login.dart';
import 'package:my_app/views/signUp_page.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    // final login = Provider.of<Login>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Login()),
      ],
      child: Form(
        key: formKey,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.blue.shade600,
            body: SingleChildScrollView(
              reverse: false,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    label(),
                    emailInput(),
                    passInput(),
                    forgotText(),
                    checkbox(),
                    btnLogin(),
                    orText(),
                    icon(),
                    signUpText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailInput() {
    return baseInput(
      labelText: "Email",
      controller: email,
      text: "Enter your Email",
      icon: Icon(Icons.mail),
    );
  }

  Widget checkbox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
      child: Row(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              checkColor: Colors.black,
              activeColor: Colors.white,
              hoverColor: Colors.white,
              value: false,
              onChanged: (newValue) {
                //  checkedValue = newValue;
              },
            ),
          ),
          baseText(text: "Remember me", sizeText: 20)
        ],
      ),
    );
  }

  Widget label() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: baseText(
        text: "Sign In",
        sizeText: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget signUpText() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          baseText(text: "Don't have an Ancount ", sizeText: 20),
          baseText(
              text: "Sign Up",
              sizeText: 20,
              fontWeight: FontWeight.bold,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              })
        ],
      ),
    );
  }

  Widget btnLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () =>
            context.read<Login>().submitLogin(email.text, password.text),
        shape: const StadiumBorder(),
        color: Colors.white,
        splashColor: Colors.blue[900],
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: baseText(
            text: "LOGIN",
            fontWeight: FontWeight.bold,
            sizeText: 28,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }

  Widget forgotText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 18, 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: baseText(
          text: "Forgot Password?",
          sizeText: 18,
        ),
      ),
    );
  }

  Widget orText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: baseText(
              text: "- OR - ",
              sizeText: 20,
            ),
          ),
          baseText(
            text: "Sign in with",
            sizeText: 18,
          ),
        ],
      ),
    );
  }

  Widget icon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          baseIcon(assetImage: "assets/facebook.png"),
          baseIcon(assetImage: "assets/google.png"),
        ],
      ),
    );
  }

  Widget passInput() {
    return baseInput(
        isShowText: false,
        labelText: "Password",
        controller: password,
        text: "",
        icon: Icon(Icons.vpn_key));
  }

  Widget baseText({
    required String text,
    required double sizeText,
    void Function()? onTap,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        "$text",
        style: TextStyle(
          color: color,
          fontSize: sizeText,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget baseIcon({
    required String assetImage,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image(
            image: AssetImage(assetImage),
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }

  Widget baseInput({
    required TextEditingController controller,
    required String labelText,
    required String text,
    required Icon icon,
    bool isShowText = false,
    // required FormFieldValidator<String>? validator,
    // required void Function(String)? onSubmitted,
    // required void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: baseText(text: labelText, sizeText: 18),
            ),
          ),
          TextFormField(
            // onFieldSubmitted: onSubmitted,
            controller: controller,
            obscureText: isShowText,
            validator: (val) {
              if (val?.isEmpty ?? true) {
                return 'Không được để trống';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.blue.shade300,
              prefixIcon: InkWell(
                // onTap: onTap,

                child: icon,
              ),
              hintText: "$text",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submitLogin() {
    // showDialog(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (BuildContext context) {
    //     return Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Container(
    //         height: 50,
    //         child: new CircularProgressIndicator(
    //           backgroundColor: Colors.red,
    //         ),
    //         margin: EdgeInsets.only(bottom: 320, left: 12, right: 12),
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(40),
    //         ),
    //       ),
    //     );
    //   },
    // );
    print("da an");
  }
}
