import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_dart/models/corporation_response.dart';
import 'package:open_dart/models/models.dart';
import 'package:open_dart/services/dart_open_api_service.dart';
import 'package:open_dart/widgets/corporation_card.dart';
import 'package:open_dart/widgets/corporation_chip.dart';

import '../models/corporation_detail.dart';

class CorpDetailScreen extends StatefulWidget {
  final String corpCode;

  CorpDetailScreen(this.corpCode);

  @override
  _CorpDetailScreenState createState() => _CorpDetailScreenState();
}

class _CorpDetailScreenState extends State<CorpDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  final double widthSize = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('기업상세'),
      ),
      body: FutureBuilder<CorporationDetail>(
        future: DartOpenApiService().getCorporationDetail(widget.corpCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CorporationDetail res = snapshot.data;

            CorpClass corpClass = getSelectedCls(res.corpCls);
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  res.corpName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  res.corpNameEng,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: CorpClassChip(
                            corpClass: corpClass,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    DetailItemWidget(label: 'CEO', value: res.ceoNm),
                    DetailItemWidget(label: '종목코드', value: res.stockCode),
                    DetailItemWidget(label: '법인등록번호', value: res.jurirNo),
                    DetailItemWidget(label: '사업자등록번호', value: res.bizrNo),
                    DetailItemWidget(label: '전화번호', value: res.phnNo),
                    DetailItemWidget(label: '팩스번호', value: res.faxNo),
                    DetailItemWidget(label: '설립일', value: res.estDt),
                    DetailItemWidget(label: '결산월', value: res.accMt),
                    DetailItemWidget(label: '홈페이지', value: res.hmUrl, maxLines: 1),
                    DetailItemWidget(label: 'IR홈페이지', value:res.irUrl, maxLines: 1),

                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_location),
                        Expanded(
                          child: Text(
                            res.adres,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class DetailItemWidget extends StatelessWidget {
  final String label;
  final String value;
  final int maxLines;

  DetailItemWidget({this.label, this.value, this.maxLines = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 2,
            child: maxLines == 0
                ? Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                  )
                : Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
          )
        ],
      ),
    );
  }
}
