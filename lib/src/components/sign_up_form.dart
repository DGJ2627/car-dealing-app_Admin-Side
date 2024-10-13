import 'package:car_dekho_app/src/packages/helper/custom_text_field.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../packages/helper/text_field_validator.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.globalKey,
    required this.emailController,
    required this.passwordController,
    required this.fullNameController,
    required this.contactNumberController,
    this.signUpEvent,
  });

  final GlobalKey<FormState> globalKey;
  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController contactNumberController;
  final void Function()? signUpEvent;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isEye = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            fieldController: widget.fullNameController,
            fieldName: "Full Name",
            labelText: "Full Name",
            isReadOnly: false,
            validator: (value) => textFieldValidator('fulName', value),
            autoFocus: false,
            prefixIcon: const Icon(Iconsax.user),
            obscureText: false,
          ),
          const Gap(10),
          CustomTextField(
            fieldController: widget.emailController,
            fieldName: "Email",
            labelText: "Email",
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            isReadOnly: false,
            validator: (value) => textFieldValidator('email', value),
            autoFocus: false,
            prefixIcon: const Icon(Iconsax.sms),
          ),
          const Gap(10),
          CustomTextField(
            fieldController: widget.passwordController,
            fieldName: "Password",
            labelText: "Password",
            keyboardType: TextInputType.visiblePassword,
            isReadOnly: false,
            validator: (value) => textFieldValidator('password', value),
            autoFocus: false,
            obscureText: isEye ? false : true,
            prefixIcon: const Icon(Iconsax.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => isEye = !isEye);
              },
              icon: isEye
                  ? const Icon(CupertinoIcons.eye)
                  : const Icon(CupertinoIcons.eye_slash),
            ),
          ),
          const Gap(10),
          CustomTextField(
            obscureText: false,
            fieldController: widget.contactNumberController,
            fieldName: "contactNumber",
            labelText: "contactNumber",
            keyboardType: TextInputType.phone,
            isReadOnly: false,
            validator: (value) => textFieldValidator('contactNumber', value),
            autoFocus: false,
            prefixIcon: const Icon(Iconsax.mobile),
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
                  "Sign Up",
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
