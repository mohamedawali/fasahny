import 'package:fasahny/bloc/loginRegister/login_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ch extends StatelessWidget {
  const Ch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<LoginRegisterBloc>(context).add(CheckLoginEvent());
    return BlocListener<LoginRegisterBloc, LoginRegisterState>(
      listener: (context, state) {
if(state is CheckLoginState){
  print('st${state.token}');
          if(state.token ==null){

  Navigator.pushNamed(context, '/signIn');   }else{
            Navigator.pushNamed(context, '/mainHome');

          }
}

  },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(color: Colors.cyan),


      ),
    );
  }
}
