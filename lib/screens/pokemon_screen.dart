import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_man/controllers/pokemon_controller.dart';
import 'package:poke_man/widgets/rounded_rectangle_widget.dart';
import 'package:poke_man/widgets/text_widget.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key, required this.pageId});

  final int pageId;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  bool isFavourite = false;
  void addTofavorite() {
    setState(() {
      isFavourite = isFavourite ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pokemon = Get.find<PokemonController>().pokemonList[widget.pageId];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  left: 80.w,
                  right: 80.w,
                  child: Container(
                    height: 300.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(pokemon.img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 30.h,
                    left: 10.w,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pokemon',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              label: pokemon.name.capitalize!,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            IconButton(
                              onPressed: () {
                                addTofavorite();
                              },
                              icon: Icon(
                                isFavourite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.redAccent,
                                size: 32,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque auctor consectetur tortor vitae interdum.',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text('Abilities', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            RoundedRectangleWidget(label: pokemon.abilities[0]),
                            RoundedRectangleWidget(label: pokemon.abilities[1]),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text('Base Experience', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        RoundedRectangleWidget(label: pokemon.baseExperience.toString()),
                        const SizedBox(height: 20),
                        Text('Body Dimensions', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const TextWidget(label: 'Weight : '),
                            TextWidget(label: pokemon.weight.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const TextWidget(label: 'Height : '),
                            TextWidget(label: pokemon.height.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
