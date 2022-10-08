/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: unused_import

import 'dart:typed_data' as typed_data;
import 'package:serverpod/serverpod.dart';

import 'protocol.dart';

import '../endpoints/authentication_endpoint.dart';
import '../endpoints/example_endpoint.dart';

class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Server server) {
    var endpoints = <String, Endpoint>{
      'authentication': AuthenticationEndpoint()
        ..initialize(server, 'authentication', null),
      'example': ExampleEndpoint()..initialize(server, 'example', null),
    };

    connectors['authentication'] = EndpointConnector(
      name: 'authentication',
      endpoint: endpoints['authentication']!,
      methodConnectors: {
        'signUp': MethodConnector(
          name: 'signUp',
          params: {
            'user':
                ParameterDescription(name: 'user', type: User, nullable: false),
            'password': ParameterDescription(
                name: 'password', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['authentication'] as AuthenticationEndpoint)
                .signUp(
              session,
              params['user'],
              params['password'],
            );
          },
        ),
        'login': MethodConnector(
          name: 'login',
          params: {
            'email': ParameterDescription(
                name: 'email', type: String, nullable: false),
            'password': ParameterDescription(
                name: 'password', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['authentication'] as AuthenticationEndpoint)
                .login(
              session,
              params['email'],
              params['password'],
            );
          },
        ),
        'checkUserExistbyEmail': MethodConnector(
          name: 'checkUserExistbyEmail',
          params: {
            'email': ParameterDescription(
                name: 'email', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['authentication'] as AuthenticationEndpoint)
                .checkUserExistbyEmail(
              session,
              params['email'],
            );
          },
        ),
      },
    );

    connectors['example'] = EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': MethodConnector(
          name: 'hello',
          params: {
            'name': ParameterDescription(
                name: 'name', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).hello(
              session,
              params['name'],
            );
          },
        ),
        'getArticleById': MethodConnector(
          name: 'getArticleById',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).getArticleById(
              session,
              params['id'],
            );
          },
        ),
        'addArticle': MethodConnector(
          name: 'addArticle',
          params: {
            'article': ParameterDescription(
                name: 'article', type: Article, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).addArticle(
              session,
              params['article'],
            );
          },
        ),
        'updateArticle': MethodConnector(
          name: 'updateArticle',
          params: {
            'article': ParameterDescription(
                name: 'article', type: Article, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).updateArticle(
              session,
              params['article'],
            );
          },
        ),
        'deleteArticle': MethodConnector(
          name: 'deleteArticle',
          params: {
            'id': ParameterDescription(name: 'id', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).deleteArticle(
              session,
              params['id'],
            );
          },
        ),
      },
    );
  }

  @override
  void registerModules(Serverpod pod) {}
}
