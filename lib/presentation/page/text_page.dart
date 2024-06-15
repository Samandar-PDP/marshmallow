import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marshmallow/presentation/bloc/love_bloc.dart';
import 'package:marshmallow/presentation/widget/my_button.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Stack(children: [
        Image.asset("assets/img/img.png",
            fit: BoxFit.cover, width: double.infinity,height: double.infinity,),
        Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(50),
                  Expanded(
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 0,
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/img/img_2.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        BlocConsumer<LoveBloc, LoveState>(
                            builder: (context, state) {
                              if (state is LoveSuccess) {
                                return TweenAnimationBuilder(
                                    tween: Tween(begin: 0, end: state.value),
                                    duration: const Duration(seconds: 2),
                                    builder: (context, v, s) {
                                      return Center(
                                          child: Text(
                                        "$v%",
                                        style: GoogleFonts.permanentMarker(
                                            fontSize: 50,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ));
                                    });
                              } else {
                                return Center(
                                    child: Text(
                                  "0",
                                  style: GoogleFonts.permanentMarker(
                                      fontSize: 50,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ));
                              }
                            },
                            listener: (context, state) {})
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.4,
                                child: TextField(
                                  style: GoogleFonts.robotoMono(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      border: InputBorder.none,
                                      hintText: "Male"),
                                ))),
                        Card(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.4,
                                child: TextField(
                                  style: GoogleFonts.robotoMono(fontSize: 18),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    border: InputBorder.none,
                                    hintText: "Female",
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: MyButton(
                        onClick: _getRandom,
                        icon: CupertinoIcons.heart_circle_fill,
                        title: "Generate",
                      )),
                  const Gap(50)
                ]))
      ]),
    );
  }
  _getRandom() {
    BlocProvider.of<LoveBloc>(context).add(const GetRandomLove("", ""));
  }
}
