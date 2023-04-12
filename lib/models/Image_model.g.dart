// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

apiImage _$apiImageFromJson(Map<String, dynamic> json) => apiImage(
      id: json['id'] as String,
      filename: json['filename'] as String,
      title: json['title'] as String?,
      urlFullSize: json['url_full_size'] as String,
      urlMediumSize: json['url_medium_size'] as String,
      urlSmallSize: json['url_small_size'] as String,
    );

Map<String, dynamic> _$apiImageToJson(apiImage instance) => <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'url_full_size': instance.urlFullSize,
      'url_medium_size': instance.urlMediumSize,
      'url_small_size': instance.urlSmallSize,
    };
