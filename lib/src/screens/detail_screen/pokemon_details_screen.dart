import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokebook_app/src/screens/detail_screen/components/customized_tab_bar.dart';
import 'package:pokebook_app/src/styles/text_styles.dart';
import 'package:pokebook_app/src/screens/pokeman_list_screen/model/pokemon_list_model.dart';

@RoutePage()
class PokemonDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({super.key, required this.pokemon});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void dispose() {
    tabController.removeListener(() {});
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {});
    });
  }

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomizedTabBar(tabController: tabController),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            Stack(
              alignment: Alignment.topCenter,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeIn,
                  height: 283,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xFFF1F1F1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                ),

                /// Back button
                Positioned(
                  top: 20 + MediaQuery.paddingOf(context).top,
                  left: 20,
                  child: InkWell(
                    onTap: () => (),
                    child: Container(
                      height: 38,
                      width: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.29),
                      ),
                      child: SvgPicture.asset(
                        'assets/svgs/arrow-left.svg',
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 65 + MediaQuery.paddingOf(context).top,
                    ),
                    Hero(
                      tag: widget.pokemon.title,
                      child: RepaintBoundary(
                        key: globalKey,
                        // child: SvgPicture.asset(

                        //   height: 260,
                        //   fit: BoxFit.contain,
                        // ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AutoSizeText(
                widget.pokemon.title,
                style: TextStyles.hero1.copyWith(
                  fontSize: 56,
                ),
                maxLines: 2,
              ),
            ),

            /// Types
            Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFF1F1F1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        widget.pokemon.subtitle1,
                        style: TextStyles.label,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFF1F1F1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/logo.svg',
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.pokemon.subtitle2,
                        style: TextStyles.label,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // if (tabController.index == 0)
            //   AboutTabView()
            // else if (tabController.index == 1)
            //   StatsTabView()
            // else
            //   SimilarTabView(),
          ],
        ),
      ),
    );
  }
}
