import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro/home.dart';
import 'package:intro/onboard_model.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        actions: [TextButton(onPressed: () {}, child:  Text(
                            "Quitter",
                            style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14, color: Color(0xFF1B2E35))),
                          ),)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(screens[index].image),
                  SizedBox(
                    height: 10.0,
                    child: ListView.builder(
                        itemCount: screens.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex==index ?25.0 : 8.0,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF1B2E35),
                                    borderRadius: BorderRadius.circular(10)),
                              )
                            ],
                          );
                        }),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B2E35),),) 
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style:  GoogleFonts.montserrat(
                      textStyle: const TextStyle(fontSize: 16, color: Color(0xFF1B2E35)),) ,
                  ),
                  InkWell(
                    onTap: () {
                      if (index == screens.length - 1) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const Home()));
                      }
                      _pageController.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.bounceIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFC801),
                          borderRadius: BorderRadius.circular(15)),
                      child:  Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Suivant",
                            style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16, color: Color(0xFF1B2E35))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.arrow_forward_sharp, color: Color(0xFF1B2E35),)
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
