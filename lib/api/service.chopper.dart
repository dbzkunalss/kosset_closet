// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$Service extends Service {
  _$Service([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Service;

  @override
  Future<Response> createUserService(Map<String, dynamic> createUser) {
    final $url =
        'https://us-central1-kosset-69420.cloudfunctions.net/api/createUser';
    final $params = <String, dynamic>{'createUser': createUser};
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
