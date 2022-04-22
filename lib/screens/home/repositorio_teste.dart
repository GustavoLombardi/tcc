import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/controllers/repository_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositorioTeste extends StatefulWidget {
  const RepositorioTeste({Key? key}) : super(key: key);

  @override
  State<RepositorioTeste> createState() => _RepositorioTesteState();
}

class _RepositorioTesteState extends State<RepositorioTeste> {
  final controller = Get.put(RepositoryController());

  @override
  void initState() {
    controller.login();
    super.initState();
  }

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
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(controller.id.value.toString()),
            Text(controller.name.value),
            Text(controller.description.value),
            Text(controller.url.value),
            TextButton(
              child: const Text('Ir para o repositorio'),
              onPressed: () {
                _launchLink(controller.url.value);
              },
//
              // Navigator.pushNamed(context, '/repositorio');
            ),
          ],
        ),
      ),
    );
  }
}
