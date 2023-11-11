import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_man/controllers/pokemon_controller.dart';
import 'package:poke_man/models/pokemon_model.dart';
import 'package:poke_man/widgets/rounded_rectangle_widget.dart';
import 'package:poke_man/widgets/text_widget.dart';

import '../services/image_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key, required this.pageId});

  final int pageId;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PokemonController>(builder: (pokemonController) {
        var pokemon = pokemonController.pokemonList[widget.pageId];
        String status = pokemonController.status.contains('local') ? 'Local' : 'Server';
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    left: 80.w,
                    right: 80.w,
                    child: SizedBox(
                      height: 300.h,
                      width: 220.w,
                      child: status == 'Local'
                          ? ImageService().getImageFromLocalStorage(pokemon.name)
                          : Image(
                              image: NetworkImage(
                                pokemon.img,
                              ),
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: TextWidget(
                                      label: 'Failed to fetch from Network', fontSize: 10, fontWeight: FontWeight.w400),
                                );
                              },
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
                    padding: EdgeInsets.only(top: 40.h, right: 14.w, left: 14.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pokemon',
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                label: pokemon.name.capitalize!,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              IconButton(
                                onPressed: () {
                                  PokemonModel savedPokemon = pokemon.copyWith(isFavourite: pokemon.isFavourite ? false : true);
                                  pokemonController.addToSaved(savedPokemon);
                                },
                                icon: Icon(
                                  pokemon.isFavourite ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.redAccent,
                                  size: 32,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Pocket monsters, known as Pokémon, are creatures with various abilities and types, often captured and trained by trainers for battles.',
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text('Abilities', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              RoundedRectangleWidget(label: pokemon.abilities[0]),
                              RoundedRectangleWidget(label: pokemon.abilities[1]),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text('Base Experience', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                          SizedBox(height: 10.h),
                          RoundedRectangleWidget(label: pokemon.baseExperience.toString()),
                          SizedBox(height: 20.h),
                          Text('Body Dimensions', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                          SizedBox(height: 10.h),
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
                      margin: EdgeInsets.only(top: 10.h),
                      width: 50.w,
                      height: 5.h,
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
        );
      }),
    );
  }
}
