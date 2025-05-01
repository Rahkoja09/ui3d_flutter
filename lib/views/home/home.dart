import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:ui3d_defi/views/appbar/appbar.dart';
import 'package:ui3d_defi/views/bottomNavigationBar/bottomBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

O3DController my3DController = O3DController();
PageController myPageControlleur = PageController();

int page = 0;

class _HomeState extends State<Home> {
  double thet = 0;
  double fi = 60;
  double radius = 6;
  void _handleBottomTap(int index) {
    myPageControlleur.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    setState(() {
      page = index;

      // Exemple : change l'angle selon l'icône
      if (index == 0) {
        thet = 0;
        fi = 60;
        radius = 6;
      } else if (index == 1) {
        thet = 1;
        fi = 90;
        radius = 6;
      } else if (index == 2) {
        thet = 90;
        fi = 90;
        radius = 10;
      } else if (index == 3) {
        thet = 180;
        fi = 90;
        radius = 10;
      }

      // Met à jour la caméra dans le contrôleur
      my3DController.cameraOrbit(thet, fi, radius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Appbar(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            O3D(
              src: 'assets/Models/3D/free_porsche_911_carrera_4s.glb',
              controller: my3DController,
              ar: false,
              autoPlay: true,
              autoRotate: false,
              cameraControls: false,
              interactionPrompt: InteractionPrompt.none,
              cameraOrbit: CameraOrbit(thet, fi, radius),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Porsche",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: " 911 Carrera 4s",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "\nBelgian",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [TextSpan(text: " Legend Edition")],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 90.0, left: 33, right: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Garantissent d'incroyables sensations. Équipé du Pack Sport Chrono et de la fonction de départ automatisé Launch Control",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "\n\n\$169,800",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Porsche".toUpperCase(),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    fontFamily: "porsche",
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(top: 550),
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: myPageControlleur,
                  children: [
                    Center(),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "100 km/h en ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "3,4",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " secondes.",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: "Pour une vitesse",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: " maximale de ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " 301 km/h.",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Consommation de ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "13,1L/100km",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " en ville.",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: "Mais seulement ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "10,2L/100km",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " sur Autoroute",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "six cylindres biturbo de",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: " 3,0 litres",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " à 450 cheveaux,",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: "Et son maximum de ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "530 Nm ",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "garantis",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottombar(onTap: _handleBottomTap),
    );
  }
}
