import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixamtec/UI/Views/base_widget.dart';
import 'package:sixamtec/UI/Views/sizing_information.dart';
import 'package:sixamtec/Utils/adaptive_text_size.dart';
import 'package:sixamtec/Utils/colors.dart';
import 'package:sixamtec/Utils/const.dart';
import 'package:sixamtec/Utils/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 0;
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: customAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                searchPortion(context),

                ///Banner.......
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: sliderImages.length,
                        options: CarouselOptions(
                            height: (sizingInformation.localwidgetsize!.height /
                                    15) *
                                1.6,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 2),
                            onPageChanged: (index, reason) {
                              setState(() {
                                _activeIndex = index;
                              });
                            }),
                        itemBuilder: (context, index, realIndex) {
                          final image = sliderImages[index];
                          return buildImage(image, index);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildIndicator(),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 17.0, right: 13.0),
                  child: titleBar(),
                ),

                ///Categories List......
                SizedBox(
                  height: 100,
                  child: categoryList(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 13.0, top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Popular Food Nearby',
                        style: GoogleFonts.roboto(
                          textStyle: titleTextStyle(),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'View All',
                        style: GoogleFonts.poppins(
                          textStyle: greyTextMediumStyle().copyWith(
                            color: orangeColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///  List of Popular foods Nearby.....
                Container(
                  height: 110,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView.builder(
                    itemCount: popularFoods.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return listOfPopularFoods(index);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 13.0, top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Food Campaign',
                        style: GoogleFonts.roboto(
                          textStyle: titleTextStyle(),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'View All',
                        style: GoogleFonts.poppins(
                          textStyle: greyTextMediumStyle().copyWith(
                            color: orangeColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///  List of Food Campaign.....
                foodCampaignPortion(sizingInformation),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 13.0, top: 20.0),
                  child: Row(
                    children: [
                      Text(
                        'Popular Restaurants',
                        style: GoogleFonts.roboto(
                          textStyle: titleTextStyle(),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'View All',
                        style: GoogleFonts.poppins(
                          textStyle: greyTextMediumStyle().copyWith(
                            color: orangeColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  padding: const EdgeInsets.only(top: 2),
                  child: ListView.builder(
                    itemCount: popularFoods.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return listOfItems(
                          sizingInformation, index, popularFoods);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 13.0, top: 20.0),
                  child: Row(
                    children: [
                      Text(
                        'All Restaurants',
                        style: GoogleFonts.roboto(
                          textStyle: titleTextStyle(),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'View All',
                        style: GoogleFonts.poppins(
                          textStyle: greyTextMediumStyle().copyWith(
                            color: orangeColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///New on App Name.....
                Container(
                  height: 220,
                  padding: const EdgeInsets.only(top: 2),
                  child: ListView.builder(
                    itemCount: appName.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return listOfItems(sizingInformation, index, appName);
                    },
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 13.0, top: 20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New on App Name',
                            style: GoogleFonts.roboto(
                              textStyle: titleTextStyle(),
                            ),
                          ),
                          Text(
                            '200+ Near you',
                            style: GoogleFonts.poppins(
                              textStyle: greyTextMediumStyle().copyWith(
                                color: miniTextColor,
                                fontSize: mediumFontSize - 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.tune_rounded,
                        ),
                        itemBuilder: (context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'All',
                                      style: GoogleFonts.roboto(
                                        textStyle:
                                            greyTextMediumStyle().copyWith(
                                          color: blackTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: greyTextColor,
                                    thickness: 0.0,
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Take Away',
                                      style: GoogleFonts.roboto(
                                        textStyle:
                                            greyTextMediumStyle().copyWith(
                                          color: blackTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: greyTextColor,
                                    thickness: 0.0,
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Home Delivery',
                                      style: GoogleFonts.roboto(
                                        textStyle:
                                            greyTextMediumStyle().copyWith(
                                          color: blackTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: greyTextColor,
                                    thickness: 0.0,
                                  ),
                                ],
                              ),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    itemCount: allRestaurants.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return allRestaurant(index);
                    }),
                // const SizedBox(
                //   height: 50,
                // ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: greyTextColor, width: 0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navItem('assets/images/home.svg', whiteColor, 0),
                navItem('assets/images/love.svg', whiteColor, 1),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: orangeColor,
                  ),
                  child: SvgPicture.asset('assets/images/shopping-cart 1.svg',
                      color: whiteColor),
                ),
                navItem('assets/images/save.svg', whiteColor, 3),
                navItem('assets/images/menu 1.svg', whiteColor, 4),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Slider View.......
  Widget buildImage(String image, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }

  ///Indecator....
  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _activeIndex,
      count: sliderImages.length,
      effect: ScrollingDotsEffect(
        dotHeight: 5,
        dotWidth: 5,
        dotColor: orangeColor.withOpacity(0.37),
        activeDotColor: orangeColor,
      ),
    );
  }

  Widget navItem(String image, Color nBackgroundColor, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: nBackgroundColor,
        ),
        child: SvgPicture.asset(image,
            color: index == _selectIndex ? orangeColor : Colors.grey),
      ),
    );
  }

  Widget allRestaurant(int index) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 36, top: 13, bottom: 13),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            allRestaurants[index]['icon'].toString(),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          allRestaurants[index]['banner'].toString().isEmpty
                              ? false
                              : true,
                      child: Positioned(
                        left: 0,
                        top: 25,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            '30% off',
                            style: GoogleFonts.poppins(
                              textStyle: greyTextMediumStyle().copyWith(
                                fontSize: mediumFontSize - 4,
                                color: whiteColor,
                                fontWeight: FontWeight.w500,
                                // height: 20.02,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        allRestaurants[index]['name'].toString(),
                        style: GoogleFonts.poppins(
                          textStyle: greyTextMediumStyle().copyWith(
                            color: blackTextColor,
                            fontWeight: FontWeight.w500,
                            // height: 20.02,
                          ),
                        ),
                      ),
                      const SizedBox(height: 1),
                      Row(
                        children: [
                          Text(
                            'Mc Donald, New york, USA',
                            style: GoogleFonts.poppins(
                              textStyle: greyTextMediumStyle().copyWith(
                                fontSize: mediumFontSize - 2,
                                color: miniTextColor,
                                // height: 20.02,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: greyTextColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            height: 8,
                            width: 8,
                          ),
                          const SizedBox(
                            width: 2.7,
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            height: 8,
                            width: 8,
                          ),
                          const SizedBox(
                            width: 2.7,
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            height: 8,
                            width: 8,
                          ),
                          const SizedBox(
                            width: 2.7,
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            height: 8,
                            width: 8,
                          ),
                          const SizedBox(
                            width: 2.7,
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            height: 8,
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: greyTextColor,
          height: 1,
          endIndent: 8,
          indent: 8,
        ),
      ],
    );
  }

  Padding listOfItems(SizingInformation sizingInformation, int index,
      List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 3),
      child: Stack(
        children: [
          Container(
            width: sizingInformation.localwidgetsize!.width * 0.7,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: shadoColor.withOpacity(0.08),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          items[index]['icon'].toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hungry Puppets',
                          style: GoogleFonts.roboto(
                            textStyle: greyTextMediumStyle().copyWith(
                              color: blackTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '76A eighth evenue, New York, US',
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              color: miniTextColor,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(width: 2.7),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '(2)',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  color: miniTextColor,
                                  fontSize: mediumFontSize - 2,
                                  // height: 20.02,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible:
                popularFoods[index]['banner'].toString().isEmpty ? false : true,
            child: Positioned(
              left: 0,
              top: 35,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Text(
                  '30% off',
                  style: GoogleFonts.poppins(
                    textStyle: greyTextMediumStyle().copyWith(
                      fontSize: mediumFontSize - 4,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      // height: 20.02,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding listOfPopularFoods(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 80,
            width: 200,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: shadoColor.withOpacity(0.08),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          popularFoods[index]['icon'].toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          popularFoods[index]['name'].toString(),
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              color: blackTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          'Mc Donald, New york, USA',
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              fontSize: mediumFontSize - 4,
                              color: miniTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '\$5',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  fontSize: mediumFontSize - 2,
                                  color: blackTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$10',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  fontSize: mediumFontSize - 4,
                                  color: miniTextColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/plus.png',
                              height: 14,
                              width: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible:
                popularFoods[index]['banner'].toString().isEmpty ? false : true,
            child: Positioned(
              left: 0,
              top: 35,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Text(
                  '30% off',
                  style: GoogleFonts.poppins(
                    textStyle: greyTextMediumStyle().copyWith(
                      fontSize: mediumFontSize - 4,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      // height: 20.02,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding foodCampaignPortion(SizingInformation sizingInformation) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 10),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            height: 200,
            width: sizingInformation.localwidgetsize!.width * 0.4,
            //padding: const EdgeInsets.only(left: 17, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/burger1.jpg'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Burger',
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              color: blackTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          'Mc Donald, New york, USA',
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              fontSize: mediumFontSize - 4,
                              color: miniTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '\$5',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  fontSize: mediumFontSize - 2,
                                  color: blackTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$5',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  fontSize: mediumFontSize - 4,
                                  color: miniTextColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/plus.png',
                              height: 14,
                              width: 14,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: sizingInformation.localwidgetsize!.width * 0.03,
          ),
          Container(
            height: 200,
            width: sizingInformation.localwidgetsize!.width * 0.45,
            //padding: const EdgeInsets.only(left: 17, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/burger2.jpg'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Burger',
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              color: blackTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          'Mc Donald, New york, USA',
                          style: GoogleFonts.poppins(
                            textStyle: greyTextMediumStyle().copyWith(
                              fontSize: mediumFontSize - 4,
                              color: miniTextColor,
                              fontWeight: FontWeight.w500,
                              // height: 20.02,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                            const SizedBox(
                              width: 2.7,
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              height: 8,
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '\$5',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  fontSize: mediumFontSize - 2,
                                  color: blackTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$5',
                              style: GoogleFonts.poppins(
                                textStyle: greyTextMediumStyle().copyWith(
                                  fontSize: mediumFontSize - 4,
                                  color: miniTextColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/plus.png',
                              height: 14,
                              width: 14,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView categoryList() {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50.0,
                width: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: shadoColor.withOpacity(0.08),
                      offset: const Offset(0, 3),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  categories[index]['icon'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                categories[index]['name'].toString(),
                style: GoogleFonts.poppins(
                  textStyle: greyTextMediumStyle().copyWith(
                    color: blackTextColor,
                    fontWeight: FontWeight.w500,
                    // height: 20.02,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row titleBar() {
    return Row(
      children: [
        Text(
          'Categories',
          style: GoogleFonts.roboto(
            textStyle: titleTextStyle(),
          ),
        ),
        const Spacer(),
        Text(
          'View All',
          style: GoogleFonts.poppins(
            textStyle: greyTextMediumStyle().copyWith(
              color: orangeColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Container searchPortion(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: shadoColor.withOpacity(0.07),
              offset: const Offset(0, 5),
              blurRadius: 18,
            ),
          ]),
      child: Row(
        children: [
          Text(
            'Search food or restaurent here...',
            style: greyTextMediumStyle().copyWith(
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, mediumFontSize),
            ),
          ),
          const Spacer(),
          SvgPicture.asset('assets/images/search.svg')
        ],
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            height: 12,
            width: 12,
            child: SvgPicture.asset(
              'assets/images/home.svg',
              color: greyTextColor,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '76A eighth evenue, New York, US',
            style: greyTextMediumStyle().copyWith(
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, mediumFontSize),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/images/notification.svg'),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
