import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/screens/detail_screen.dart';
import 'package:covid_19_app/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                InfoCard(
                  title: "Confirmed Cases",
                  number: 39538,
                  iconColor: Color(0xFFFF8C00),
                  pressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen();
                      },
                    ));
                  },
                ),
                InfoCard(
                  title: "Total Deaths",
                  number: 12538,
                  iconColor: Color(0xFFFF2D55),
                  pressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen();
                      },
                    ));
                  },
                ),
                InfoCard(
                  title: "Total Recovered",
                  number: 559,
                  iconColor: Color(0xFF50E3C2),
                  pressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen();
                      },
                    ));
                  },
                ),
                InfoCard(
                  title: "New Cases",
                  number: 2506,
                  iconColor: Color(0xFF5856D6),
                  pressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen();
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Preventions",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  buildPrevention(),
                  SizedBox(height: 40),
                  buildHelpCard(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PreventionCard(
          svgResource: "assets/icons/hand_wash.svg",
          title: "Wash Hands",
        ),
        PreventionCard(
          svgResource: "assets/icons/use_mask.svg",
          title: "Wear Mask",
        ),
        PreventionCard(
          svgResource: "assets/icons/clean_disinfect.svg",
          title: "Clean Disinfect",
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 130,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.4,
              top: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8059),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for medical help!",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptoms appear.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgResource;
  final String title;

  const PreventionCard({
    Key key,
    this.svgResource,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgResource),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
