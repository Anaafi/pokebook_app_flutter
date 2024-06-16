import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokebook_app/src/app/bloc/bloc/app_bloc.dart';
import 'package:pokebook_app/src/routes/app_routes.gr.dart';
import 'package:pokebook_app/src/screens/home_screen/bloc/bloc/home_screen_bloc.dart';
import 'package:pokebook_app/src/styles/text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // logo
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 30),
                        child: SvgPicture.asset(
                          'assets/svgs/logo.svg',
                        ),
                      ),
                      // app name
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Poké',
                              style: TextStyles.hero1.copyWith(
                                fontSize: 48,
                              ),
                            ),
                            TextSpan(
                              text: ' book',
                              style: TextStyles.hero1.copyWith(
                                fontSize: 48,
                                color: appBloc.state.themeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // text description
                      Text(
                        'Largest Pokémon index with information about every Pokemon you can think of.',
                        style: TextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 100),
                      // search field
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(
                              color: appBloc.state.themeColor,
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(
                              color: appBloc.state.themeColor,
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(
                              color: appBloc.state.themeColor,
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: 'Enter pokemon name',
                          hintStyle: TextStyles.body.copyWith(
                            color: const Color(0xFF7B7B7B),
                          ),
                          suffixIcon: InkWell(
                            child: Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: appBloc.state.themeColor,
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const PokemonListRoute());
                        },
                        child: Text(
                          'View All',
                          style: TextStyles.body.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
