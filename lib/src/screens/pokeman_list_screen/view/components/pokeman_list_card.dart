import 'package:flutter/material.dart';
import 'package:pokebook_app/src/styles/text_styles.dart';
import 'package:pokebook_app/src/screens/detail_screen/pokemon_details_screen.dart';
import 'package:pokebook_app/src/screens/pokeman_list_screen/model/pokemon_list_model.dart';

class PokemonListCard extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle1;
  final String subtitle2;
  final String heroTag;
  final Pokemon pokemon;

  const PokemonListCard({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle1,
    required this.subtitle2,
    required this.heroTag,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsScreen(pokemon: pokemon),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 60),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.all(2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23.94),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE1E1E1),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.21),
                        color: const Color(0xFFF1F1F1),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      title,
                      style: TextStyles.hero2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    if (subtitle1.isNotEmpty || subtitle2.isNotEmpty)
                      Container(
                        height: 38,
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (subtitle1.isNotEmpty)
                                buildSubTitleContainer(subtitle1),
                              if (subtitle2.isNotEmpty)
                                buildSubTitleContainer(subtitle2),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: Hero(
                    tag: heroTag,
                    child: Image.asset(
                      image,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSubTitleContainer(String subtitle) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFF1F1F1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
          Text(
            subtitle,
            style: TextStyles.label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
