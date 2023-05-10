
import 'package:email_validator/email_validator.dart';
import 'package:fasahny/bloc/loginRegister/login_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  LoginRegisterBloc? _registerBloc;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isSecure = true;
  bool isSecure2 = true;
  @override
  void initState() {
    _registerBloc = BlocProvider.of<LoginRegisterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: colorDark,
        ),
      ),
      body: Container(
        height: screenSize.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hey there',
                      style: GoogleFonts.manrope(
                          textStyle:
                              TextStyle(fontSize: 20.sp, color: colorDark)),
                    ),
                    SizedBox(
                      height: screenSize.height / 45,
                    ),
                    Text('Create an Account',
                        style: GoogleFonts.manrope(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: colorDark))),
                    SizedBox(
                      height: screenSize.height / 30,
                    ),
                    Form(
                        key: globalKey,
                        child: BlocBuilder<LoginRegisterBloc,LoginRegisterState>(
  builder: (context, state) {
    if(state is ShowHide ){
      isSecure=   state.secure!;
      isSecure2=   state.secure2!;
    }
    return Column(children: [
                          TextFormField(
                              controller: name,
                              cursorColor: colorLight,
                              validator: (name) =>
                                  name!.length <= 6 ? 'Enter full name' : null,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'Full name',
                                  prefixIcon: Icon(
                                    Icons.person_outline,
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
                              controller: email,
                              cursorColor: colorLight,
                              validator: (email) => EmailValidator.validate(email!)
                                  ? null
                                  : 'Entar rigth email(example@gmail.com)',
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'Email',
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
                              cursorColor: colorLight,
                              controller: password1,
                              validator: (password1) => password1!.length <= 8
                                  ? 'short password'
                                  : null,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: colorDark,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  suffixIcon:
                                 
                                        IconButton(
                                          onPressed: () {


                                            _registerBloc!
                                                .add(ShowHideEvent(isSecure,1));
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
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none))),

                          SizedBox(
                            height: screenSize.height / 40,
                          ),

                          TextFormField(
                              obscureText: isSecure2,
                              cursorColor: colorLight,
                              controller: password2,
                              validator: (password2) => password2!.length !=
                                  password1.value.text.length
                                  ? 'confirm password'
                                  : null,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'Confirm Password',
                                  suffixIcon:  IconButton(
                                        onPressed: () {
                                          _registerBloc!
                                              .add(ShowHideEvent(isSecure2,2));
                                        },
                                        icon: isSecure2
                                            ? Icon(
                                          Icons.visibility,
                                          color: colorDark,
                                        )
                                            : Icon(
                                          Icons.visibility_off,
                                          color: colorDark,
                                        ),
                                     
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: colorDark,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none)))
                        ]);
  },
)),
                    SizedBox(
                      height: screenSize.height / 9,
                    ),
                    BlocConsumer<LoginRegisterBloc, LoginRegisterState>(
                      listener: (context, state) {
                        if (state is RegisterLoaded) {
                          var response = state.registerResponse;

                          if (response.status == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${response.message}')));
                          } else {
                            Navigator.pushNamed(context, '/mainHome');
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                          onPressed: () {
                            globalKey.currentState!.validate()
                                ? _registerBloc!.add(Register(name.value.text,
                                    email.value.text, password2.value.text))
                                : null;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorDark,
                              minimumSize: Size(
                                  screenSize.width, screenSize.height * 0.06),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: screenSize.height / 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account yet?',
                          style: GoogleFonts.abel(
                              textStyle: TextStyle(fontSize: 16.sp)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Sign In',
                              style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp, color: colorLight))),
                        )
                      ],
                    ),
                  ])),
        ),
      ),
    );
  }

  @override
  void dispose() {

_registerBloc!.close();    super.dispose();
  }
}
