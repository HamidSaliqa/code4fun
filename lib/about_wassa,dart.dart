import 'package:code4fun/widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutWassa_page extends StatelessWidget {
  const AboutWassa_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(100, 94, 90, 90),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  child: const Icon(Icons.arrow_back_ios_sharp),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                child: const Icon(Icons.search),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      child: Image.asset("assets/wassa2.PNG",
                          fit: BoxFit.cover, width:380,height: 217,),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: const SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              ///main text
                              child: Text.rich(
                                TextSpan(
                                  text: 'The ',
                                  style: TextStyle(fontFamily: "CustomFont",fontSize:18),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Women’s Activities and Social Services Association',
                                      style: TextStyle(color: Color.fromRGBO(3, 125, 214, 1)),
                                    ),
                                    TextSpan(
                                      text: ' (WASSA) was established in 2002 as Afghanistan\'s first women’s independent organization. WASSA aims to promote women’s equal participation in socio-economic sectors of the country, is committed to seeking ways for women empowerment, and works directly with communities to bring change in the social attitude of the society in Afghanistan. WASSA throughout its lifetime has implemented various projects in Western Region committedly and accountable. WASSA has played a positive role as a civil society promoter and supported various projects successfully. Meanwhile, WASSA is known as the most capable NGO in the western region for implementing protection activities. WASSA has actively and effectively been implementing projects after the fall of the government in 2021. WASSA being the strategic partner to some donors has been supporting the society empowerment and humanitarian assistance via protection, food security, nutrition and Water, Sanitation and Hygiene as well as socioeconomic resilience projects in Western Region.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 65,
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 6, 149, 203),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(34),
                          ),
                        ),
                      ),
                      onPressed: () {
                        launchUrlString('https://wassa.org.af/about/');
                      },
                      child: const Text(
                        "Read More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "CustomFont"
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
