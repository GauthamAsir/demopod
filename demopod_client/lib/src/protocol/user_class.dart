/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class User extends SerializableEntity {
  @override
  String get className => 'User';

  int? id;
  late String userName;
  String? displayName;
  late String firstName;
  String? lastName;
  late DateTime dateOfBirth;
  late String email;

  User({
    this.id,
    required this.userName,
    this.displayName,
    required this.firstName,
    this.lastName,
    required this.dateOfBirth,
    required this.email,
  });

  User.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    userName = _data['userName']!;
    displayName = _data['displayName'];
    firstName = _data['firstName']!;
    lastName = _data['lastName'];
    dateOfBirth = DateTime.tryParse(_data['dateOfBirth'])!;
    email = _data['email']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'userName': userName,
      'displayName': displayName,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.toUtc().toIso8601String(),
      'email': email,
    });
  }
}
