
import 'package:basalt_stock_market/models/ticker_model.dart';
import 'package:basalt_stock_market/state/provider.dart';
import 'package:basalt_stock_market/theme/colors.dart';
import 'package:basalt_stock_market/theme/styles.dart';
import 'package:basalt_stock_market/ui/pages/detailed_stock_page.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
          title: Consumer<BaicUtilProvider>(
            builder: (context, provider, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    provider.isSearching
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: TextField(
                          controller: provider.searchController,
                          onSubmitted: (val) {
                            context
                                .read<BaicUtilProvider>()
                                .searchTickerList();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'search',
                            hintStyle: TextStyle(color:white),

                            // You can also customize other properties like the content padding, label, etc.
                          ),
                        cursorColor: white,
                          style: TextStyle(color:white),
                      ),
                    ),
                        )
                        : Text(widget.title),
                    GestureDetector(
                        onTap: () {
                          if (provider.isSearching) {
                            context.read<BaicUtilProvider>().toggleSearch(false);
                            context.read<BaicUtilProvider>().getTickerList();
                          } else {
                            context.read<BaicUtilProvider>().toggleSearch(true);
                          }
                        },
                        child: Icon(
                            provider.isSearching ? Icons.close : Icons.search, color: white,))
                  ],
                ),
              );
            },
          ),
        ),
      body:
          Stack(
            children: [
              Consumer<BaicUtilProvider>(builder: (context, state, child) {
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
                                    DetailedStockPage(
                                        symbol: tickerList[index].symbol,
                                        companyName:tickerList[index].name),
                              ),
                            )),
                            child: ListTile(
                                title: Text(tickerList[index].name, style: TextStyles.labelLarge,),
                                subtitle: Text(tickerList[index].symbol,style: TextStyles.smallText)),
                          ),
                        );
                      });
                }
                return Container();
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
                    'No Internet Connection!!!',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              ),
            ],
          )
    );
  }

}