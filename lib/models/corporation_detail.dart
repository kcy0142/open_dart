import 'package:json_annotation/json_annotation.dart';

part 'corporation_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CorporationDetail {
  CorporationDetail(
      {this.status,
      this.message,
      this.corpCode,
      this.corpName,
      this.corpNameEng,
      this.stockName,
      this.stockCode,
      this.ceoNm,
      this.corpCls,
      this.jurirNo,
      this.bizrNo,
      this.adres,
      this.hmUrl,
      this.irUrl,
      this.phnNo,
      this.faxNo,
      this.indutyCode,
      this.estDt,
      this.accMt});

  /// 에러 및 정보 코드
  String status;

  /// 에러 및 정보 메시지
  String message;

  /// 고유번호
  String corpCode;

  /// 정식명칭
  String corpName;

  /// 영문정식회사명칭
  String corpNameEng;

  /// 종목명(상장사) 또는 약식명칭(기타법인)
  String stockName;

  /// 상장회사인 경우 주식의 종목코드
  String stockCode;

  /// 대표자명
  String ceoNm;

  /// 법인구분
  String corpCls;

  /// 법인등록번호
  String jurirNo;

  /// 사업자등록번호
  String bizrNo;

  /// 주소
  String adres;

  /// 홈페이지
  String hmUrl;

  /// IR홈페이지
  String irUrl;

  /// 전화번호
  String phnNo;

  /// 팩스번호
  String faxNo;

  /// 업종코드
  String indutyCode;

  /// 설립일(YYYYMMDD)
  String estDt;

  /// 결산월(MM)
  String accMt;
  
  
  factory CorporationDetail.fromJson(Map<String, dynamic> json) =>
      _$CorporationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CorporationDetailToJson(this);

}
