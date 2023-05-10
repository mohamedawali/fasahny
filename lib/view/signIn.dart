import 'package:email_validator/email_validator.dart';
import 'package:fasahny/bloc/loginRegister/login_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSecure = true;
  LoginRegisterBloc? _loginBloc;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginRegisterBloc>(context);
    BlocProvider.of<LoginRegisterBloc>(context).add(CheckLoginEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocListener<LoginRegisterBloc, LoginRegisterState>(
      listener: (context, state) {
        if (state is CheckLoginState) {
          print('st${state.token}');
          if (state.token != null) {
            Navigator.pushReplacementNamed(context, '/mainHome');
          }
        }
      },
      child:
      Scaffold(
          body: Container(
        height: screenSize.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hey there',
                        style: GoogleFonts.manrope(
                            textStyle:
                                TextStyle(fontSize: 20.sp, color: colorDark))),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Welcome Back',
                        style: GoogleFonts.manrope(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: colorDark))),
                    SizedBox(
                      height: screenSize.height / 35,
                    ),
                    Form(
                        key: globalKey,
                        child: Column(children: [
                          TextFormField(
                              controller: email,
                              cursorColor: colorLight,
                              validator: (email) => EmailValidator.validate(email!)
                            ? null
                            : 'Entar rigth email(example@gmail.com)',
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: "email",
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: colorDark,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none))),
                          SizedBox(
                            height: screenSize.height / 40,
                          ),
                          TextFormField(
                              obscureText: isSecure,
                              controller: password,
                              cursorColor: colorLight,
                              validator: (password) => password!.length <= 8
                                  ? 'short password'
                                  : null,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: "password",
                                  suffixIcon:  IconButton(
                                        onPressed: () {
                                          _loginBloc!
                                              .add(ShowHideEvent(isSecure, 1));
                                        },
                                        icon: isSecure
                                            ? Icon(
                                                Icons.visibility,
                                                color: colorDark,
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: colorDark,
                                              ),

                                  ),
                                  prefixIcon: Icon(Icons.lock_outline,
                                      color: colorDark),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none))),
                        ])),
                    SizedBox(
                      height: 20.sp,
                    ),
                    TextButton(
                        onPressed: () => {},
                        //  Navigator.pushNamed(context, '/resetPassword'),
                        child: Text('Forget your password?',
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: colorLight,
                                    decoration: TextDecoration.underline)))),
                    SizedBox(
                      height: screenSize.height / 6,
                    ),
                    BlocConsumer<LoginRegisterBloc, LoginRegisterState>(
                      listener: (context, state) {
                        if (state is LoginLoaded) {
                          state.loginResponse.status == 1
                              ? Navigator.pushReplacementNamed(
                                  context,
                                  "/mainHome",
                                )
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${state.loginResponse.message}')));
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.cyan,
                          ));
                        }
                        return ElevatedButton(
                          onPressed: () {
                            globalKey.currentState!.validate()
                                ? _loginBloc!.add(Login(
                                    email.value.text, password.value.text))
                                : null;
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  screenSize.width, screenSize.height * 0.06),
                              backgroundColor: colorDark,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: screenSize.height / 20,
                    ),
                    Text('-Or Sign In with-',
                        style: GoogleFonts.abel(
                            textStyle: TextStyle(
                                fontSize: 16.sp, color: Colors.grey))),
                    SizedBox(
                      height: screenSize.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account yet?',
                          style: GoogleFonts.abel(
                              textStyle: TextStyle(fontSize: 16.sp)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/signUp");
                          },
                          child: Text('Sign Up',
                              style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp, color: colorLight))),
                        )
                      ],
                    ),
                  ])),

      )),
      ));
  }


}
