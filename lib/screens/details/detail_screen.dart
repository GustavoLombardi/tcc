import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcc/screens/details/components/schedule_card.dart';
import 'package:tcc/screens/themes/constant.dart';
import 'package:tcc/screens/themes/styles.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final _name;
  final _description;
  final _imageUrl;

  const DetailScreen(this._name, this._description, this._imageUrl);

  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não pode executar o link $url');
    }
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/detail_illustration.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/3dots.svg',
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            _imageUrl,
                            height: 120,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _description,
                                style: TextStyle(
                                  color: AppColors.blue.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.secundary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL('tel:12345678');
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kYellowColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchLink(
                                            'https://www.google.com/maps/place/UNIP+-+Tatuap%C3%A9/@-23.5283106,-46.5675048,17z/data=!3m1!4b1!4m5!3m4!1s0x94ce5eda1ebe9625:0x92fde7c6c7b0739a!8m2!3d-23.5283106!4d-46.5653161');
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/chat.svg',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Informações da Faculdade',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Descrição da Faculdade',
                        style: TextStyle(
                          height: 1.6,
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Serviços Oferecidos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ScheduleCard(
                        'Fisioterapia',
                        'Segunda 10:00 às 12:00',
                        '22',
                        'Mar',
                        AppColors.secundary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ScheduleCard(
                        'Nutrição',
                        'Segunda 10:00 às 12:00',
                        '23',
                        'Mar',
                        AppColors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ScheduleCard(
                        'Consulta',
                        'Segunda 10:00 às 12:00',
                        '24',
                        'Mar',
                        AppColors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ScheduleCard(
                        'Consulta',
                        'Segunda 10:00 às 12:00',
                        '14',
                        'Jan',
                        AppColors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
