import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/cubit.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';
import 'package:untitled/models/Shop_app_model/Categories_model.dart';
import 'package:untitled/models/Shop_app_model/Home_model.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<ShopCubit, ShopStates>(
      listener:(context, state) {
        if(state is ShopLoadingHomeDataState) {
        }
      },
      builder:  (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null &&  ShopCubit.get(context).categoriesModel != null,
          builder: (context) {
            return ProdectBulider(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel! ,context );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }



  Widget ProdectBulider(HomeModel model , CategoriesModel categoriesModel ,context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data?.banners!.map((e) =>
                Image(image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
                ) ).toList(),
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration:Duration(seconds:1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,



            )),
        SizedBox(
          height: 30,),
        Text('Categories',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800
        )),
        SizedBox(
          height: 20,),
        Container(
          height: 100,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  buildCategoriesItem(categoriesModel.data!.data! [index]),
              separatorBuilder:(context, index) =>  SizedBox(width: 12,),
              itemCount: categoriesModel.data!.data!.length),
        ),
        SizedBox(
          height: 20,),
        Text('New Products',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800
            )),
        SizedBox(
          height: 20,),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            childAspectRatio: 1 / 1.3 ,
            crossAxisSpacing: 2 ,
            mainAxisSpacing: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2 ,
            children: List.generate(model.data!.products!.length,
                  (index) => buildGridProduct(model.data!.products![index], context) ),),
        )
      ],
    ),
  );
  Widget buildCategoriesItem(DataModel model) =>Stack(
    children: [
      Image(image:
      NetworkImage(model.image),
        fit: BoxFit.cover , height: 100,width: 100,),
      Container(
        color: Colors.black.withOpacity(0.8),
        width: 100,
        child: Text(model.name ,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
    ],
  );
  Widget buildGridProduct(ProductModel model , context) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment:AlignmentDirectional.bottomStart ,
          children: [
            Image(image: NetworkImage(model.image!),
            width: double.infinity,
             height: 200,),
            if(model.discount !=0)
               Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('Discount' ,
              style: TextStyle(
                backgroundColor: Colors.red,
                color: Colors.white,
                fontSize: 14,
              ),),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text('PRICE : ' '${model.price!.round()}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 , color:Colors.teal),),
                  SizedBox(width: 15),
                  if(model.discount !=0)
                  Text('OLD : ''${model.oldPrice!.round()}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12 ,
                      color:Colors.black54 ,
                      decoration: TextDecoration.lineThrough,),),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        ShopCubit.get(context).ChangeFavorites(model.id!);
                      },
                      icon:ShopCubit.get(context).Favorites[model.id]! ?
                      Icon(Icons.favorite,color: Colors.red,size: 30,):
                      Icon(Icons.favorite_border ,size: 30,))
                ],
              ),
            ],
          ),
        ),



      ],
    ),
  );

}
