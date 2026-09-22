import 'package:flutter/material.dart';
import 'package:flutter_anim_controller/finance_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const FinanceHome(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101827),
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.only(left: 28, right: 28, top: 55),
            decoration: BoxDecoration(
              color: Color(0xFF182438),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A QUIET MOMENT',
                  style: TextStyle(
                    color: Color(0xFF9AAAC2),
                    fontSize: 14,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Rainy Day :)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              child: Column(
                children: [
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF26364D),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFF50627A),
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 28,
                          right: 30,
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color(0xFFDDE5EF),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 35,
                          child: Row(
                            children: [
                              Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF70829A),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                height: 48,
                                width: 48,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF70829A),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF70829A),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Rain Drops
                        Positioned(
                          top: 125,
                          left: 55,
                          child: Column(
                            children: [
                              Container(
                                height: 35,
                                width: 2,
                                color: const Color(0xFF9DB5D0),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 25,
                                width: 2,
                                color: const Color(0xFF9DB5D0),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: 145,
                          left: 110,
                          child: Column(
                            children: [
                              Container(
                                height: 28,
                                width: 2,
                                color: const Color(0xFF9DB5D0),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 38,
                                width: 2,
                                color: const Color(0xFF9DB5D0),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: 135,
                          right: 105,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                width: 2,
                                color: const Color(0xFF9DB5D0),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: 25,
                                width: 2,
                                color: const Color(0xFF9DB5D0),
                              ),
                            ],
                          ),
                        ),

                        // Window Bottom
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1B283A),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(26),
                                bottomRight: Radius.circular(26),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Rainy Window",
                                style: TextStyle(
                                  color: Color(0xFFB8C7D9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                   Spacer(),

                  // Coffee Section
                  Container(
                    width: double.infinity,
                    padding:  EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 22,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF182438),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6A77A),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.local_cafe,
                            color: Color(0xFF3B2A22),
                            size: 30,
                          ),
                        ),

                         SizedBox(width: 16),

                         Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Slow down.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "Enjoy the rain & a little peace.",
                                style: TextStyle(
                                  color: Color(0xFF9AAAC2),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                   SizedBox(height: 18),

                  // Replay Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon:  Icon(Icons.refresh),
                      label:  Text(
                        "Replay Animation",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD6A77A),
                        foregroundColor: const Color(0xFF202936),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),

                 SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
