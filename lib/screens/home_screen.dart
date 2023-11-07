import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poke_man/controllers/pokemon_controller.dart';
import 'package:poke_man/models/pokemon_model.dart';
import 'package:poke_man/routes/app_routes.dart';
import 'package:poke_man/widgets/rounded_rectangle_widget.dart';
import 'package:poke_man/widgets/text_widget.dart';
import 'package:restart_app/restart_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const TextWidget(
          label: 'Top 10 Pokemon',
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Restart.restartApp();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              Get.find<PokemonController>().clearLocalStorage();
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: GetBuilder<PokemonController>(builder: (pokemonController) {
        List<PokemonModel> pokemonList = pokemonController.pokemonList;
        return _buildListView(pokemonList);
      }),
    );
  }

  ListView _buildListView(List<PokemonModel> pokemonList) {
    return ListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.getPokemonScreen(index));
            },
            child: Row(
              children: [
                //image section
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Colors.white,
                    border: Border.all(width: 0.3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: SizedBox(
                    child: Image(
                      image: NetworkImage(
                        pokemonList[index].img,
                      ),
                    ),
                  ),
                ),
                //text section
                Expanded(
                  child: Container(
                    height: 82.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextWidget(
                            label: pokemonList[index].name.capitalize!,
                          ),
                          Row(
                            children: [
                              RoundedRectangleWidget(label: pokemonList[index].abilities[0]),
                              RoundedRectangleWidget(label: pokemonList[index].abilities[1]),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
