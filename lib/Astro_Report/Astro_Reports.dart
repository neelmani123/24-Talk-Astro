import 'package:flutter/material.dart';
import 'package:online_astro24/Astro_Report/ReportIntakeForm.dart';
//import 'file:///C:/Users/JaiTuteja/AndroidStudioProjects/online_astro24/lib/Astro_Report/ReportIntakeForm.dart';

class AstroReportType extends StatelessWidget {
  static const String astroReport = "/astroReport";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Report Type"),
        ),
        body: ListView.builder(itemCount: 3,itemBuilder: (ctx, i) => reportType(context: context)));
  }
}

Widget reportType({context}) {
  return InkWell(
    onTap: ()
    {
      Navigator.pushNamed(context, ReportIntakeForm.reportIntakeForm);
    },
    child: Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Image.asset(
            "Assets/banner/banner (2).png",
            fit: BoxFit.cover,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "2021 detailed Yearly report",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      "We're curious to find out how our new year might look like. Whether we believe in astrology or not, we've found, but we always like to read our New Year's astrological signs and try to see how it can appear in the upcoming months."),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
