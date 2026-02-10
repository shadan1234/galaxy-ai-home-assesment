// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinModel _$PinModelFromJson(Map<String, dynamic> json) => PinModel(
      id: (json['id'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      url: json['url'] as String,
      photographer: json['photographer'] as String?,
      photographerUrl: json['photographer_url'] as String?,
      photographerId: (json['photographer_id'] as num).toInt(),
      avgColor: json['avg_color'] as String?,
      srcModel: PinSrcModel.fromJson(json['src'] as Map<String, dynamic>),
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$PinModelToJson(PinModel instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'avg_color': instance.avgColor,
      'alt': instance.alt,
      'src': instance.srcModel,
    };

PinSrcModel _$PinSrcModelFromJson(Map<String, dynamic> json) => PinSrcModel(
      original: json['original'] as String?,
      large2x: json['large2x'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
      portrait: json['portrait'] as String?,
      landscape: json['landscape'] as String?,
      tiny: json['tiny'] as String?,
    );

Map<String, dynamic> _$PinSrcModelToJson(PinSrcModel instance) =>
    <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
