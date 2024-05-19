import 'package:json_annotation/json_annotation.dart';

part 'package_log_data.g.dart';

@JsonSerializable()
class LogDataPcge {
  final String? type;
  final int? status;

  const LogDataPcge({required this.type, required this.status});

  factory LogDataPcge.fromJson(Map<String, dynamic> json) =>
      _$LogDataPcgeFromJson(json);

  Map<String, dynamic> toJson() => _$LogDataPcgeToJson(this);

  @override
  String toString() {
    return 'Usando Json_Serializable: Status: $status, Type: $type';
  }
}
