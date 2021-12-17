import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

const token = 'b6c0014a81d51e5ebd45977bdc4afeac';

class CepAbertoService extends GetConnect {
  Future<CepAbertoAddress> getAddressFromCep(String cep) async {
    print('cep:$cep');
    final cleanCep = cep.replaceAll('.', '').replaceAll('-', '');
    final endpoint = "https://www.cepaberto.com/api/v3/cep?cep=$cleanCep";

    try {
      final response =
          await get(endpoint, headers: {'Authorization': 'Token token=$token'});

      if (response.body.isEmpty) {
        return Future.error('CEP Inválido');
      }

      final CepAbertoAddress address = CepAbertoAddress.fromMap(response.body);

      return address;
    } on GetHttpException catch (e) {
      return Future.error('Erro ao buscar CEP -> $e');
    }
  }
}

class CepAbertoAddress {
  final double altitude;
  final String cep;
  final double latitude;
  final double longitude;
  final String logradouro;
  final String bairro;
  final Cidade cidade;
  final Estado estado;

  CepAbertoAddress.fromMap(Map<String, dynamic> map)
      : altitude = map['altitude'] as double,
        cep = map['cep'] as String,
        latitude = double.tryParse(map['latitude'] as String)!,
        longitude = double.tryParse(map['longitude'] as String)!,
        logradouro = map['logradouro'] as String,
        bairro = map['bairro'] as String,
        cidade = Cidade.fromMap(map['cidade'] as Map<String, dynamic>),
        estado = Estado.fromMap(map['estado'] as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepAbertoAddress{altitude: $altitude, cep: $cep, latitude: $latitude, longitude: $longitude, logradouro: $logradouro, bairro: $bairro, cidade: $cidade, estado: $estado}';
  }
}

class Cidade {
  final int ddd;
  final String ibge;
  final String nome;

  Cidade.fromMap(Map<String, dynamic> map)
      : ddd = map['ddd'] as int,
        ibge = map['ibge'] as String,
        nome = map['nome'] as String;

  @override
  String toString() {
    return 'Cidade{ddd: $ddd, ibge: $ibge, nome: $nome}';
  }
}

class Estado {
  final String sigla;

  Estado.fromMap(Map<String, dynamic> map) : sigla = map['sigla'] as String;

  @override
  String toString() {
    return 'Estado{sigla: $sigla}';
  }
}
