import 'package:get/get.dart';
import 'package:tcc/api/usuarios_api.dart';
import 'package:tcc/models/usuario.dart';

class LoginController extends GetxController {
  RxInt idsepconf = 0.obs;

  RxString setor = "".obs;

  RxString nomeusu = "".obs;

  RxInt tipo = 0.obs;

  RxString status = "".obs;

  Future<Object> login(String nomeusu, String senha) async {
    try {
      Usuario response = await SepConfApi.login(nomeusu, senha);
      idsepconf.value = response.codusu!;
      setor.value = response.dpto;
      this.nomeusu.value = response.nomeusu!;
      tipo.value = response.codgrupo;
      status.value = response.status;

      return tipo.value;
    } catch (e) {
      return "Erro";
    }
  }
}
