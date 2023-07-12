import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News_app/Cubit/cubit.dart';
import 'package:untitled/layout/News_app/Cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state) => (context, state) {} ,
      builder: (context, state) {
        var List = NewsCubit.get(context).Search;

        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller:searchControlar ,
                onChanged: (value){
                  NewsCubit.get(context).getSearch(value);
                },
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty){
                    return 'please enter the text';
                  }
                  return null;},
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),

                ),
              ),
            ),
            Expanded(child: ArticleBuilder(List, context, IsSearch: true))

          ],
        ),
      );
      },
    );
  }
}
