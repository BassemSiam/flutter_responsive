import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/cubit/cubit.dart';
import 'package:untitled/modules/counter/cubit/states.dart';

class  counterScreen2 extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit , CounterStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                    "counter"
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){
                          CounterCubit.get(context).minus();
                          if(CounterCubit.get(context).counter<0){
                            CounterCubit.get(context).counter=0;
                            print("not allowed negative numbers");
                          }
                        },
                            child: Text("MINUS")),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text('${CounterCubit.get(context).counter}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 60,
                            ),),
                        ),
                        TextButton(onPressed: (){

                          CounterCubit.get(context).plus();

                        },
                            child: Text("PLUS")),
                      ],
                    ),
                    SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: (){
                        CounterCubit.get(context).restart();
                      },
                      child: Icon(Icons.restart_alt , size: 50),),
                    Text("Reset"
                      ,style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {

          },)
    );
  }
}


