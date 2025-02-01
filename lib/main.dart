import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pen_vibes/bloc/user_bloc/event_state.dart';
import 'package:pen_vibes/bloc/user_bloc/user_bloc.dart';
import 'package:pen_vibes/bloc/user_bloc/user_event.dart';
import 'package:pen_vibes/core/service_locator.dart';
import 'package:pen_vibes/models/user_model.dart';

import 'core/widgets/custom_snackbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PenVides'),
        ),
        body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
          if (state is UserCreatedState) {
            CustomSnackbar.showSnackbar(state.message,
                backgroundColor: Colors.green);
          } else if (state is UserErrorState) {
            CustomSnackbar.showSnackbar(state.message,
                backgroundColor: Colors.red);
          }
        }, builder: (context, state) {
          if (state is UserLoadingState) {
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to PenVides App',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      UserModel userModel = UserModel(
                          name: "Anil Jadhav",
                          email: "jadhav@gmail.com",
                          phone: "7896541230",
                          about: "Anil is java developer");
                      context.read<UserBloc>().add(GetUsers());
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add User"))
              ],
            ),
          );
        }),
      ),
    );
  }
}
