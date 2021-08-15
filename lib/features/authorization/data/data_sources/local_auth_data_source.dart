import 'package:hive/hive.dart';
import 'package:mason_testing_ground/core/error/errors.dart';
import 'package:mason_testing_ground/features/authorization/domain/entities/token.dart';

abstract class LocalAuthDataSource {
  Future<bool> saveToken(Token token);

  Token getToken();

  bool tokenExist();

  Future<bool> removeToken();
}

class LocalAuthDataSourceImpl extends LocalAuthDataSource {
  LocalAuthDataSourceImpl({
    required this.source,
  });

  static const _tokenBoxId = 'TOKEN_BOX_ID';

  final Box source;

  @override
  Token getToken() {
    if (tokenExist()) {
      return source.get(_tokenBoxId)!;
    } else {
      throw NotSavedTokenException();
    }
  }

  @override
  Future<bool> saveToken(Token token) async {
    await source.put(_tokenBoxId, token);
    return true;
  }

  @override
  bool tokenExist() {
    return source.containsKey(_tokenBoxId);
  }

  @override
  Future<bool> removeToken() async {
    if (tokenExist()) {
      await source.delete(_tokenBoxId);
    }
    return true;
  }
}
