import 'package:basalt_stock_market/models/eod.dart';
import 'package:basalt_stock_market/theme/colors.dart';
import 'package:basalt_stock_market/theme/styles.dart';
import 'package:basalt_stock_market/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockItemWidget extends StatelessWidget {
  final EndOfDayModel data;

  const StockItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 13,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Symbol',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        data.symbol,
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,

                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exchange",
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        data.exchange ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0,),
              const SizedBox(
                height: 1,
                width: double.maxFinite,
                child: Divider(
                  color: baseGrey3,
                  thickness: 0.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${"High"} ${data.high}',
                          textAlign: TextAlign.start,
                          style: TextStyles.smallText,

                        ),
                        const SizedBox(height: 4,),
                        Text(
                          '${'Low'} ${data.low}',
                          textAlign: TextAlign.start,
                          style: TextStyles.smallText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${"Open"} ${data.open}',
                                textAlign: TextAlign.start,
                                style: TextStyles.smallText
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              '${"Close"} ${data.close}',
                              textAlign: TextAlign.start,
                              style: TextStyles.smallText,

                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                getDifference(data.open, data.close)
                                    .toStringAsFixed(2)
                                    .startsWith('-') ?
                                const Icon(
                                  Icons.arrow_downward, color: red, size: 25,) :
                                const Icon(
                                  Icons.arrow_upward, color: jade, size: 25,),
                                Text(getDifference(data.open, data.close)
                                    .toStringAsFixed(2),
                                  style: TextStyles.text,)
                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0,),
              const SizedBox(
                height: 1,
                width: double.maxFinite,
                child: Divider(
                  color: baseGrey3,
                  thickness: 0.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${"Split"} ${data.splitFactor}',
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        '${'Dividend '} ${data.dividend}',
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,

                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${'Dividend '} ${data.dividend}',
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,

                      ),
                      const SizedBox(height: 4,),
                      Text(
                        '${"Close"} ${data.close}',
                        textAlign: TextAlign.start,
                        style: TextStyles.smallText,

                      ),
                    ],
                  ),
                  SizedBox(width: 0.0,)
                ],
              ),
              const SizedBox(height: 10.0,),
              const SizedBox(
                height: 1,
                width: double.maxFinite,
                child: Divider(
                  color: baseGrey3,
                  thickness: 0.5,
                ),
              ),
              Column(
                children: [
                  Text(
                    '${"Adjacent Volume:"} ${data.adjVolume.toStringAsFixed(
                        2)}',
                    textAlign: TextAlign.start,
                    style: TextStyles.smallText,

                  ),
                  const SizedBox(height: 4,),
                  Text(
                    convertDate(data.date),
                    textAlign: TextAlign.start,
                    style: TextStyles.smallText,

                  ),
                ],
              ),
            ],
          ),
        )

    );
  }
}