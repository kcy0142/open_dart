import 'package:dio/dio.dart';
import 'package:open_dart/models/models.dart';
import 'package:open_dart/widgets/api_key.dart';

Dio dio = Dio()..interceptors.add(LogInterceptor(responseBody: false));

// https://opendart.fss.or.kr/api/list.json
class DartOpenApiService { 
  
    Future<CorporationDetail> getCorporationDetail(String corpCode) async {
    String url = 'https://opendart.fss.or.kr/api/company.json';
   
    Map<String, dynamic> queryParams = {
      'crtfc_key': dartOpenApiKey,
      'corp_code': corpCode
    };

    Response response = await dio.get(
      url,
      queryParameters: queryParams,
    );



    return CorporationDetail.fromJson(response.data);
  }
  
  Future<CorporationResponse> searchCorporations() async {
    String url = 'https://opendart.fss.or.kr/api/list.json';

    Map<String, dynamic> queryParams = {
      'crtfc_key': dartOpenApiKey,
      'bgn_de': '20200426',
      'end_de': '20200726'
    };

    Response response = await dio.get(
      url,
      queryParameters: queryParams,
    );

    return CorporationResponse.fromJson(response.data);
  }
}
