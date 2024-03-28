import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SmartpayDropdownItemData {

  final int id;

  final String title;

  SmartpayDropdownItemData({required this.id, required this.title});

}

class SmartpayDropdownButton extends StatefulWidget {

  final String? label;

  final Function(int)? onChanged;

  final TextEditingController inputController;

  final List<SmartpayDropdownItemData> items;

  final bool enabled;

  const SmartpayDropdownButton({required this.items, required this.inputController, this.onChanged, this.enabled = true, this.label, Key? key}) : super(key: key);

  @override
  State<SmartpayDropdownButton> createState() => _SmartpayDropdownButtonState();

}

class _SmartpayDropdownButtonState extends State<SmartpayDropdownButton> {

  int? _dropdownSelectValue;

  String? selectedValue;

  @override
  void initState() {
    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

      
    // Below function before return can't be put in initState
    // WidgetsBinding.addPostFrameCallback() because inputController.text is empty there
    String controllerText = widget.inputController.text;

    if(controllerText.isNotEmpty){

      SmartpayDropdownItemData foundTileData = widget.items.firstWhere( 
        
        (element) => element.title.toLowerCase() == controllerText.toLowerCase() 
        
      );

      selectedValue = foundTileData.title;

    }



    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        if(widget.label != null) Padding(

            padding: EdgeInsets.only(bottom: 8),

            child: Text(
              
              widget.label!,
                
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(

                color: SmartpayColors.smartpayBlack,

                fontWeight: FontWeight.w500
                
              )
              
            ),
        ),

        DropdownButtonHideUnderline(
                                          
          child: DropdownButton2<int>(

            value: _dropdownSelectValue, //this isn't really needed because a custom button was used

            isExpanded: true,

            menuItemStyleData: MenuItemStyleData(

              height: 70,

              overlayColor: MaterialStateProperty.all( SmartpayColors.smartpaySecondaryColor )

            ),

            onChanged: (value) => setState(() {

              _dropdownSelectValue = value ?? 0;

              widget.inputController.text = widget.items[_dropdownSelectValue!].title.toLowerCase();

              if(widget.onChanged != null) { widget.onChanged!(_dropdownSelectValue!); }

              selectedValue = widget.items[_dropdownSelectValue!].title;
              
            }),

            customButton: SizedBox(
              
              child: SmartpayCard.simpleCard(
                
                context,

                backgroundColor: !widget.enabled? Colors.grey[200] : null,

                verticalPadding: 13,

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Text(

                      selectedValue != null ? selectedValue! : "",

                      style: context.textSize.bodyMedium?.copyWith(

                        color: SmartpayColors.smartpayGray

                      ),

                    ),

                    const RotatedBox(

                      quarterTurns: 1,
                      
                      child: Icon(
                      
                        Icons.chevron_right_rounded,

                        color: Colors.black,

                      )

                    )

                  ],

                )
                
              )
              
            ),

            dropdownStyleData: DropdownStyleData(

              offset: const Offset(0, -8),

              padding: EdgeInsets.zero,

              elevation: 3,

              decoration: BoxDecoration(

                color: !widget.enabled? Colors.grey[400] : Colors.white,

                borderRadius: BorderRadius.circular(8),
                
                border: Border.all(

                  width: 0.8,

                  color: SmartpayColors.smartpayBorderColor

                )

              ),

            ),

            items: !widget.enabled? [] : widget.items.map((e) => 

              DropdownMenuItem<int>(

                value: e.id,
                
                child: Padding( 

                  padding: EdgeInsets.zero, //.only(top: 15),
                  
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Spacer(),

                      Text(
                        
                        e.title,
                        
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(

                          color: SmartpayColors.smartpayBlack,

                          fontWeight: FontWeight.w500

                        )

                      ),

                      // const SizedBox(height: 5),

                      // Text(
                        
                      //   SmartpayTextStrings.selLabs,
                        
                      //   style: Theme.of(context).textTheme.bodySmall?.copyWith(

                      //     color: SmartpayColors.smartpayBlack,

                      //     fontWeight: FontWeight.w300

                      //   )

                      // ),

                      const Spacer(),

                      Divider(

                        height: 0,

                        thickness: 0.8,

                        color: SmartpayColors.smartpayBorderColor,

                      )

                    ],

                  )

                )
                
              )

            ).toList()
            
          )

        )

      ]
      
    );

  }
  
}