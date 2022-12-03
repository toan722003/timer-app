import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/register_controller.dart';

import '../theme/color.dart';
import '../theme/textStyle.dart';
import 'button.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  RegisterContrller registerContrller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              // child: Assets.resources.icons.icLogoBottom.image(height: 162.h),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.w,
                right: 30.w,
                bottom: MediaQuery.of(context).viewInsets.bottom + 30.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    // MWLogo(
                    //   size: 80.w,
                    //   borderRadius: 20.r,
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "",
                      // LocaleKeys.app_name.trans(),
                      style: UITextStyle.textViewPeecent_black_18_bold,
                    ),
                    Text(
                      "",
                      // LocaleKeys.welcome_social_network_for_book.trans(),
                      style: UITextStyle.note_white_12_normal,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Text(""
                            // LocaleKeys.register_register.trans(),
                            // style: UITextStyle.note_white_12_normal,
                            )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Form(
                      // key: viewModel.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: registerContrller.nameEditingController,
                            // validator: (name) => viewModel.nameValidate(name),
                            decoration: InputDecoration(
                                // hintText: LocaleKeys.register_name_account.trans(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                    color: UIColor.red,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                    color: UIColor.red,
                                  ),
                                ),
                                prefixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 18.0.w,
                                    ),
                                    const Icon(
                                      Icons.person_outline,
                                      color: UIColor.task_redWhite,
                                    ),
                                    SizedBox(
                                      width: 12.0.w,
                                    ),
                                    Container(
                                      height: 30.h,
                                      width: 1.0.w,
                                      color: UIColor.countDown_whiteAccent,
                                    ),
                                    SizedBox(
                                      width: 12.0.w,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: registerContrller.emailEditingController,
                            // validator: (email) => viewModel.emailValidate(email),
                            decoration: InputDecoration(
                                // hintText: LocaleKeys.login_email.trans(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                    color: UIColor.red,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                    color: UIColor.countDown_whiteAccent,
                                  ),
                                ),
                                prefixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 18.0.w,
                                    ),
                                    const Icon(
                                      Icons.email_outlined,
                                      color: UIColor.countDown_whiteAccent,
                                    ),
                                    SizedBox(
                                      width: 12.0.w,
                                    ),
                                    Container(
                                      height: 30.h,
                                      width: 1.0.w,
                                      color: UIColor.countDown_whiteAccent,
                                    ),
                                    SizedBox(
                                      width: 12.0.w,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: registerContrller.passwordEditingController,
                              // validator: (password) => viewModel.passwordValidate(password),
                              decoration: InputDecoration(
                                  // hintText: LocaleKeys.login_password.trans(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: UIColor.countDown_whiteAccent,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: UIColor.countDown_whiteAccent,
                                    ),
                                  ),
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 18.0.w,
                                      ),
                                      const Icon(
                                        Icons.lock_open_outlined,
                                        color: UIColor.countDown_whiteAccent,
                                      ),
                                      SizedBox(
                                        width: 12.0.w,
                                      ),
                                      Container(
                                        height: 30.h,
                                        width: 1.0.w,
                                        color: UIColor.countDown_whiteAccent,
                                      ),
                                      SizedBox(
                                        width: 12.0.w,
                                      ),
                                    ],
                                  ),
                                  suffixIcon: InkWell(
                                    // onTap: viewModel.onEyeClick,
                                    child: Obx(
                                      () => Icon(
                                        !registerContrller.showPassword
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                      ),
                                    ),
                                  )),
                              // obscureText: !viewModel.showPassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonWidget(
                      height: 50.h,
                      width: 315.w,
                      borderRadius: 10.r,
                      title: "DANG KY NGAY",
                      titleStyle: UITextStyle.textViewPeecent_black_18_bold,
                      onPress: () {},
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    InkWell(
                      // onTap: viewModel.onGoToLoginClick,
                      child: Text.rich(
                        TextSpan(
                          // text: LocaleKeys.register_have_account.trans(),
                          children: <InlineSpan>[
                            TextSpan(
                              // text: ' ${LocaleKeys.register_login.trans()}',
                              style: UITextStyle.countTask_accantGrey_14_normal,
                            ),
                          ],
                          style: UITextStyle.countTask_accantGrey_14_normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
