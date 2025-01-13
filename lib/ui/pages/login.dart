import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_button.dart';
import 'package:plnsurvey/ui/widgets/custom_text_form_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Widget submitButton() {
      return CustomButton(
        title: 'Masuk',
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard');
        },
      );
    }

    Widget nipInput() {
      return CustomTextFormField(
        title: 'NIP',
        hintText: 'Masukkan NIP Anda',
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        title: 'Kata Sandi',
        hintText: 'Masukkan Kata Sandi',
        obscureText: true,
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryBackground,
        ),
        child: Center(
          child: SizedBox(
            width: 460,
            height: 555,
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                // Image.asset(
                //   "assets/loginform.png",
                //   width: 560,
                //   height: 666,
                //   fit: BoxFit.cover,

                Padding(
                  padding: const EdgeInsets.all(.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 290, bottom: 100),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/logologin.png',
                              height: 150,
                              width: 127,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      nipInput(),
                      SizedBox(height: 6),
                      passwordInput(),
                      submitButton(),
                    ],
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
