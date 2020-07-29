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

  final double widthSize=100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('Discover'),
      ),
      body: FutureBuilder<CorporationDetail>(
        future: DartOpenApiService().getCorporationDetail(widget.corpCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CorporationDetail res = snapshot.data;

            CorpClass corpClass =getSelectedCls(res.corpCls);
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: <Widget>[


                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "CEO",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.ceoNm,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "종목코드",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.stockCode,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "법인등록번호",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.jurirNo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "사업자등록번호",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.bizrNo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "전화번호",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.phnNo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "팩스번호",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.faxNo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "설립일",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.estDt,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "결산일",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.accMt,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "홈페이지",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.hmUrl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: <Widget>[
                        Container(
                          width: widthSize,
                          child: Text(
                            "IR홈페이지",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            res.irUrl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
