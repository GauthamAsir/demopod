/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'dart:typed_data';
import 'protocol.dart';

class User extends TableRow {
  @override
  String get className => 'User';
  @override
  String get tableName => 'userdata';

  static final t = UserTable();

  @override
  int? id;
  late String userName;
  String? displayName;
  late String firstName;
  String? lastName;
  late DateTime dateOfBirth;
  DateTime? registerDate;
  DateTime? lastLoginDate;
  DateTime? lastModified;
  late String email;
  String? password;

  User({
    this.id,
    required this.userName,
    this.displayName,
    required this.firstName,
    this.lastName,
    required this.dateOfBirth,
    this.registerDate,
    this.lastLoginDate,
    this.lastModified,
    required this.email,
    this.password,
  });

  User.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    userName = _data['userName']!;
    displayName = _data['displayName'];
    firstName = _data['firstName']!;
    lastName = _data['lastName'];
    dateOfBirth = DateTime.tryParse(_data['dateOfBirth'])!;
    registerDate = _data['registerDate'] != null
        ? DateTime.tryParse(_data['registerDate'])
        : null;
    lastLoginDate = _data['lastLoginDate'] != null
        ? DateTime.tryParse(_data['lastLoginDate'])
        : null;
    lastModified = _data['lastModified'] != null
        ? DateTime.tryParse(_data['lastModified'])
        : null;
    email = _data['email']!;
    password = _data['password'];
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

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'userName': userName,
      'displayName': displayName,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.toUtc().toIso8601String(),
      'registerDate': registerDate?.toUtc().toIso8601String(),
      'lastLoginDate': lastLoginDate?.toUtc().toIso8601String(),
      'lastModified': lastModified?.toUtc().toIso8601String(),
      'email': email,
      'password': password,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'userName': userName,
      'displayName': displayName,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.toUtc().toIso8601String(),
      'registerDate': registerDate?.toUtc().toIso8601String(),
      'lastLoginDate': lastLoginDate?.toUtc().toIso8601String(),
      'lastModified': lastModified?.toUtc().toIso8601String(),
      'email': email,
      'password': password,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userName':
        userName = value;
        return;
      case 'displayName':
        displayName = value;
        return;
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
      case 'dateOfBirth':
        dateOfBirth = value;
        return;
      case 'registerDate':
        registerDate = value;
        return;
      case 'lastLoginDate':
        lastLoginDate = value;
        return;
      case 'lastModified':
        lastModified = value;
        return;
      case 'email':
        email = value;
        return;
      case 'password':
        password = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<User>> find(
    Session session, {
    UserExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<User?> findSingleRow(
    Session session, {
    UserExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<User>(
      where: where != null ? where(User.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<User?> findById(Session session, int id) async {
    return session.db.findById<User>(id);
  }

  static Future<int> delete(
    Session session, {
    required UserExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    User row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    User row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    User row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    UserExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef UserExpressionBuilder = Expression Function(UserTable t);

class UserTable extends Table {
  UserTable() : super(tableName: 'userdata');

  @override
  String tableName = 'userdata';
  final id = ColumnInt('id');
  final userName = ColumnString('userName');
  final displayName = ColumnString('displayName');
  final firstName = ColumnString('firstName');
  final lastName = ColumnString('lastName');
  final dateOfBirth = ColumnDateTime('dateOfBirth');
  final registerDate = ColumnDateTime('registerDate');
  final lastLoginDate = ColumnDateTime('lastLoginDate');
  final lastModified = ColumnDateTime('lastModified');
  final email = ColumnString('email');
  final password = ColumnString('password');

  @override
  List<Column> get columns => [
        id,
        userName,
        displayName,
        firstName,
        lastName,
        dateOfBirth,
        registerDate,
        lastLoginDate,
        lastModified,
        email,
        password,
      ];
}

@Deprecated('Use UserTable.t instead.')
UserTable tUser = UserTable();
