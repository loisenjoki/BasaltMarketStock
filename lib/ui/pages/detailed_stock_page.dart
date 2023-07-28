import 'package:basalt_stock_market/models/eod.dart';
import 'package:basalt_stock_market/state/provider.dart';
import 'package:basalt_stock_market/theme/colors.dart';
import 'package:basalt_stock_market/ui/widgets/stock_item_widget.dart';
import 'package:basalt_stock_market/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';


class DetailedStockPage extends StatefulWidget {
  final String symbol;
  final String companyName;

  const DetailedStockPage({super.key, required this.symbol, required this.companyName});


  @override
  State<StatefulWidget> createState() => _DetailedStockPageState();
}

class _DetailedStockPageState extends State<DetailedStockPage> {
  double difference = 0.0;
  String startDate = "2023-05-01";
  String endDate = "2023-07-01";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<BaicUtilProvider>()
          .getEODList(startDate, endDate, widget.symbol);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(widget.companyName),
        actions: <Widget>[

          IconButton(
            icon: const Icon(
              Icons.calendar_month_rounded,
              color:white,
            ),
            onPressed: () {
              openCalender(context, widget.symbol);
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Consumer<BaicUtilProvider>(builder: (context, state, child) {
            print("STATE" + state.toString());

            if (state.isloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.stockList != null) {
              List<EndOfDayModel> stockList = state.stockList;
              return ListView.builder(
                  itemCount: stockList.length,
                  itemBuilder: (_, index) {
                    return StockItemWidget(data: stockList[index]);
                  });
            }if(state.stockList == null){
              const Center(
                child: Text("No Stock data available for this Company"),
              );
            }
            return  Container();
          }),
          Visibility(
            visible: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected,
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child:const Center(
                child:  Text(
                  'You have lost your internet connection!!!',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }





}
