import 'package:bloc_counter_st28/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Logic 1 one time - UI ( Desktop, Android, IOS, Website )
  // Bloc -> Business Logic
  // App (2 section) -> UI / Logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterChangedSuccessfully) {
                  return Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }

                if(state is CounterGreaterThanTen) {
                  return Text(
                    'Congratulations !! 🔥 ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }

                return const Text('Zero');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
