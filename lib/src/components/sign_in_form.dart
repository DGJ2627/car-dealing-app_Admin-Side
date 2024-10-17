import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../packages/helper/custom_text_field.dart';
import '../packages/helper/text_field_validator.dart';
import '../packages/resources/colors.dart';

class SignInForm extends StatefulWidget {
  const SignInForm(
      {super.key,
      required this.globalKey,
      required this.emailController,
      required this.passwordController,
      this.signUpEvent});

  final GlobalKey<FormState> globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? signUpEvent;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isEye = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            fieldController: widget.emailController,
            fieldName: "Email",
            isReadOnly: false,
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.email, value),
            autoFocus: false,
            prefixIcon: const Icon(Iconsax.sms),
            obscureText: false,
            labelText: "Email",
          ),
          const Gap(30),
          CustomTextField(
            fieldController: widget.passwordController,
            fieldName: "Password",
            isReadOnly: false,
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.password, value),
            autoFocus: false,
            prefixIcon: const Icon(Iconsax.lock),
            obscureText: isEye ? false : true,
            labelText: "Password",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => isEye = !isEye);
              },
              icon: isEye
                  ? const Icon(CupertinoIcons.eye)
                  : const Icon(CupertinoIcons.eye_slash),
            ),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: widget.signUpEvent,
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffED9D40),
                ),
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
