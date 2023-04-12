import 'package:json_annotation/json_annotation.dart';
// import 'package:flutter/material.dart';
part 'Image_model.g.dart';

@JsonSerializable()
class apiImage {
  final String id;
  final String filename;
  final String? title;

  @JsonKey(name: 'url_full_size')
  final String urlFullSize;

  @JsonKey(name: 'url_medium_size')
  final String urlMediumSize;

  @JsonKey(name: 'url_small_size')
  final String urlSmallSize;

  apiImage(
      {required this.id,
      required this.filename,
      this.title,
      required this.urlFullSize,
      required this.urlMediumSize,
      required this.urlSmallSize});

  factory apiImage.fromJson(Map<String, dynamic> json) => _$apiImageFromJson(json);

  Map<String, dynamic> toJson() => _$apiImageToJson(this);
}
