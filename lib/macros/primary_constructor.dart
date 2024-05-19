import 'package:macros/macros.dart';


macro class PrimaryConstructor
    implements ClassDeclarationsMacro {
  const PrimaryConstructor();

  @override
  void buildDeclarationsForClass(
      ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    var methods = await builder.methodsOf(clazz);
    final methodsCandiates = methods.where((d) => d.identifier.name == 'primaryContructor').toList();


    if (methodsCandiates.isEmpty) {
      return;
    }
    final primaryConstructorMethod = methodsCandiates.first;

    final className = clazz.identifier.name;
    final positionalParameters = primaryConstructorMethod.positionalParameters.toList();
    final requiredParameters = primaryConstructorMethod.namedParameters.where((p) => p.isRequired).toList();
    final optionalParameters = primaryConstructorMethod.namedParameters.where((p) => !p.isRequired).toList();

    for (final param in positionalParameters) {
      final fieldType = (param.type.code as NamedTypeAnnotationCode).name.name;
      builder.declareInType(DeclarationCode.fromParts([
        'final $fieldType ${param.name};',
      ]));
    }


    for (final param in requiredParameters) {
      final fieldType = (param.type.code as NamedTypeAnnotationCode).name.name;
      builder.declareInType(DeclarationCode.fromParts([
        'final $fieldType',
        if(!param.isRequired) '?',
        ' ${param.name};',
      ]));
    }

    for (final param in optionalParameters) {
      final fieldType = ((param.type.code as NullableTypeAnnotationCode));
      final namedTypecode =fieldType.underlyingType as NamedTypeAnnotationCode;
      builder.declareInType(DeclarationCode.fromParts([
        'final ${namedTypecode.name.name}',
        if(!param.isRequired) '?',
        ' ${param.name};',
      ]));
    }

    final hasNamedParameters = primaryConstructorMethod.namedParameters.isNotEmpty;


    builder.declareInType(DeclarationCode.fromParts([
      'const $className(\n',
      '${positionalParameters.map((p) => 'this.${p.name}').join(', ')},',
      if (hasNamedParameters) '\n{',
      if (hasNamedParameters) 'required ${requiredParameters.map((p) => 'this.${p.name}').join(', ')},',
      if (hasNamedParameters) '${optionalParameters.map((p) => ' this.${p.name}').join(', ')},',
      if (hasNamedParameters) '}',
      '\n)',
      ';'
      ,
    ]));
  }



}
