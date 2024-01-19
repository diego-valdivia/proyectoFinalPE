/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Iluminacion type in your schema. */
class Iluminacion extends amplify_core.Model {
  static const classType = const _IluminacionModelType();
  final String id;
  final int? _Intensidad;
  final amplify_core.TemporalDate? _Fecha;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  IluminacionModelIdentifier get modelIdentifier {
      return IluminacionModelIdentifier(
        id: id
      );
  }
  
  int? get Intensidad {
    return _Intensidad;
  }
  
  amplify_core.TemporalDate? get Fecha {
    return _Fecha;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Iluminacion._internal({required this.id, Intensidad, Fecha, createdAt, updatedAt}): _Intensidad = Intensidad, _Fecha = Fecha, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Iluminacion({String? id, int? Intensidad, amplify_core.TemporalDate? Fecha}) {
    return Iluminacion._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Intensidad: Intensidad,
      Fecha: Fecha);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Iluminacion &&
      id == other.id &&
      _Intensidad == other._Intensidad &&
      _Fecha == other._Fecha;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Iluminacion {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Intensidad=" + (_Intensidad != null ? _Intensidad!.toString() : "null") + ", ");
    buffer.write("Fecha=" + (_Fecha != null ? _Fecha!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Iluminacion copyWith({int? Intensidad, amplify_core.TemporalDate? Fecha}) {
    return Iluminacion._internal(
      id: id,
      Intensidad: Intensidad ?? this.Intensidad,
      Fecha: Fecha ?? this.Fecha);
  }
  
  Iluminacion copyWithModelFieldValues({
    ModelFieldValue<int?>? Intensidad,
    ModelFieldValue<amplify_core.TemporalDate?>? Fecha
  }) {
    return Iluminacion._internal(
      id: id,
      Intensidad: Intensidad == null ? this.Intensidad : Intensidad.value,
      Fecha: Fecha == null ? this.Fecha : Fecha.value
    );
  }
  
  Iluminacion.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Intensidad = (json['Intensidad'] as num?)?.toInt(),
      _Fecha = json['Fecha'] != null ? amplify_core.TemporalDate.fromString(json['Fecha']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Intensidad': _Intensidad, 'Fecha': _Fecha?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Intensidad': _Intensidad,
    'Fecha': _Fecha,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<IluminacionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<IluminacionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final INTENSIDAD = amplify_core.QueryField(fieldName: "Intensidad");
  static final FECHA = amplify_core.QueryField(fieldName: "Fecha");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Iluminacion";
    modelSchemaDefinition.pluralName = "Iluminacions";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Iluminacion.INTENSIDAD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Iluminacion.FECHA,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _IluminacionModelType extends amplify_core.ModelType<Iluminacion> {
  const _IluminacionModelType();
  
  @override
  Iluminacion fromJson(Map<String, dynamic> jsonData) {
    return Iluminacion.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Iluminacion';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Iluminacion] in your schema.
 */
class IluminacionModelIdentifier implements amplify_core.ModelIdentifier<Iluminacion> {
  final String id;

  /** Create an instance of IluminacionModelIdentifier using [id] the primary key. */
  const IluminacionModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'IluminacionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is IluminacionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}