import 'package:get/get.dart';
import 'package:tcc/api/teste.dart';
import 'package:tcc/models/repository.dart';

class RepositoryController extends GetxController {
  RxInt id = 0.obs;

  RxString name = "".obs;

  RxString description = "".obs;

  RxString url = "".obs;

  Future<String> login() async {
    try {
      Repositorio response = await RepositoryAPI.findrepository();
      id.value = response.id!;
      name.value = response.name!;
      description.value = response.description ?? 'teste';
      url.value = response.url!;
      return "Login realizado com sucesso!";
    } catch (e) {
      return "Erro";
    }
  }
}
