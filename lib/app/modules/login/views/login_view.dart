import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/utils/icons.dart';
import 'package:attendance/widgets/caption_text.dart';
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LoginView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Gap(30),
                const CustomeHeader(text: "Sign in"),
                const Gap(40),
                CustomContainer(
                  width: size > 440 ? size * .7 : size,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            icon: Icon(CustomeIcons.email),
                            label: const Text('Email'),
                            hintText: "abc@gmail.com",
                          ),
                          validator: (value) {
                            if (!GetUtils.isEmail(value!)) {
                              return "Email is not valid";
                            }
                            return null;
                          },
                        ),
                        const Gap(20),
                        TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(CustomeIcons.lock),
                            label: const Text('Password'),
                            hintText: "Abc123@",
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return "week password";
                            }
                            return null;
                          },
                        ),
                        const Gap(40),
                        Obx(() => _loginController.isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _loginController.login(
                                        email: _email.text,
                                        password: _password.text);
                                  }
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
                              ))
                      ],
                    ),
                  ),
                ),
                const Gap(50),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: const CustomeCaption(text: 'Sign up'),
                ),
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
      ),
    );
  }
}
