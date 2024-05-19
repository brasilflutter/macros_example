// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_log_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogDataPcge _$LogDataPcgeFromJson(Map<String, dynamic> json) => LogDataPcge(
      type: json['type'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LogDataPcgeToJson(LogDataPcge instance) =>
    <String, dynamic>{
      'type': instance.type,
      'status': instance.status,
    };
