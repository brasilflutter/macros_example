import 'package:json/json.dart';

import '../macros/data_clazz.dart';

@DataClazz()
@JsonCodable()
class LogDataMacos {
  final String? type;
  final int? status;

  const LogDataMacos({required this.type, required this.status});
}
