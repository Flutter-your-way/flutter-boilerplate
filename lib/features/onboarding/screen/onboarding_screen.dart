// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ladakh_tour/common/colors/app_colors.dart';
// import 'package:ladakh_tour/common/images/app_images.dart';
// import 'package:tempo_agency/common/colors/app_colors.dart';
// import 'package:tempo_agency/common/images/app_images.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   // List<PageModel> pages = [
//   //   PageModel(
//   //     image: AppImages.onboarding_mockup,
//   //     title: "Welcome ",
//   //     subtitle:
//   //         "Get ready to experience hassle-free transportation. Experience a selection of pre planned tours or build your own using our custom tours section.",
//   //   ),
//   //   PageModel(
//   //     image: AppImages.onboarding_mockup,
//   //     title: "Book your seat in a shared tour.",
//   //     subtitle: "Share the tour with other fellow travellers.",
//   //   ),
//   //   PageModel(
//   //     image: AppImages.onboarding_mockup,
//   //     title: "Custom Tour / Schedule Bookings",
//   //     subtitle:
//   //         "Not finding your choice of tours? Make your own tour with location selections.",
//   //   ),
//   // ];

//   final PageController _controller = PageController();

//   @override
//   void initState() {
//     super.initState();

//     _controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var h = MediaQuery.sizeOf(context).height;
//     // var w = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       backgroundColor: AppColors.primaryGreen,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             top: 24.h,
//             // left: 28,
//             // right: 28,
//             child: Stack(
//               children: [
//                 // SizedBox(height: (h * .08)),
//                 PageView.custom(
//                   controller: _controller,
//                   physics: const NeverScrollableScrollPhysics(),
//                   childrenDelegate: SliverChildBuilderDelegate(
//                     childCount: pages.length,
//                     (context, index) {
//                       PageModel m = pages[index];
//                       return Stack(
//                         children: [
//                           Positioned(
//                             left: 24,
//                             right: 24,
//                             child: Image.asset(
//                               m.image,
//                               width: 345.w,
//                               height: 700.h,
//                             ),
//                           ),
//                           Positioned(
//                             left: 0,
//                             right: 0,
//                             bottom: 0,
//                             child: ClipPath(
//                               clipper: MyClipper(),
//                               child: Container(
//                                 height: 450.h,
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 20, horizontal: 20),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.white,
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         SizedBox(height: 20.h),
//                                         Text(
//                                           m.title,
//                                           style: GoogleFonts.urbanist(
//                                             fontSize: 32.sp,
//                                             color: AppColors.black,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         SizedBox(
//                                           height: 16.h,
//                                         ),
//                                         Text(
//                                           m.subtitle,
//                                           style: GoogleFonts.urbanist(
//                                             color: AppColors.grey,
//                                             fontSize: 18.sp,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         SizedBox(
//                                           height: 24.h,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 Positioned(
//                   left: 24,
//                   right: 24,
//                   bottom: 16.h,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         SmoothPageIndicator(
//                           controller: _controller,
//                           count: pages.length,
//                           effect: ExpandingDotsEffect(
//                             activeDotColor: AppColors.primaryGreen,
//                             dotColor: AppColors.grey,
//                             dotHeight: 8.0,
//                             dotWidth: 16.0,
//                             expansionFactor: 2,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 32.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             _controller.hasClients &&
//                                     (_controller.page ?? 0) >= 2
//                                 ? Container()
//                                 : MaterialButton(
//                                     color: AppColors.lightGreen,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(1002),
//                                     ),
//                                     splashColor: Colors.black.withOpacity(.1),
//                                     focusElevation: 0,
//                                     hoverElevation: 0,
//                                     highlightElevation: 0,
//                                     elevation: 0,
//                                     onPressed: () {
//                                       Navigator.pushReplacementNamed(context,
//                                           '/signup'); // Navigate to login route
//                                     },
//                                     child: Container(
//                                       decoration: const BoxDecoration(
//                                           // color: AppColors.lightGreen,
//                                           ),
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 42.w, vertical: 16),
//                                       child: Text(
//                                         "Skip",
//                                         style: TextStyle(
//                                           color: AppColors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ),
//                                   ), // Empty container for last page
//                             SizedBox(
//                                 width: 24
//                                     .w), // SizedBox of the same width as the "Skip" button
//                             MaterialButton(
//                               onPressed: () {
//                                 if (_controller.hasClients &&
//                                     (_controller.page ?? 0) >= 2) {
//                                   Navigator.pushReplacementNamed(context,
//                                       '/signup'); // Navigate to login route
//                                 } else {
//                                   _controller.nextPage(
//                                       duration:
//                                           const Duration(milliseconds: 300),
//                                       curve: Curves.fastOutSlowIn);
//                                 }
//                               },
//                               color: AppColors.lightGreen,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(1002),
//                               ),
//                               splashColor: Colors.black.withOpacity(.1),
//                               focusElevation: 0,
//                               hoverElevation: 0,
//                               highlightElevation: 0,
//                               elevation: 0,
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 20.w, vertical: 16),
//                                 child: Text(
//                                   _controller.hasClients &&
//                                           (_controller.page ?? 0) >= 2
//                                       ? "Get Started"
//                                       : "Continue",
//                                   style: TextStyle(
//                                     color: AppColors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 20.h),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PageModel {
//   String image;
//   String title;
//   String subtitle;
//   PageModel({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//   });
// }

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(size.width / 2, 50, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }