import 'package:flutter/material.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';
import 'package:country_flags/country_flags.dart';

class CountryInput extends StatefulWidget {
  final void Function(String text) onChanged;
  final void Function(Country country) onSelected;
  
  CountryInput({required this.onChanged, required this.onSelected, Key? key}) : super(key: key);

  @override
  State<CountryInput> createState() => _CountryInputState();
  
}

class _CountryInputState extends State<CountryInput> {

  Country? _selectedCountry;
  List<Country> countries = [];
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController searchEditingController = TextEditingController();

  @override
  void initState() {
    
    super.initState();

    countries = originalCountries;

  }
  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(

      onTap: () {
        
        _showCountryModal();

      },

      child: TextInput(

        enabled: false,
        
        controller: textEditingController,
        
        textEntry: SmartpayTextStrings.country,

        onChanged: widget.onChanged
        
      )
      
    );
    
  }


  _showCountryModal(){

    showModalBottomSheet(
      
      isScrollControlled: true,

      useSafeArea: true,

      backgroundColor: const Color.fromARGB(0, 89, 89, 89),
      
      context: context, 
      
      builder: (_) {

        return StatefulBuilder(
      
          builder: (BuildContext context, setState) {

            return Container(

              clipBehavior: Clip.antiAlias,

              decoration: BoxDecoration(

                borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),

                color: Colors.white

              ),

              child: Column(

                children: [

                  Container(

                    height: 110,

                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

                    // color: Colors.yellow.withOpacity(0.3),

                    child:  Row(

                      children: [

                        Image.asset(

                          SmartpayIconsAssets.search,

                          width: 25,

                        ),

                        const SizedBox(width: 8,),

                        SizedBox(

                          // height: 50,

                          width: Common.Ws(0.58),

                          child: TextInput( 
                            
                            controller: searchEditingController,
                            
                            textEntry: "Search",

                            onChanged: (text) {
                              
                              Future.microtask(() {

                                if(text.isEmpty){

                                  setState(() => countries = originalCountries);

                                  return;

                                }

                                setState(() {
                                  

                                  countries = countries.where(
                                    
                                    (element) => 
                                    
                                      element.name.toLowerCase().contains( searchEditingController.text.toLowerCase() ) || 

                                      element.code.toLowerCase().contains( searchEditingController.text.toLowerCase() )
                                    
                                  )
                                  .toList();


                                });

                              });

                            },
                            
                          )
                          
                        ),

                        TextButton(
                          
                          onPressed: () => Navigator.pop(context), 
                          
                          child: Text(

                            "Cancel",

                            style: context.textSize.titleLarge?.copyWith(

                              color: Colors.black,

                              fontWeight: FontWeight.w700

                            ),

                          
                          )
                          
                        )

                      ],


                    ),

                  ),
              
                  Expanded(
                    
                    child: ListView.builder(

                      shrinkWrap: true,

                      itemCount: countries.length,
                      
                      itemBuilder: (_, index){

                        return Padding(
                          
                          padding: EdgeInsets.only(left: 25, right: 25),

                          child: InkWell(

                            onTap: () {

                              setState((){
                              
                                _selectedCountry = countries[index];

                                textEditingController.text = _selectedCountry!.name;

                                widget.onSelected( _selectedCountry! );

                                Navigator.pop(context);

                              });

                            },

                            child: Container(

                              margin: const EdgeInsets.only(top: 20),

                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                              decoration: BoxDecoration(

                                color: ( _selectedCountry == countries[index] ) ? SmartpayColors.smartpayLighterAsh : Colors.transparent,

                                borderRadius: BorderRadius.circular(12)

                              ),

                              child: Row(

                                children: [

                                  CountryFlag.fromCountryCode(

                                    countries[index].code,

                                    height: 48,

                                    width: 30,

                                    borderRadius: 8,

                                  ),

                                  const SizedBox(width: 20,),

                                  SizedBox(

                                    width: 50,
                                    
                                    child: Text(

                                      countries[index].code,

                                      style: context.textSize.titleLarge?.copyWith(

                                        color: SmartpayColors.smartpayGray,

                                        fontWeight: FontWeight.w500

                                      ),

                                    )
                                    
                                  ),

                                  Text(

                                    countries[index].name,

                                    style: context.textSize.titleLarge?.copyWith(

                                      color: Colors.black,

                                      fontWeight: FontWeight.w500

                                    ),

                                  
                                  ),

                                  const Spacer(),

                                  if( _selectedCountry == countries[index] ) Icon(

                                    Icons.check,

                                    color: SmartpayColors.smartpayGreen,

                                  )

                                ],

                              ),

                            ),

                          ),
                      
                        );

                      }
                
                    )

                  ),

                ],

              )

            );

          }

        );

      }
      
    );

  }
  
}


class Country {

  final String code;
  final String name;

  Country(this.code, this.name);

}

List<Country> originalCountries = [
  Country('AF', 'Afghanistan'),
  Country('AX', 'Åland Islands'),
  Country('AL', 'Albania'),
  Country('DZ', 'Algeria'),
  Country('AS', 'American Samoa'),
  Country('AD', 'Andorra'),
  Country('AO', 'Angola'),
  Country('AI', 'Anguilla'),
  Country('AQ', 'Antarctica'),
  Country('AG', 'Antigua and Barbuda'),
  Country('AR', 'Argentina'),
  Country('AM', 'Armenia'),
  Country('AW', 'Aruba'),
  Country('AU', 'Australia'),
  Country('AT', 'Austria'),
  Country('AZ', 'Azerbaijan'),
  Country('BS', 'Bahamas'),
  Country('BH', 'Bahrain'),
  Country('BD', 'Bangladesh'),
  Country('BB', 'Barbados'),
  Country('BY', 'Belarus'),
  Country('BE', 'Belgium'),
  Country('BZ', 'Belize'),
  Country('BJ', 'Benin'),
  Country('BM', 'Bermuda'),
  Country('BT', 'Bhutan'),
  Country('BO', 'Bolivia (Plurinational State of)'),
  Country('BQ', 'Bonaire, Sint Eustatius and Saba'),
  Country('BA', 'Bosnia and Herzegovina'),
  Country('BW', 'Botswana'),
  Country('BV', 'Bouvet Island'),
  Country('BR', 'Brazil'),
  Country('IO', 'British Indian Ocean Territory'),
  Country('BN', 'Brunei Darussalam'),
  Country('BG', 'Bulgaria'),
  Country('BF', 'Burkina Faso'),
  Country('BI', 'Burundi'),
  Country('CV', 'Cabo Verde'),
  Country('KH', 'Cambodia'),
  Country('CM', 'Cameroon'),
  Country('CA', 'Canada'),
  Country('KY', 'Cayman Islands'),
  Country('CF', 'Central African Republic'),
  Country('TD', 'Chad'),
  Country('CL', 'Chile'),
  Country('CN', 'China'),
  Country('CX', 'Christmas Island'),
  Country('CC', 'Cocos (Keeling) Islands'),
  Country('CO', 'Colombia'),
  Country('KM', 'Comoros'),
  Country('CG', 'Congo'),
  Country('CD', 'Congo, Democratic Republic of the'),
  Country('CK', 'Cook Islands'),
  Country('CR', 'Costa Rica'),
  Country('CI', "Côte d'Ivoire"),
  Country('HR', 'Croatia'),
  Country('CU', 'Cuba'),
  Country('CW', 'Curaçao'),
  Country('CY', 'Cyprus'),
  Country('CZ', 'Czech Republic'),
  Country('DK', 'Denmark'),
  Country('DJ', 'Djibouti'),
  Country('DM', 'Dominica'),
  Country('DO', 'Dominican Republic'),
  Country('EC', 'Ecuador'),
  Country('EG', 'Egypt'),
  Country('SV', 'El Salvador'),
  Country('GQ', 'Equatorial Guinea'),
  Country('ER', 'Eritrea'),
  Country('EE', 'Estonia'),
  Country('SZ', 'Eswatini'),
  Country('ET', 'Ethiopia'),
  Country('FK', 'Falkland Islands (Malvinas)'),
  Country('FO', 'Faroe Islands'),
  Country('FJ', 'Fiji'),
  Country('FI', 'Finland'),
  Country('FR', 'France'),
  Country('GF', 'French Guiana'),
  Country('PF', 'French Polynesia'),
  Country('TF', 'French Southern Territories'),
  Country('GA', 'Gabon'),
  Country('GM', 'Gambia'),
  Country('GE', 'Georgia'),
  Country('DE', 'Germany'),
  Country('GH', 'Ghana'),
  Country('GI', 'Gibraltar'),
  Country('GR', 'Greece'),
  Country('GL', 'Greenland'),
  Country('GD', 'Grenada'),
  Country('GP', 'Guadeloupe'),
  Country('GU', 'Guam'),
  Country('GT', 'Guatemala'),
  Country('GG', 'Guernsey'),
  Country('GN', 'Guinea'),
  Country('GW', 'Guinea-Bissau'),
  Country('GY', 'Guyana'),
  Country('HT', 'Haiti'),
  Country('HM', 'Heard Island and McDonald Islands'),
  Country('VA', 'Holy See'),
  Country('HN', 'Honduras'),
  Country('HK', 'Hong Kong'),
  Country('HU', 'Hungary'),
  Country('IS', 'Iceland'),
  Country('IN', 'India'),
  Country('ID', 'Indonesia'),
  Country('IR', 'Iran (Islamic Republic of)'),
  Country('IQ', 'Iraq'),
  Country('IE', 'Ireland'),
  Country('IM', 'Isle of Man'),
  Country('IL', 'Israel'),
  Country('IT', 'Italy'),
  Country('JM', 'Jamaica'),
  Country('JP', 'Japan'),
  Country('JE', 'Jersey'),
  Country('JO', 'Jordan'),
  Country('KZ', 'Kazakhstan'),
  Country('KE', 'Kenya'),
  Country('KI', 'Kiribati'),
  Country('KP', "Korea (Democratic People's Republic of)"),
  Country('KR', 'Korea, Republic of'),
  Country('KW', 'Kuwait'),
  Country('KG', 'Kyrgyzstan'),
  Country('LA', "Lao People's Democratic Republic"),
  Country('LV', 'Latvia'),
  Country('LB', 'Lebanon'),
  Country('LS', 'Lesotho'),
  Country('LR', 'Liberia'),
  Country('LY', 'Libya'),
  Country('LI', 'Liechtenstein'),
  Country('LT', 'Lithuania'),
  Country('LU', 'Luxembourg'),
  Country('MO', 'Macao'),
  Country('MG', 'Madagascar'),
  Country('MW', 'Malawi'),
  Country('MY', 'Malaysia'),
  Country('MV', 'Maldives'),
  Country('ML', 'Mali'),
  Country('MT', 'Malta'),
  Country('MH', 'Marshall Islands'),
  Country('MQ', 'Martinique'),
  Country('MR', 'Mauritania'),
  Country('MU', 'Mauritius'),
  Country('YT', 'Mayotte'),
  Country('MX', 'Mexico'),
  Country('FM', 'Micronesia (Federated States of)'),
  Country('MD', 'Moldova, Republic of'),
  Country('MC', 'Monaco'),
  Country('MN', 'Mongolia'),
  Country('MN', 'Mongolia'),
  Country('ME', 'Montenegro'),
  Country('MS', 'Montserrat'),
  Country('MA', 'Morocco'),
  Country('MZ', 'Mozambique'),
  Country('MM', 'Myanmar'),
  Country('NA', 'Namibia'),
  Country('NR', 'Nauru'),
  Country('NP', 'Nepal'),
  Country('NL', 'Netherlands'),
  Country('NC', 'New Caledonia'),
  Country('NZ', 'New Zealand'),
  Country('NI', 'Nicaragua'),
  Country('NE', 'Niger'),
  Country('NG', 'Nigeria'),
  Country('NU', 'Niue'),
  Country('NF', 'Norfolk Island'),
  Country('MK', 'North Macedonia'),
  Country('MP', 'Northern Mariana Islands'),
  Country('NO', 'Norway'),
  Country('OM', 'Oman'),
  Country('PK', 'Pakistan'),
  Country('PW', 'Palau'),
  Country('PS', 'Palestine, State of'),
  Country('PA', 'Panama'),
  Country('PG', 'Papua New Guinea'),
  Country('PY', 'Paraguay'),
  Country('PE', 'Peru'),
  Country('PH', 'Philippines'),
  Country('PN', 'Pitcairn'),
  Country('PL', 'Poland'),
  Country('PT', 'Portugal'),
  Country('PR', 'Puerto Rico'),
  Country('QA', 'Qatar'),
  Country('RE', 'Réunion'),
  Country('RO', 'Romania'),
  Country('RU', 'Russian Federation'),
  Country('RW', 'Rwanda'),
  Country('BL', 'Saint Barthélemy'),
  Country('SH', 'Saint Helena, Ascension and Tristan da Cunha'),
  Country('KN', 'Saint Kitts and Nevis'),
  Country('LC', 'Saint Lucia'),
  Country('MF', 'Saint Martin (French part)'),
  Country('PM', 'Saint Pierre and Miquelon'),
  Country('VC', 'Saint Vincent and the Grenadines'),
  Country('WS', 'Samoa'),
  Country('SM', 'San Marino'),
  Country('ST', 'Sao Tome and Principe'),
  Country('SA', 'Saudi Arabia'),
  Country('SN', 'Senegal'),
  Country('RS', 'Serbia'),
  Country('SC', 'Seychelles'),
  Country('SL', 'Sierra Leone'),
  Country('SG', 'Singapore'),
  Country('SX', 'Sint Maarten (Dutch part)'),
  Country('SK', 'Slovakia'),
  Country('SI', 'Slovenia'),
  Country('SB', 'Solomon Islands'),
  Country('SO', 'Somalia'),
  Country('ZA', 'South Africa'),
  Country('GS', 'South Georgia and the South Sandwich Islands'),
  Country('SS', 'South Sudan'),
  Country('ES', 'Spain'),
  Country('LK', 'Sri Lanka'),
  Country('SD', 'Sudan'),
  Country('SR', 'Suriname'),
  Country('SJ', 'Svalbard and Jan Mayen'),
  Country('SE', 'Sweden'),
  Country('CH', 'Switzerland'),
  Country('SY', 'Syrian Arab Republic'),
  Country('TW', 'Taiwan, Province of China'),
  Country('TJ', 'Tajikistan'),
  Country('TZ', 'Tanzania, United Republic of'),
  Country('TH', 'Thailand'),
  Country('TL', 'Timor-Leste'),
  Country('TG', 'Togo'),
  Country('TK', 'Tokelau'),
  Country('TO', 'Tonga'),
  Country('TT', 'Trinidad and Tobago'),
  Country('TN', 'Tunisia'),
  Country('TR', 'Turkey'),
  Country('TM', 'Turkmenistan'),
  Country('TC', 'Turks and Caicos Islands'),
  Country('TV', 'Tuvalu'),
  Country('UG', 'Uganda'),
  Country('UA', 'Ukraine'),
  Country('AE', 'United Arab Emirates'),
  Country('GB', 'United Kingdom'),
  Country('US', 'United States'),
  Country('UM', 'United States Minor Outlying Islands'),
  Country('UY', 'Uruguay'),
  Country('UZ', 'Uzbekistan'),
  Country('VU', 'Vanuatu'),
  Country('VE', 'Venezuela (Bolivarian Republic of)'),
  Country('VN', 'Viet Nam'),
  Country('VG', 'Virgin Islands (British)'),
  Country('VI', 'Virgin Islands (U.S.)'),
  Country('WF', 'Wallis and Futuna'),
  Country('EH', 'Western Sahara'),
  Country('YE', 'Yemen'),
  Country('ZM', 'Zambia'),
  Country('ZW', 'Zimbabwe'),
];