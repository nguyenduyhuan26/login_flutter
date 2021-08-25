import 'package:flutter/material.dart';
import 'package:my_app/providers/register.dart';
import 'package:my_app/views/signIn_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController name = TextEditingController(text: "");
  TextEditingController phone = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  TextEditingController passwordComfirm = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Register()),
      ],
      child: Form(
        key: formKey,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blue.shade600,
            body: SingleChildScrollView(
              reverse: false,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(116, 176, 243, 1),
                        Color.fromRGBO(51, 132, 224, 1),
                      ]),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    label(),
                    nameInput(),
                    phoneInput(),
                    emailInput(),
                    passInput(),
                    confirmPassInput(),
                    btnRegister(),
                    signInText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnRegister() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<Register>().register(
                phone: phone.text,
                name: name.text,
                email: email.text,
                password: password.text);
          }
        },
        shape: const StadiumBorder(),
        color: Colors.white,
        splashColor: Colors.blue[900],
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: baseText(
              text: "REGISTER",
              sizeText: 22,
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget label() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: baseText(
        text: "Sign Up",
        sizeText: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget passInput() {
    return baseInput(
        isShowText: true,
        labelText: "Password",
        controller: password,
        text: "******",
        icon: Icon(Icons.vpn_key));
  }

  Widget confirmPassInput() {
    return baseInput(
        isShowText: true,
        labelText: "Password",
        controller: passwordComfirm,
        text: "******",
        icon: Icon(Icons.vpn_key));
  }

  Widget nameInput() {
    return baseInput(
        isShowText: false,
        labelText: "Full Name",
        controller: name,
        text: "Enter your name",
        icon: Icon(Icons.person));
  }

  Widget phoneInput() {
    return baseInput(
        isShowText: false,
        labelText: "Phone No",
        controller: phone,
        text: "Enter your phone",
        icon: Icon(Icons.phone));
  }

  Widget emailInput() {
    return baseInput(
        isShowText: false,
        labelText: "Email",
        controller: email,
        text: "Enter your email",
        icon: Icon(Icons.mail));
  }

  Widget signInText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          baseText(text: "Have an Ancount ? ", sizeText: 20),
          baseText(
              text: "Sign In",
              sizeText: 20,
              fontWeight: FontWeight.bold,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              })
        ],
      ),
    );
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

  Widget baseInput({
    required TextEditingController controller,
    required String labelText,
    required String text,
    required Icon icon,
    bool isShowText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: baseText(text: labelText, sizeText: 18),
            ),
          ),
          TextFormField(
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
}
