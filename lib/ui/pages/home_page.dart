
import 'package:basalt_stock_market/models/ticker_model.dart';
import 'package:basalt_stock_market/state/provider.dart';
import 'package:basalt_stock_market/ui/pages/detailed_stock_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BaicUtilProvider>().getTickerList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              //showSearch(context: context, delegate: SearchPage());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Consumer<BaicUtilProvider>(builder: (context, state, child) {
          if (state.isloading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.tickers != null) {
          List<TickerModel> tickerList = state.tickers;
          return ListView.builder(
              itemCount: tickerList.length,
              itemBuilder: (_, index) {
                return Card(
                  child: InkWell(
                    onTap: () => (Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailedStockPage(symbol: tickerList[index].symbol),
                      ),
                    )),
                    child: ListTile(
                        title: Text(tickerList[index].name),
                        subtitle: Text(tickerList[index].symbol)),
                  ),
                );
              });
        }return Container();
      }),
    );
  }
}