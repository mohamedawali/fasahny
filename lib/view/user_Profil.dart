import 'dart:io';
import 'package:fasahny/bloc/profile/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/color.dart';
import '../models/profileResponseModel.dart';

class UserProfile extends StatefulWidget {
  final ProfileResponseModel? profileData;
  const UserProfile({Key? key, required this.profileData}) : super(key: key);

  @override
  State<UserProfile> createState() => _StateUserProfile();
}

class _StateUserProfile extends State<UserProfile> {
  late ProfileResponseModel profileData;
  String? images;
  TextEditingController? name;
  TextEditingController? email;
  ProfileBloc? bloc;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
 profileData=   widget.profileData!;
  name=TextEditingController(text: profileData.data!.username);
email= TextEditingController(text: profileData.data!.email);
 bloc = BlocProvider
        .of<ProfileBloc>(context);
    bloc!.add(GetImage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 80,backgroundColor: colorDark,
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is LoadedImage) {
                            images = state.image;
                            return CircleAvatar(
                                radius: 75,
                                backgroundImage: NetworkImage("$images"));
                          }
                          return  const CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage("https://media.istockphoto.com/id/587805156/vector/profile-picture-vector-illustration.jpg?s=612x612&w=0&k=20&c=gkvLDCgsHH-8HeQe7JsjhlOY6vRBJk_sKW9lyaLgmLo="));
                        },
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () => pickImage(),
                            icon: const Icon(Icons.camera_alt)))
                  ])),
              SizedBox(
                height: 80.h,
              ),
              Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                        controller: name,
                        validator: (name) =>
                            name!.length < 6 ? 'Enter full name' : null,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            prefixIcon:  Icon(Icons.person_outline,color: colorDark,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none))),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                        enabled: false,
                        controller: email,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            prefixIcon:  Icon(Icons.email_outlined,color: colorDark,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none))),
                    SizedBox(
                      height: 80.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                                            formKey.currentState!.validate()
                            ? bloc!.add(UpdateProfileData(name!.value.text))
                            : null;
                        Navigator.popAndPushNamed(context, "/mainHome");
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: colorDark,
                          minimumSize:
                              Size(screenSize.width, screenSize.height * 0.06),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    )
                  ]))
            ]),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    File imageFile = File(file!.path);
     bloc!.add(SaveImage(imageFile));
    setState(() {

    });
  }

}
