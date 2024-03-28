import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SmartpayDateRangeCalendar extends StatefulWidget {

  final String title;

  final Widget? icon;

  final Widget? label;

  final DateRangePickerSelectionMode? selectionMode;

  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChange;


  const SmartpayDateRangeCalendar({required this.title, this.icon, this.label, this.selectionMode, this.onSelectionChange, Key? key}) : super(key: key);

  @override
  State<SmartpayDateRangeCalendar> createState() => _SmartpayDateRangeCalendarState();

}

class _SmartpayDateRangeCalendarState extends State<SmartpayDateRangeCalendar> {

  bool _showDate = false;

  late String _startDate, _endDate;

  final DateRangePickerController _controller = DateRangePickerController();

  void selectionChangedDateRange(DateRangePickerSelectionChangedArgs args) {

    setState(() {

      _startDate = DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();

      _endDate = DateFormat('dd, MMMM yyyy').format(args.value.endDate ?? args.value.startDate).toString();

    });

  }

  @override
  void initState() {

    final DateTime today = DateTime.now();

    _startDate = DateFormat('dd, MMMM yyyy').format(today).toString();

    _endDate = DateFormat('dd, MMMM yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();

    _controller.selectedRange = PickerDateRange(today, today.add(Duration(days: 3)));

    super.initState();

  }

  

  @override
  Widget build(BuildContext context) {

    return TextButton.icon(
                  
      onPressed: (){ 

        showDialog(

          barrierDismissible: true,

          context: context, builder: (context) {

            return Stack(

              children: [
            
                GestureDetector(

                  onTap: () => Navigator.pop(context),
                  
                  child: Container(

                    color: Colors.transparent,

                  )
                  
                ),

                Center(

                  child: ColoredBox(

                    color: Colors.white,
                    
                    child: SizedBox(

                      width: Common.Ws(0.8),

                      height: Common.Hs(0.6),

                      child: SfDateRangePicker(

                        controller: _controller,

                        endRangeSelectionColor: SmartpayColors.smartpaySecondaryColor,

                        startRangeSelectionColor: SmartpayColors.smartpayPrimaryColor,

                        selectionMode: widget.selectionMode ?? DateRangePickerSelectionMode.range,

                        onSelectionChanged: widget.onSelectionChange, //selectionChangedDateRange,

                        enablePastDates: false,

                        allowViewNavigation: true,

                        showNavigationArrow: true,

                        // showActionButtons: true,

                      ),

                    )

                  )

                )

              ]

            );
            
          }
          
        );
        
      }, 
      
      icon: widget.icon ?? Image.asset(

        SmartpayIconsAssets.calendar2,

        color: Colors.black,

        width: 16,

      ),

      label: widget.label ?? Text(
        
        widget.title,

        style: context.textSize.bodySmall?.copyWith(

          fontWeight: FontWeight.w500,

          color: Colors.black

        ),

      )
        
      
      
    );
    
  }

}