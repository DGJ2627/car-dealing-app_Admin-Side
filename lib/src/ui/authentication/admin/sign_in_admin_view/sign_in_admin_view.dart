import 'package:car_dekho_app/src/ui/authentication/admin/sign_up_admin_view/sign_up_admin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../components/sign_in_form.dart';
import '../../../../logic/authentication/admin/sign_in_cubit/sign_in_cubit.dart';
import '../../../../packages/resources/colors.dart';
import '../../../../packages/resources/image_path.dart';
import '../../../../utils/logger.dart';

class SignInAdminView extends StatelessWidget {
  static String routeName = "/SignInAdminView";

  const SignInAdminView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: const SignInAdminView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final globalKey = GlobalKey<FormState>();
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 330,
                      width: 330,
                      child: Image.asset(ImagePath.carLog)),
                  Text(
                    "Sign In Account",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.blackColor),
                  ),
                  const Gap(20),
                  SignInForm(
                    globalKey: globalKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    signUpEvent: () {
                      Log.success(emailController.text);
                      Log.success(passwordController.text);
                      if (globalKey.currentState!.validate()) {
                        context.read<SignInCubit>().signInFunction(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, SignUpAdminView.routeName),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?  ",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.blackColor),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
