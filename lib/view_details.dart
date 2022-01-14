import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ThemeData/app_colors.dart';
import 'ThemeData/dimensions.dart';
import 'heading_title.dart';

class InvoiceListing extends StatefulWidget {
  const InvoiceListing({Key? key}) : super(key: key);

  @override
  _InvoiceListingState createState() => _InvoiceListingState();
}

class _InvoiceListingState extends State<InvoiceListing>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // final PackageProvider _packageProvider = PackageProvider();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
    // _packageProvider.getPackageInvoice();
  }

  // Future<void> _refresh() async {
  //   // await Future.delayed(Duration(seconds: 1));
  //   // setState(() {
  //   return _packageProvider.getPackageInvoice();
  //   // });
  // }

  @override
  void dispose() {
    tabController.dispose();
    _refreshIndicatorKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final packageListProvider = context.watch<PackageProvider>();

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          'VLCC',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.logoOrange,
            fontWeight: FontWeight.w700,
            fontSize: FontSize.heading,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: false,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 14,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(PaddingSize.small),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.backBorder),
                    borderRadius: BorderRadius.circular(16)),
                child: Icon(
                  Icons.keyboard_backspace,
                  size: 24,
                  color: AppColors.profileEnabled,
                ),
              ),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: TabBar(
                isScrollable: true,
                unselectedLabelStyle: TextStyle(
                    color: AppColors.profileEnabled,
                    fontWeight: FontWeight.w500),
                labelStyle: TextStyle(
                  color: AppColors.profileEnabled,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.heading,
                ),
                padding: EdgeInsets.only(right: screenSize.width * 0.35),
                indicatorColor: AppColors.profileEnabled,
                controller: tabController,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'Booking',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Packages',
                    ),
                  ),
                ],
              ),
              pinned: true,
              floating: true,
              backgroundColor: AppColors.backgroundColor,
            ),
          ];
        },
        body: body(context: context),
      ),
    );
  }

  Widget body({required BuildContext context}) {
    return TabBarView(
      controller: tabController,
      children: [
        listing(
          isBooking: true,
          invoiceID: 'Booking ID: #236549',
          date: 'Aug 25, 2021 · 09:45 am',
          packageName: 'Safe Health clinic',
          packageTitle: 'Dermatology',
          price: 'Rs. 1250',
          ontap: () {},
        ),
        listing(
          invoiceID: 'Invoice ID: #236549',
          date: 'Aug 25, 2021 · 09:45 am',
          packageName: 'Package name',
          packageTitle: 'Safe Health clinic',
          price: 'Rs. 1250',
          ontap: () {},
        )
      ],
    );
  }

  Widget listing(
      {required String invoiceID,
      required String date,
      required String packageName,
      required String packageTitle,
      required String price,
      required void Function() ontap,
      bool isBooking = false}) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSize.extraLarge),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: List.generate(3, (index) {
          // var bookingDate = date;
          // var bookingDate = DateFormat.yMMMd().format(
          //     packageListFromModel![index].invoiceDate ?? DateTime.now());
          // var bookingDate = packageListFromModel![0].invoiceDate.toString();
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingTitleText(
                        fontSize: FontSize.small,
                        title: isBooking
                            ? 'Booking ID: #236549'
                            : 'Invoice ID: #236549',
                        color: AppColors.grey,
                      ),
                      HeadingTitleText(
                        fontSize: FontSize.small,
                        title: isBooking
                            ? DateFormat.yMMMd().format(DateTime.now())
                            : DateFormat.yMMMd().format(DateTime.now()),
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  Divider(),
                  HeadingTitleText(
                    fontSize: FontSize.large,
                    title: isBooking ? 'Booking Date' : 'Invoice Date',
                  ),
                  HeadingTitleText(
                    fontSize: FontSize.small,
                    fontWeight: FontWeight.w600,
                    title: isBooking ? 'Test Center' : 'Test Booking',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: RichText(
                            text: TextSpan(
                                text: 'Paid ',
                                style: TextStyle(
                                  fontSize: FontSize.small,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.profileEnabled,
                                ),
                                children: <TextSpan>[
                              TextSpan(
                                  text: isBooking ? "Rs ${1250}" : "Rs ${3000}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Text('View details'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // bool getIsInvoiceAvailable({required String packageName}) {
  //   var isPresent = true;
  //   var package = _packageProvider
  //       .getPackageSpecificInvoice(packageName: packageName)
  //       .then((value) {
  //     if (value.invoicePackageBooingNumber != '') {
  //       isPresent = true;
  //     } else {
  //       isPresent = false;
  //     }
  //   });
  //   return isPresent;
  // }
}
