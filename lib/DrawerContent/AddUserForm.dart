import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/DrawerContent/UserList.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  HttpService _httpService = HttpService();
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _gender = TextEditingController();

  final TextEditingController _dob = TextEditingController();

  final TextEditingController _time = TextEditingController();

  final TextEditingController _relationShipStatus = TextEditingController();
  final TextEditingController _placeOfBirth = TextEditingController();
  bool isLoading;
  String userId1="";

  var _currencies = [
    "Wife",
    "Son",
    "Sister",
    "Daughter",
    "Father",
    "Mother",
    "Brother",
    "Others",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validate() {

    if (_formKey.currentState.validate()) {
      if(_dob.text.length == 0 || _time.text.length == 0 ||  _gender.text.length==0 ||  _relationShipStatus.text.length==0)
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
        _createUser();

      }
    }
    else {

    }

  }

   _createUser() async
  {
    setState(() {
      isLoading = true;
    });
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    var res = await _httpService.createUser(user_id:userId1,name: _firstNameController.text,date_of_birth: _dob.text, time_of_birth: _time.text, place_of_birth: "Noida", gender: _gender.text,relationship: _relationShipStatus.text);
    if(res.result == "success")
    {
      print(res.message);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserList()),
      );
    }
  else
    {
    print("SigUp fAILED");
    }
  setState(() {
        isLoading = false;
      });

  }

  final dateFormat = DateFormat("dd-MM-yyyy");
  final timeFormat = DateFormat("HH:mm");
  DateTime currentVale = DateTime.now();


  var _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
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
               /* Container(
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
                ),*/
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
                             // initialPosition: kInitialPosition,
                              useCurrentLocation: true,
                              selectInitialPosition: true,
                              //usePlaceDetailSearch: true,
                              /*onPlacePicked: (result) {
                              //  selectedPlace = result;
                                Navigator.of(context).pop();
                                setState(() {});
                                _placeOfBirth.text =
                                   // selectedPlace.formattedAddress;
                              }*/
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
                          labelText: "Relationship",
                          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Relationship',
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
                              _relationShipStatus.text = _currentSelectedValue;
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
      ),
    );
  }
}
