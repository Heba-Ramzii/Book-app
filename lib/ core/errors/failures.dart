import 'package:dio/dio.dart';

abstract class Failure{
  final String error ;

 const Failure(this.error);

}
class SeverFailure extends Failure{
  SeverFailure(super.error);

  factory SeverFailure.fromDioError (DioError dioError){
    switch(dioError.type) {
      case DioExceptionType.connectionTimeout:
        return SeverFailure('Connection timeout with ApiSever');
      case DioExceptionType.sendTimeout:
        return SeverFailure('Send timeout with ApiSever');
      case DioExceptionType.receiveTimeout:
        return SeverFailure('Receive timeout with ApiSever');
      case DioExceptionType.badCertificate:
        return SeverFailure('Bad Certificat');
      case DioExceptionType.badResponse:
        return SeverFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return SeverFailure('Cancel');
      case DioExceptionType.connectionError:
        return SeverFailure('Connection Error');
      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')){
          return SeverFailure('No Internet Connection');
        }
        return SeverFailure('Unexpected Error, Please try again');
      default:
        return SeverFailure('Opps There was an Error, Please try again');


    }
  }

  factory SeverFailure.fromResponse (int statusCode , dynamic response)
  {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return SeverFailure(response['error']['message']);
    } else if (statusCode == 400) {
      return SeverFailure('Your Request not found, Please try later');
    }else if (statusCode == 500) {
      return SeverFailure('Internal Server error, Please try later');
    }else
      {
        return SeverFailure('Opps There was an Error, Please try again');
      }
  }
}