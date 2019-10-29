import 'package:meta/meta.dart';

class UserModel {
  final int id;

  final String nome;

  UserModel({
    @required this.id,
    @required this.nome,
  });

  @override
  List<Object> get props => [id];
}
