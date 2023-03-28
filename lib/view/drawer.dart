import 'package:fasahny/bloc/loginRegister/login_register_bloc.dart';
import 'package:fasahny/bloc/profile/profile_bloc.dart';
import 'package:fasahny/constant/color.dart';
import 'package:fasahny/models/profileResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatelessWidget {
  String? images;
  ProfileResponseModel? profileData;
 DrawerPage(this.profileData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginRegisterBloc loginRegisterBloc =
        BlocProvider.of<LoginRegisterBloc>(context);
    BlocProvider.of<ProfileBloc>(context).add(GetImage());
    Size screenSize = MediaQuery.of(context).size;
    return Container(   color: colorLight,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            color: colorDark,
            height: screenSize.height / 3,
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is LoadedImage) {
                 images=     state.image;
                 print('im$images');
                  return    CircleAvatar(
                          radius: 50, backgroundImage: NetworkImage("$images"));
                    }
                    return  const  CircleAvatar(
                        radius: 50, backgroundImage: NetworkImage("https://media.istockphoto.com/id/587805156/vector/profile-picture-vector-illustration.jpg?s=612x612&w=0&k=20&c=gkvLDCgsHH-8HeQe7JsjhlOY6vRBJk_sKW9lyaLgmLo="));
      }

                ),
                SizedBox(
                  height: 10.w,
                ),
                Text(
                  profileData!.data!.username == ''
                      ? ''
                      : "${profileData!.data!.username}",
                  style:GoogleFonts.abel(textStyle:  TextStyle(fontSize: 20.sp)),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/profile',
                  arguments: profileData),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Profile',
                    style:
                        GoogleFonts.manrope(textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10.w,
            ),

            BlocListener<LoginRegisterBloc, LoginRegisterState>(
              listener: (context, state) {
                if (state is Logouts) {
                  Navigator.popAndPushNamed(context, '/');
                }
              },
              child: InkWell(
                onTap: () => loginRegisterBloc.add(Logout()),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Log out',
                      style:
                      GoogleFonts.manrope(textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold))
                    ),
                  ],
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
