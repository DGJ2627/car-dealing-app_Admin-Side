import 'package:car_dekho_app/src/components/sign_up_form.dart';
import 'package:car_dekho_app/src/ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../logic/authentication/admin/sign_up_admin_cubit/sign_up_cubit.dart';
import '../../../../packages/domain/model/admin/register_admin_model.dart';
import '../../../../packages/resources/colors.dart';
import '../../../../packages/resources/image_path.dart';
import '../../../../utils/logger.dart';

class SignUpAdminView extends StatelessWidget {
  static String routeName = "/SignUpAdminView";

  const SignUpAdminView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpAdminView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final globalKey = GlobalKey<FormState>();
        final emailController = TextEditingController();
        final fulNameController = TextEditingController();
        final passwordController = TextEditingController();
        final contactNumberController = TextEditingController();

        if (state.isLoading) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.asset(ImagePath.carLog)),
                    Text(
                      "Create Account",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    const Gap(20),
                    SignUpForm(
                      globalKey: globalKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      fullNameController: fulNameController,
                      contactNumberController: contactNumberController,
                      signUpEvent: () {
                        if (globalKey.currentState!.validate()) {
                          RegisterAdminModel registerAdminModel =
                              RegisterAdminModel(
                            password: passwordController.text,
                            email: emailController.text,
                            contactNumber: contactNumberController.text,
                            fullName: fulNameController.text,
                          );

                          Log.success(registerAdminModel.email);
                          Log.success(registerAdminModel.password);
                          Log.success(registerAdminModel.fullName);
                          Log.success(registerAdminModel.contactNumber);
                          context.read<SignUpCubit>().signUpFunction(
                              registerAdminModel: registerAdminModel,
                              context: context);
                        }
                      },
                    ),
                    const Gap(30),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, SignInAdminView.routeName),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account?  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.blackColor),
                            ),
                            TextSpan(
                              text: "Sign In",
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
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
