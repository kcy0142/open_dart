import 'package:json_annotation/json_annotation.dart';

part 'corporation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Corporation {
  Corporation({
    this.corpCode,
    this.corpName,
    this.stockCode,
    this.corpCls,
    this.reportNm,
    this.rceptNo,
    this.flrNm,
    this.rceptDt,
    this.rm,
  });

  /// 고유번호
  final String corpCode;

  /// 종목명(법인명)
  final String corpName;

  /// 종목코드
  final String stockCode;

  /// 법인구분
  final CorpClass corpCls;

  /// 보고서명
  final String reportNm;

  /// 접수 번호
  final String rceptNo;

  /// 공시 제출인명
  final String flrNm;

  /// 접수일자
  final String rceptDt;

  /// 비고 - 유, 코, 채, 넥, 공, 연, 정, 철
  final String rm;

  factory Corporation.fromJson(Map<String, dynamic> json) =>
      _$CorporationFromJson(json);

  Map<String, dynamic> toJson() => _$CorporationToJson(this);
}

enum CorpClass {
  Y,
  K,
  N,
  E,
}

extension CorpClassToString on CorpClass {
  String get enumToString {
    switch (this) {
      case CorpClass.Y:
        return 'Y 유가';
      case CorpClass.K:
        return 'K 코스닥';
      case CorpClass.N:
        return 'N 코넥스';
      case CorpClass.E:
        return 'E 기타';
      default:
        throw Exception('CorpClass is not defined');
    }
  }
}


CorpClass getSelectedCls(String cls) {
  switch (cls) {
    case "Y":
      return CorpClass.Y;
    case "K":
      return CorpClass.K;
    case "N":
      return CorpClass.N;
    case "E":
      return CorpClass.E;
    default:
      return        CorpClass.E;

  }
}
