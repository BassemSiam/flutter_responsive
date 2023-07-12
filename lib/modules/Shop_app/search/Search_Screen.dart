import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Shop_app/search/cubit/cubit.dart';
import 'package:untitled/modules/Shop_app/search/cubit/states.dart';

class ShopSearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var SearchController = TextEditingController();
    return BlocProvider(
      create: (context) => ShopSearchCubit() ,
      child: BlocConsumer<ShopSearchCubit , ShopSearchStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      // onChanged: (text){
                      //   ShopSearchCubit.get(context).GetSearchData(text);
                      // },

                      onFieldSubmitted: (text){
                        ShopSearchCubit.get(context).GetSearchData(text);
                      },
                      controller: SearchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText:  'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'No search found';
                        }
                        return null;
                      },

                    ),
                    SizedBox(height: 15,),
                    if(state is ShopSearchLoadingStates)
                    LinearProgressIndicator(),
                    SizedBox(height: 20,),
                    if(state is ShopSearchSuccessStates)
                    Expanded(
                      child: ListView.separated(
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
                                        Image(image: NetworkImage(ShopSearchCubit.get(context).searchModel!.data!.data![index].image!),
                                          width: 150,
                                          height: 150,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(ShopSearchCubit.get(context).searchModel!.data!.data![index].name!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Text('PRICE : ' '${ShopSearchCubit.get(context).searchModel!.data!.data![index].price!.round()}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 , color:Colors.teal),),
                                            SizedBox(width: 15),
                                            Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: ShopSearchCubit.get(context).searchModel!.data!.data!.length),
                    )
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}
