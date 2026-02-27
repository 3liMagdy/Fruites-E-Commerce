


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/Auth/presentation/manger/cubit/auth_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('Home'),
        SizedBox(height:50,),
        IconButton(onPressed: (){
         context.read<AuthCubit>().signOut();
        }, icon: Icon( Icons.logout))
      ],
    ));
  }
}