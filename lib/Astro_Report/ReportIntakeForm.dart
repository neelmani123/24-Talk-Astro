import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/utils/setup.dart';

class ReportIntakeForm extends StatefulWidget {
  static const String reportIntakeForm = "/ReportIntakeForm ";

  @override
  _ReportIntakeFormState createState() => _ReportIntakeFormState();
}

class _ReportIntakeFormState extends State<ReportIntakeForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _placeOfBirth = TextEditingController();
  final TextEditingController _maritialStatus = TextEditingController();  //unused//
  final TextEditingController _occupation = TextEditingController();
  final TextEditingController _anyComment = TextEditingController();




  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PickResult selectedPlace;
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  final dateFormat = DateFormat("dd-MM-yyyy");
  final timeFormat = DateFormat("HH:mm");
  DateTime currentVale = DateTime.now();

  validate() {

    if (_formKey.currentState.validate()) {
      if(_dob.text.length == 0 || _time.text.length == 0 || _placeOfBirth.text.length == 0 || _gender.text.length==0 || _occupation.text.length == 0 || _maritialStatus.text.length==0)
      {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Please fill input fields'),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(pinkColor),
                        ),

                        onPressed: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"),
                      )
                    ],
                  )

                ],
              ),
            )
        );
      }
      else
      {
        print(_dob.text);
        print("ok");
      }
    }
    else {

    }

  }

  var _currencies = [
    "Single",
    "Married",
    "Divorced",
    "Separated",
    "Windowed",
  ];

  var _currentSelectedValue;

  @override
  Widget build(BuildContext context) {

    final focus = FocusNode();


    return Scaffold(
      appBar: AppBar(
        title: Text("Report Intake Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Report Type",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("2021 detailed yearly Report")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Name Required"),
                            MaxLengthValidator(30, errorText: "Enter Valid First Name"),
                            MinLengthValidator(2,
                                errorText: "Name should be minimum 3 character"),
                          ]
                        ),
                        controller: _firstNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          labelStyle: TextStyle(color: Color(blueGreyColor)),
                          labelText: "Enter First name",
                          hintText: "Enter First name",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        validator: MultiValidator(
                          [
                            MaxLengthValidator(30, errorText: "Enter Valid Last Name"),
                          ]
                        ),
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          labelStyle: TextStyle(color: Color(blueGreyColor)),
                          labelText: "Enter Last name",
                          hintText: "Enter last name",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        validator: MultiValidator(
                          [
                            MinLengthValidator(10, errorText: "Enter a Valid number")
                          ]
                        ),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: _phoneNumber,
                        decoration: InputDecoration(
                          prefixText: "+91",
                          prefixStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          labelStyle: TextStyle(color: Color(blueGreyColor)),
                          labelText: "Phone no",
                          hintText: "Phone no",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: ()
                        {
                          showDialog(
                              context: context,
                              builder: (_) {
                                int selectedRadio;
                                return AlertDialog(
                                  title: Text(
                                    'Select Gender', textAlign: TextAlign.center,),
                                  content: StatefulBuilder(
                                      builder: (BuildContext context,StateSetter setState)
                                      {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Radio(value: 0,
                                                          groupValue: selectedRadio,
                                                          onChanged: (val) {

                                                            _gender.text = "Male";
                                                            setState(() => selectedRadio = val,
                                                            );
                                                          }),
                                                      Text("Male"),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Radio(value: 1,
                                                          groupValue: selectedRadio,
                                                          onChanged: (val) {
                                                            _gender.text = "Female";
                                                            setState(() => selectedRadio = val);
                                                          }),
                                                      Text("Female"),
                                                    ],
                                                  ),
                                                ),


                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                      child: Text("Cancel"),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                      child: Text("OK"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        );
                                      }

                                  ),
                                );
                              }
                          );
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _gender,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(blueGreyColor)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(blueGreyColor)),
                              ),
                              labelStyle: TextStyle(color: Color(blueGreyColor)),
                              labelText: "Gender",
                              hintText: "Gender",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    DateTimeField(
                      controller: _dob,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                        border:  OutlineInputBorder(
                        ),
                          hintText: "DATE OF BIRTH",
                          hintStyle: TextStyle(color: Colors.black),
                          // prefixIcon: Icon(
                          //   Icons.calendar_today_outlined, color: Colors.grey,)
                      ),
                      format: dateFormat,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    DateTimeField(
                      controller: _time,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(blueGreyColor)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(blueGreyColor)),
                        ),
                          // prefixIcon: Icon(
                          //   Icons.timer_sharp, color: Colors.grey,),
                          hintText: "TIME OF BIRTH",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      format: timeFormat,
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        print(time);
                        return DateTimeField.convert(time);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PlacePicker(
                                  apiKey: apiKey,
                                  initialPosition: kInitialPosition,
                                  useCurrentLocation: true,
                                  selectInitialPosition: true,
                                  //usePlaceDetailSearch: true,
                                  onPlacePicked: (result) {
                                    selectedPlace = result;
                                    Navigator.of(context).pop();
                                    setState(() {});
                                    _placeOfBirth.text =
                                        selectedPlace.formattedAddress;
                                  },

                                );
                              },
                            ),
                          );
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _placeOfBirth,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(blueGreyColor)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(blueGreyColor)),
                              ),
                              labelStyle: TextStyle(color: Color(blueGreyColor)),
                              labelText: "Place of Birth",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: _occupation,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          labelStyle: TextStyle(color: Color(blueGreyColor)),
                          labelText: "Occupation",
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(blueGreyColor)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(blueGreyColor)),
                              ),
                              labelText: "Marital Status",
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                              hintText: 'Marital Status',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                          isEmpty: _currentSelectedValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _currentSelectedValue,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  _currentSelectedValue = newValue;
                                  print(_currentSelectedValue);
                                  _maritialStatus.text = _currentSelectedValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: _currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: _anyComment,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(blueGreyColor)),
                          ),
                          labelStyle: TextStyle(color: Color(blueGreyColor)),
                          labelText: "Any comments",
                          hintText: "Enter your comment here"
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        validate();
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          color: Color(blueGreyColor),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
