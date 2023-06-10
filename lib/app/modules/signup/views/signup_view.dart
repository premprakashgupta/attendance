import 'package:attendance/utils/icons.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:attendance/widgets/shadow_container.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final TextEditingController _username = TextEditingController();
  final SignupController _signupController = Get.find<SignupController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size = Get.width;

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
                const CustomeHeader(text: "Sign up"),
                const Gap(40),
                CustomContainer(
                  width: size > 440
                      ? MediaQuery.of(context).size.width * .7
                      : size,
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
                          controller: _username,
                          decoration: InputDecoration(
                            icon: Icon(CustomeIcons.person),
                            label: const Text('Username'),
                            hintText: "John Doe",
                          ),
                          validator: (value) {
                            if (!GetUtils.isUsername(value!)) {
                              return "Username is not valid";
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
                        const Gap(10),
                        Obx(
                          () => RadioListTile<String>(
                            title: const CustomeSubHeader(text: 'Student'),
                            value: 'student',
                            groupValue: _signupController.selectedRole.value,
                            onChanged: (value) {
                              _signupController.selectedRole.value = value!;
                            },
                          ),
                        ),
                        const Gap(10),
                        Obx(
                          () => RadioListTile<String>(
                            title: const CustomeSubHeader(text: 'Teacher'),
                            value: 'teacher',
                            groupValue: _signupController.selectedRole.value,
                            onChanged: (value) {
                              _signupController.selectedRole.value = value!;
                            },
                          ),
                        ),
                        const Gap(40),
                        Obx(() => _signupController.isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _signupController.signupWithEmailPassword(
                                      email: _email.text,
                                      password: _password.text,
                                      username: _username.text,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width * .4,
                                    45,
                                  ),
                                ),
                                child: const CustomeSubHeader(
                                  text: "Signup",
                                  color: Colors.white,
                                ),
                              ))
                      ],
                    ),
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
      ),
    );
  }
}
