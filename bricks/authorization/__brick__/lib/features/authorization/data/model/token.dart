import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:{{project_name}}/core/app/consts.dart';
import 'package:{{project_name}}/features/authorization/domain/entities/token.dart';

part 'token.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveObjects.tokenObjectId)
class TokenModel extends Token with HiveObjectMixin {
  TokenModel({
    required this.accessToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  @HiveField(0)
  final String accessToken;

  @override
  List<Object?> get props => [
        accessToken,
      ];
}
