import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
class DetailsPage extends StatefulWidget {
  static String routename = "details";

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TimelineEventDisplay plainEventDisplay(String title,String imageUrl,List data) {
    return TimelineEventDisplay(
        child: TimelineEventCard(
          title: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
          content: Row(
            children: [
              Container(
                width: 68,
                height: 48,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.fitWidth

                  )
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[0],style: TextStyle(fontSize: 10),maxLines: 2,),
                    Text(data[1]),
                    Text(data[2])
                  ],
                ),
              )
            ],
          ),
        ),
        indicator:Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color(0xffED8F03),
            shape: BoxShape.circle
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.only(right: width*0.06,left:width*0.06,top: height*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Supply Details",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15)),
                    SizedBox(height: 10,),
                    Text("Production",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 1)),
                    SizedBox(height: 5,),
                    TimelineTheme(
                        data: TimelineThemeData(lineColor: Color(0xffED8F03)),
                        child: Timeline(
                          indicatorSize: 10,
                          events: [
                            plainEventDisplay("Collection of Raw Materials", "https://s3-alpha-sig.figma.com/img/5002/1f7e/b8476d1a2db65776dcf30e36864efff8?Expires=1686528000&Signature=HY4jS3yQSaMrvqSVjPW8AJnX~QWFDeoeo61Og~DXJKnRcdQlWnOI3d3DoSTLEDXyETzEXT1GyGzCV2iLG1Tr4OQi6X1jZaP-JtfhgcXNEkDrLkj7DLMbAG0HR27-C2AI0Yuas2ytgw~X2~UIQOwhMcMpwceUk2yjIxO65f~M-wZLWh8hfvHNAkQ~rBiqExRnbDPCiMDzbCN1QqD-v4SpRFqs0VDJXPezp2~TmnvU-b9x0~4QS6q9aUXbNjXOAmWgtz01JqtuCrckHT7PbUymDyQIXuk5Mmd6Vb1hpAfUw-rmCfP7GnibUaFwpAivjaBSGpvDqB3HVbGGgqmMrIUxQA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4", ['Raw salt from Bhavnagar, Gujarat','Date : 12/03/2023','Location : Gujarat']),
                            plainEventDisplay("Received Raw Material", "https://s3-alpha-sig.figma.com/img/9a56/bca6/5fe52a4858cd4b89e57ccd88c695d3b3?Expires=1686528000&Signature=BwqMBlTRoEiG8sf1Rk1EA7Z7A4vBztN4g9aS7kX3iYw4-s7fCqce2VVijKk1hLJnA0qe07kfBQcpwTQueAx6HS1hWsEkc~zaHVwR29mXpTTOiGyTIpxk4J9ndjPAABq50Zfww6YJzRPExdtYBDS9qDAjwb179Nkgm0KR541HXOWBUdCZJQzyOhFI2W2bPwntSwJIfFiAHYQ0jx7D4eeI4aH4f5VdurFMXSnHqUwimBRzSIf3DQz9pd9VT-yu4edgCYGVfvXAGP~nkYT-n14biemTdzF4LGsvo6omyiGL4h2ACu62495KXDSgNMNdsn065-8~RzmKtBrMXf5TnQMC9w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4", ['Received raw salt for production','Date : 19/03/2023','Location : ABC, Salt Factory, Delhi']),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Manufacturing",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 1)),
                    SizedBox(height: 5,),
                    TimelineTheme(
                        data: TimelineThemeData(lineColor: Color(0xffED8F03)),
                        child: Timeline(
                          indicatorSize: 10,
                          events: [
                            plainEventDisplay("Processed Salt", "https://s3-alpha-sig.figma.com/img/5002/1f7e/b8476d1a2db65776dcf30e36864efff8?Expires=1686528000&Signature=HY4jS3yQSaMrvqSVjPW8AJnX~QWFDeoeo61Og~DXJKnRcdQlWnOI3d3DoSTLEDXyETzEXT1GyGzCV2iLG1Tr4OQi6X1jZaP-JtfhgcXNEkDrLkj7DLMbAG0HR27-C2AI0Yuas2ytgw~X2~UIQOwhMcMpwceUk2yjIxO65f~M-wZLWh8hfvHNAkQ~rBiqExRnbDPCiMDzbCN1QqD-v4SpRFqs0VDJXPezp2~TmnvU-b9x0~4QS6q9aUXbNjXOAmWgtz01JqtuCrckHT7PbUymDyQIXuk5Mmd6Vb1hpAfUw-rmCfP7GnibUaFwpAivjaBSGpvDqB3HVbGGgqmMrIUxQA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4", ['Salt is processed & ready to supply','Date : 21/03/2023','Location : ABC, Salt Factory, Delhi']),
                            plainEventDisplay("Packaging of Product", "https://s3-alpha-sig.figma.com/img/2438/38ff/0bb74921347ddad1128309d23e71fcc6?Expires=1686528000&Signature=bVjAj5M80jgywm~nOQgKMsOCYXhDLzAOQ~bwzwrBqgusM7L-1Y-kb~xwkpgoFr7mod6tmFuRQjANMd0r6cGNrMZFOBdCufonnygOGhhpz1kxUV~Q0t~H5AzGovGA43k24Z5p4zTlmv~Kfgb7eA-8HeSuA8tf1snAx0M2lI-wZhulUv6M4s-k5YpzJas0OvzA2iCv4JManB67PHViLqNQ4a4IDRsOraKT-kHc2hkbPSc0bJL1P8Z6K2wnhXP8IgOI0CpIZ3fpMwpn~9HQxqXVoejFSScjixbJ5clTysQbMF5pdCwfxthorUoya80Vzx-uQdCqldz-fWxVXSKRU~TLgg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4", ['Product is packed & ready to deliver','Date : 21/03/2023','Location : ABC, Salt Factory']),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 1)),
                    SizedBox(height: 5,),
                    TimelineTheme(
                        data: TimelineThemeData(lineColor: Color(0xffED8F03)),
                        child: Timeline(
                          indicatorSize: 10,
                          events: [
                            plainEventDisplay("Delivered to Store", "https://s3-alpha-sig.figma.com/img/429f/4a1c/79c40b27584d5be52d8c1062e23262cd?Expires=1686528000&Signature=KFbQsLmbIPSDwo-2V99gnyOzvTy0pk6wyaNVvfjdasX5okmACjR63nsVIPmvuIYh30M1~IgZh1l2V8V0T~0XV97XFLU6hs9vEZLLxS4Nkjh~KtA1hvfl9SP06JUXzQg09pC6EXS~DW1LPPlH5XQLAfq29eyHj8h9u4wDoUtmwP6AIawHk64bEEvo-TIfWW-mkvxuBlGEeZZxxxMYgnXEkKhQdV0I6NVMjxbZ5pUHW6hchfoj66D0qPVSzAqFbOht1qfDko-wZx-oaU2CaHFx0YPIEYbEq-ns84oJGz3eVMVhu2FyZBv7rxLrPXSgPGYGiMWlcEX2AKrI3cBgeXADEg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4", ['Delivered to Kanta General Store','Date : 28/03/2023','Location : Karol Bagh, Delhi']),
                      TimelineEventDisplay(
                          child: TimelineEventCard(
                            title: Text("Delivered to Customer",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                            content: Row(
                              children: [
                                Container(
                                  width: 68,
                                  height: 48,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: SvgPicture.asset('assets/correct.svg'),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 160,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivered to Mr. Shivam Varshney',style: TextStyle(fontSize: 10),maxLines: 2,),
                                      Text("Date : 07/04/2023"),
                                      Text("Location : ABC, Salt Factory")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          indicator:Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Color(0xffED8F03),
                                shape: BoxShape.circle
                            ),
                          )
                      )
                          ],
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
