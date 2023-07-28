import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title:  Text(
          "selectRange",
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: 350,
          width: 300,
          child: Column(
            children: <Widget>[
              getDateRangePicker(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      child: const Text("cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    MaterialButton(
                      child: const Text("ok"),
                      onPressed: () {
                        //context.read<StockCubit>().filterStockDataByDate(startDate, endDate);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));

  }

  Widget getDateRangePicker() {
    return Card(
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.range,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            final selectedRange = args.value;
            print(
                'Selected Start Date: ${selectedRange.startDate}, Selected End Date: ${selectedRange.endDate}');
          },
        ));
  }
}
