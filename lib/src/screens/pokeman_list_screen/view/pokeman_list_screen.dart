import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokebook_app/src/app/bloc/bloc/app_bloc.dart';
import 'package:pokebook_app/src/routes/app_routes.gr.dart';
import 'package:pokebook_app/src/screens/pokeman_list_screen/data/pokemon_mock_list.dart';
import 'package:pokebook_app/src/screens/pokeman_list_screen/model/pokemon_list_model.dart';
import 'package:pokebook_app/src/screens/pokeman_list_screen/view/components/pagination_view.dart';
import 'package:pokebook_app/src/screens/pokeman_list_screen/view/components/pokeman_list_card.dart';
import 'package:pokebook_app/src/styles/text_styles.dart';

@RoutePage()
class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreen();
}

class _PokemonListScreen extends State<PokemonListScreen> {
  int currentPage = 1;
  final int itemsPerPage = 4;
  final List<Pokemon> pokemonList = mockPokemonList;

  int get totalPages => (pokemonList.length / itemsPerPage).ceil();

  void nextPage() {
    setState(() {
      if (currentPage < totalPages) currentPage++;
    });
  }

  void previousPage() {
    setState(() {
      if (currentPage > 1) currentPage--;
    });
  }

  void onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();

    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = (startIndex + itemsPerPage).clamp(0, pokemonList.length);
    List<Pokemon> paginatedList = pokemonList.sublist(startIndex, endIndex);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Top bar
            Container(
              height: MediaQuery.paddingOf(context).top + 72,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding:
                  EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Logo
                    SvgPicture.asset(
                      'assets/svgs/logo.svg',
                      height: 74,
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(width: 10),
                    // App name
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Poké',
                              style: TextStyles.label1,
                            ),
                            TextSpan(
                              text: ' book',
                              style: TextStyles.label1.copyWith(
                                color: appBloc.state.themeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Theme color selector
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 42,
                        width: 42,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xFF868686),
                            width: 1,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: appBloc.state.themeColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                maxLines: 1,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF868686),
                      width: 1.0,
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF7B7B7B),
                  ),
                ),
              ),
            ),

            // List of cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: paginatedList
                      .length, // Number of cards in the current page
                  itemBuilder: (context, index) {
                    final pokemon = paginatedList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InkWell(
                        onTap: () {
                          context.router
                              .push(PokemonDetailsRoute(pokemon: pokemon));
                        },
                        child: PokemonListCard(
                          image: pokemon.image,
                          title: pokemon.title,
                          subtitle1: pokemon.subtitle1,
                          subtitle2: pokemon.subtitle2,
                          heroTag: 'pokemon_${startIndex + index}',
                          pokemon: pokemon,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Pagination
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: PaginationView(
                page: currentPage,
                totalPages: totalPages,
                nextPage: nextPage,
                previousPage: previousPage,
                onPageChanged: onPageChanged,
                appBloc: appBloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
