import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/pin.dart';

part 'pin_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PinModel extends Pin {
  @JsonKey(name: 'src')
  final PinSrcModel srcModel;

  const PinModel({
    required super.id,
    required super.width,
    required super.height,
    required super.url,
    super.photographer,
    super.photographerUrl,
    required super.photographerId,
    super.avgColor,
    required this.srcModel,
    super.alt,
  }) : super(src: srcModel);

  factory PinModel.fromJson(Map<String, dynamic> json) =>
      _$PinModelFromJson(json);

  Map<String, dynamic> toJson() => _$PinModelToJson(this);
}

@JsonSerializable()
class PinSrcModel extends PinSrc {
  const PinSrcModel({
    super.original,
    super.large2x,
    super.large,
    super.medium,
    super.small,
    super.portrait,
    super.landscape,
    super.tiny,
  });

  factory PinSrcModel.fromJson(Map<String, dynamic> json) =>
      _$PinSrcModelFromJson(json);

  Map<String, dynamic> toJson() => _$PinSrcModelToJson(this);
}
