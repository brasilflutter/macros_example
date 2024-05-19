import 'package:macros_example/models/macros_log_data.dart';
import 'package:macros_example/models/macros_primary_constructor.dart';

void main(List<String> arguments) {
  final jsonLog = {"type": "type1", "status": 1};

  // final log1 = LogDataOrdinary.fromJson(jsonLog);
  // final log2 = LogDataPcge.fromJson(jsonLog);

  // print(log1.toString());
  // print(log2.toString());
  final logMacros = LogDataMacos.fromJson(jsonLog);

  print(logMacros.toString());

  final d = PrimaryContructorExample(
    'Toshi',
    123,
    teste1: 1,
    teste2: true,
  );

  print(d);
}
