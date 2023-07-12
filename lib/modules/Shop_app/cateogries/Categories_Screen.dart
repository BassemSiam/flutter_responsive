import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/cubit.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit , ShopStates>(
     listener: (context, state) {

     },
      builder:(context, state) {
       return ListView.separated(itemBuilder: (context, index) => Padding(
         padding: const EdgeInsets.all(20.0),
         child: Row(
           children: [
             Image(height: 100,width: 100,fit: BoxFit.cover,
                 image:
                 NetworkImage(ShopCubit.get(context).categoriesModel!.data!.data![index].image)),
             Text(ShopCubit.get(context).categoriesModel!.data!.data![index].name,
                 style: TextStyle(
                     fontWeight: FontWeight.bold ,
                     fontSize: 24
                 )),
             Spacer(),
             Icon(Icons.arrow_forward_rounded),
           ],
         ),
       ) ,
           separatorBuilder: (context, index) => Divider(),
           itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length);
      } ,
    );
  }
}
