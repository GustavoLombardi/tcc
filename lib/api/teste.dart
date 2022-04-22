import 'package:dio/dio.dart';
import 'package:tcc/models/repository.dart';

abstract class RepositoryAPI {
  static Future<dynamic> findrepository() async {
    List<Repositorio> lista = [];

    var response = await Dio().getUri(
      Uri.parse('https://api.github.com/users/GustavoLombardi/repos'),
    );

    try {
      if (response.statusCode == 200) {
        List<dynamic> data = List<dynamic>.from(response.data);
        for (Map<String, dynamic> i in data) {
          lista.add(Repositorio.fromMap(i));
        }
        return lista;
      } else if (response.statusCode == 404) {
        return lista;
      }
    } catch (e) {
      return lista;
    }
  }
}

//     var response = await Dio().getUri(
//         Uri.parse('https://api.github.com/users/GustavoLombardi/repos'));

//     try {
//       if (response.statusCode == 200) {
//         Map<String, dynamic> data = Map<String, dynamic>.from(response.data[0]);

//         return Repositorio.fromMap(data[0]);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }
// }



   