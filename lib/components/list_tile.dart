import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/utils/constants.dart';

class SmartpayListTiles {

  static Widget simpleTile(
    
    BuildContext context, 
    
    String title, 
    
    {
      
      required Widget leading, 
      
      String? subTitle, 
      
      Widget? trailing, 

      EdgeInsets? padding,
      
      double? topMargin, 
      
      double? bottomMargin, 

      TextStyle? titleStyle,

      Color? backgroundColor,

      Color? titleColor,

      Color? subTitleColor,

      Color? trailingColor,
      
      void Function()? onTap
      
    }
    
  ) {

    return SmartpayCard.simpleCard(

      context,

      verticalPadding: padding?.vertical,

      horizontalPadding: padding?.horizontal,

      topMargin: topMargin ?? 0,

      backgroundColor: backgroundColor,

      bottomMargin: bottomMargin ?? 12,

      child: ListTile(

        contentPadding: EdgeInsets.zero,

        trailing: trailing?? Container(

          padding: const EdgeInsets.only(top: 5),

          height: double.maxFinite,

          child: Column(

            children: [

              Icon( 

                Icons.chevron_right_outlined,

                color: trailingColor,
              
              ),

              Spacer()

            ]
          
          )

        ),

        leading: leading,
        
        title: Text( 

          title,

          style: titleStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(

            fontWeight: FontWeight.w600,

            color: titleColor ?? Colors.black

          )

        ),

        subtitle: subTitle == null ? null : Text( 

          subTitle,

          style: Theme.of(context).textTheme.bodyMedium?.copyWith(

            color: subTitleColor ?? SmartpayColors.smartpayGray

          )

        ),

        onTap: onTap,

      )

    );
    
  }

  static Widget radioList<T>({ 
    
    required List<T> data, 
    
    required CustomGroupController groupController,
    
    required Widget Function(int index) builder, 

    double? verticalPadding,

    double? horizontalPadding,

    double? topMargin,

    double? bottomMargin,
    
    void Function()? onTap 
    
  }){

    return Material(
      
      type: MaterialType.transparency,

      child: CustomRadioListTile(
      
        data: data, 

        groupController: groupController,
        
        child: builder,

        verticalPadding: verticalPadding,

        horizontalPadding: horizontalPadding,

        topMargin: topMargin,
        
        bottomMargin: bottomMargin,

      )
      
    );

  }



  // static List<Widget> checkList<T>({ 
    
  //   required List<T> data, 
    
  //   required Widget Function(int index) builder, 

  //   double? verticalPadding,

  //   double? horizontalPadding,

  //   double? topMargin,

  //   double? bottomMargin,
    
  //   void Function()? onTap 
    
  // }){

  //   return ...();

  // }

}



base class CustomRadioListTile<T> extends StatefulWidget {

  final List<T> data;

  final CustomGroupController groupController;

  double? horizontalPadding;

  double? verticalPadding;

  double? topMargin;

  double? bottomMargin;

  final Widget Function(int index) child;

  CustomRadioListTile({
    
    required this.data, 

    required this.groupController,
  
    required this.child, 
  
    this.horizontalPadding, 
  
    this.verticalPadding,

    this.bottomMargin,

    this.topMargin, 
  
    Key? key
    
  }) : super(key: key);


  @override
  State<CustomRadioListTile> createState() => _CustomRadioListTileState<T>();

}

base class _CustomRadioListTileState<T> extends State<CustomRadioListTile<T>> {

  late CustomGroupController _groupController;

  late T _selectedType;

  late List<T> _data;

  @override
  void initState() {

    assert( widget.data.isNotEmpty, "Radio List must not be empty" );

    super.initState();

    _data = widget.data;

    _selectedType = _data[0];

    _groupController = widget.groupController;

    _groupController.listen((p0) {

      debugPrint("${p0}");

      setState(() {

        if(p0 is T){

          _selectedType = p0;

        }

      });

     });

  }

  @override
  Widget build(BuildContext context) {

    return CustomGroupedCheckbox<T>(

      controller: _groupController,

      isScroll: true,

      itemBuilder: (ctx,index,isChecked,isDisabled){

        return SmartpayCard.simpleCard(

          context,

          topMargin: widget.topMargin ?? 0,

          bottomMargin: widget.bottomMargin ?? 12,

          verticalPadding: widget.verticalPadding,

          horizontalPadding: widget.horizontalPadding,

          borderColor: isChecked ? SmartpayColors.smartpayPrimaryColor : null,

          child: LayoutBuilder(
            
            builder: (context, constraints){

              return Row(

                children: [

                  SizedBox(

                    width: constraints.maxWidth / 1.2,

                    child:  widget.child( index ),
                    
                  ),

                  Spacer(),

                  Radio<T>(
                    
                    value: _data[ index ], 

                    activeColor: SmartpayColors.smartpayPrimaryColor,
                    
                    groupValue: _selectedType, 
                    
                    onChanged: (appointmentTypeIndex) {

                      setState(() {
                        
                        _selectedType = appointmentTypeIndex!;

                      });

                    }
                    
                  )

                ],

              );

            }

          )

        );

      },

      values: _data,
      
        

    );

  }

}