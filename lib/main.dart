// import 'package:flutter/material.dart';
// import 'package:sports/presentation/screens/splash_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/presentation/cubit/country_cubit.dart';
import 'package:sports/presentation/screens/country_selection_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/leagues_screen.dart';
import 'presentation/screens/teams_screen.dart';
import 'presentation/screens/players_screen.dart';
import 'presentation/cubit/leagues_cubit.dart';
import 'presentation/cubit/teams_cubit.dart';
import 'presentation/cubit/players_cubit.dart';
import 'data/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountriesCubit(repository)),
        BlocProvider(create: (context) => LeaguesCubit(repository)),
        BlocProvider(create: (context) => TeamsCubit(repository)),
        BlocProvider(create: (context) => PlayersCubit(repository)),
      ],
      child: MaterialApp(
        title: 'Sports App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // '/': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/': (context) => HomeScreen(),
          '/country-selection': (context) => const CountrySelectionScreen(),
          '/leagues': (context) => LeaguesScreen(
                countryId: cuntryGlob,
              ),
          '/teams': (context) => TeamsScreen(
              leagueId: ModalRoute.of(context)!.settings.arguments as int),
          '/players': (context) => PlayersScreen(
              teamId: ModalRoute.of(context)!.settings.arguments as int),
        },
      ),
    );
  }
}
