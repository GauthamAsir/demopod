/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointAuthentication extends EndpointRef {
  @override
  String get name => 'authentication';

  _EndpointAuthentication(EndpointCaller caller) : super(caller);

  Future<bool> signUp(
    User user,
    String password,
  ) async {
    var retval =
        await caller.callServerEndpoint('authentication', 'signUp', 'bool', {
      'user': user,
      'password': password,
    });
    return retval;
  }

  Future<AuthModel> login(
    String email,
    String password,
  ) async {
    var retval = await caller
        .callServerEndpoint('authentication', 'login', 'AuthModel', {
      'email': email,
      'password': password,
    });
    return retval;
  }

  Future<bool> checkUserExistbyEmail(
    String email,
  ) async {
    var retval = await caller
        .callServerEndpoint('authentication', 'checkUserExistbyEmail', 'bool', {
      'email': email,
    });
    return retval;
  }
}

class _EndpointExample extends EndpointRef {
  @override
  String get name => 'example';

  _EndpointExample(EndpointCaller caller) : super(caller);

  Future<String> hello(
    String name,
  ) async {
    var retval = await caller.callServerEndpoint('example', 'hello', 'String', {
      'name': name,
    });
    return retval;
  }

  Future<Article?> getArticleById(
    int id,
  ) async {
    var retval = await caller
        .callServerEndpoint('example', 'getArticleById', 'Article', {
      'id': id,
    });
    return retval;
  }

  Future<void> addArticle(
    Article article,
  ) async {
    var retval =
        await caller.callServerEndpoint('example', 'addArticle', 'void', {
      'article': article,
    });
    return retval;
  }

  Future<bool> updateArticle(
    Article article,
  ) async {
    var retval =
        await caller.callServerEndpoint('example', 'updateArticle', 'bool', {
      'article': article,
    });
    return retval;
  }

  Future<int> deleteArticle(
    int id,
  ) async {
    var retval =
        await caller.callServerEndpoint('example', 'deleteArticle', 'int', {
      'id': id,
    });
    return retval;
  }
}

class Client extends ServerpodClient {
  late final _EndpointAuthentication authentication;
  late final _EndpointExample example;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    authentication = _EndpointAuthentication(this);
    example = _EndpointExample(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'authentication': authentication,
        'example': example,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
