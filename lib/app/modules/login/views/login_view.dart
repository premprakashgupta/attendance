import 'package:attendance/utils/icons.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:attendance/widgets/shadow_container.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final LoginController _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LoginView'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Gap(30),
              const CustomeHeader(text: "Sign in"),
              const Gap(40),
              CustomContainer(
                width: MediaQuery.of(context).size.width * .7,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          icon: Icon(CustomeIcons.email),
                          label: const Text('Email'),
                          hintText: "abc@gmail.com"),
                    ),
                    const Gap(20),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(CustomeIcons.lock),
                          label: const Text('Password'),
                          hintText: "Abc123@"),
                    ),
                    const Gap(40),
                    ElevatedButton(
                      onPressed: () {
                        _loginController.login(
                            email: _email.text, password: _password.text);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * .4,
                          45,
                        ),
                      ),
                      child: const CustomeSubHeader(
                        text: "Login",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(50),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: const Divider(
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
