import 'package:macros_example/macros/data_clazz.dart';

import '../macros/primary_constructor.dart';

@DataClazz()
@PrimaryConstructor()
class PrimaryContructorExample {
  void primaryContructor(String name, int age,
      {required int teste1, bool? teste2}) {}
}
