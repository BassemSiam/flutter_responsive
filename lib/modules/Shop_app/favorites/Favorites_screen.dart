import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/cubit.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context ) {
    return
      BlocConsumer<ShopCubit , ShopStates>(
      listener: (context, state) {
      },
      builder:(context, state) { 
        return ConditionalBuilder(
          condition: ShopCubit.get(context).getFavoritesModel!.data!.data!.isNotEmpty,
          builder: (context) =>  ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          alignment:AlignmentDirectional.bottomStart ,
                          children: [
                            Image(image: NetworkImage(ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.image!),
                              width: 150,
                              height: 150,),
                            if(ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.discount! != 0)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('Discount' ,
                                  style: TextStyle(
                                    backgroundColor: Colors.red,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),),
                              )
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text('PRICE : ' '${ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.price!.round()}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 , color:Colors.teal),),
                                SizedBox(width: 15),
                                if(ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.discount! != 0)
                                  Text('OLD : ''${ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.oldPrice!.round()}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12 ,
                                      color:Colors.black54 ,
                                      decoration: TextDecoration.lineThrough,),),
                                Spacer(),
                                IconButton(
                                    onPressed: (){
                                      ShopCubit.get(context).ChangeFavorites(ShopCubit.get(context).homeModel!.data!.products![index].id!);
                                    },
                                    icon:
                                    ShopCubit.get(context).Favorites[ShopCubit.get(context).getFavoritesModel!.data!.data![index].product!.id]! ?
                                    Icon(Icons.favorite,color: Colors.red,size: 30,):
                                    Icon(Icons.favorite_border ,size: 30,))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ) ,
              separatorBuilder: (context, index) => Divider(),
              itemCount: ShopCubit.get(context).getFavoritesModel!.data!.data!.length),
          fallback: (context) => Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.heart_broken , size: 40,color: Colors.grey,),
              Text('No Favorites added',style:
                TextStyle(
                  color: Colors.grey,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle:FontStyle.italic,
                ),),

            ],
          )),
        );
      } ,
    );
  }




}
