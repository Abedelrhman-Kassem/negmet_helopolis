import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:negmet_helioples/Helper/language/cubit/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negmet_helioples/Features/Auth/intro/intro_screen.dart';
import 'package:negmet_helioples/models/language/app_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            home: const IntroScreen(),
          );
        },
      ),
    );
  }
}
// void main() => runApp(const AppProvider());

// class AppProvider extends StatelessWidget {
//   const AppProvider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         BlocProvider<LocaleCubit>(
//           create: (context) => LocaleCubit(),
//         ),
//       ],
//       child: const MyApp(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       supportedLocales: const [Locale('en'), Locale('ar')],
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate
//       ],
//       localeResolutionCallback: (deviceLocale, supportedLocales) {
//         for (var locale in supportedLocales) {
//           if (deviceLocale != null &&
//               deviceLocale.languageCode == locale.languageCode) {
//             return deviceLocale;
//           }
//         }

//         return supportedLocales.first;
//       },
//       debugShowCheckedModeBanner: false,
//       home: const IntroScreen(),
//     );
//   }
// }

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       locale: Locale('en'),
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         Locale('en', ''),
//         Locale('ar', ''),
//       ],
//       debugShowCheckedModeBanner: false,
//       home: IntroScreen(),
//     );
//   }
// }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'hello_msg'.tr(context),
          ),
        ],
      ),
    );
  }
}
