import 'package:counter_app_sat28_new/counter_cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: context.read<CounterCubit>().textColor,
            ),
            home: CounterScreen(),
          );
        },
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              'Counter App ${context.read<CounterCubit>().value.toString()}',
              style: TextStyle(
                color: context.read<CounterCubit>().textColor,
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  context.read<CounterCubit>().value.toString(),
                  style: TextStyle(
                    color: context.read<CounterCubit>().textColor,
                    fontSize: 30,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().incrementOne();
              },
              child: Text(
                '+1',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().decrementOne();
              },
              child: Text(
                '-1',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().incrementTwenty();
              },
              child: Text(
                '+20',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().decrementTwenty();
              },
              child: Text(
                '-20',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
