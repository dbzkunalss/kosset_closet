import 'package:chopper/chopper.dart';

part 'service.chopper.dart';


@ChopperApi(baseUrl: 'https://us-central1-kosset-69420.cloudfunctions.net/api')
abstract class Service extends ChopperService {
  @Post(path : '/createUser')
  Future<Response> createUserService(@Query()Map<String, dynamic> createUser);

  
}