import 'package:macros/macros.dart';


macro class DataClazz
    implements ClassDeclarationsMacro {
  const DataClazz();
  @override
  void buildDeclarationsForClass(
      ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    final className = clazz.identifier.name;
    final attributes = await builder.fieldsOf(clazz);


    builder.declareInType(DeclarationCode.fromParts([
      '@override\n'
      'String toString() =>',
      '\'Classe: $className ',
      attributes.map((e) => '${e.identifier.name}: \$${e.identifier.name}').join(', '),
      '\';',
    ]));
  }

}