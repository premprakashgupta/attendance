import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/modules/landing/controllers/landing_controller.dart';
import 'package:attendance/app/modules/test.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:attendance/app/data/data.dart';
import 'package:attendance/app/modules/landing/controllers/slider_controller.dart';
import 'package:attendance/utils/colors.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:attendance/widgets/shadow_container.dart';

class HomeView extends GetView<GetxController> {
  HomeView({Key? key}) : super(key: key);
  final SliderController _sliderController = Get.find<SliderController>();
  final AuthController _authController = Get.find<AuthController>();
  final LandingController _landingController = Get.find<LandingController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return GlassyEqualizerLoader();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Gap(20),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Welcome, ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: _authController.currentUser!.email.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                child: _carosel(context, size),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: CustomeData.images.asMap().entries.map((entry) {
                  return Obx(
                    () => Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _sliderController.pageIndex == entry.key
                            ? CustomeColors.mainclr
                            : CustomeColors.shadow,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Gap(40),
              SizedBox(
                child: Obx(() {
                  if (_authController.isLoading == true ||
                      _authController.userData == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return _authController.userData!['role'].toString() ==
                            'student'
                        ? const SizedBox()
                        : ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromHeight(45),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: const Text('Create Class'),
                          );
                  }
                }),
              ),
              const Gap(20),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: _banners(context, size)),
            ],
          ),
        ),
      ),
    );
  }

  _carosel(BuildContext context, Size size) {
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * .4,
        onPageChanged: (index, reason) {
          _sliderController.pageIndexFunc(value: index);
        },
        autoPlay: true,
      ),
      items: CustomeData.images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: CustomeColors.imgBg),
              child: CachedNetworkImage(
                imageUrl: i,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  _banners(BuildContext context, Size size) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CustomeData.homeScreenCategory.length,
        itemBuilder: ((context, index) {
          return CustomContainer(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomeHeader(
                          text: CustomeData.homeScreenCategory[index]
                              ['header']!),
                      const Gap(10),
                      CustomeSubHeader(
                          text: CustomeData.homeScreenCategory[index]['desc']!)
                    ],
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CachedNetworkImage(
                      imageUrl: CustomeData.homeScreenCategory[index]
                          ['image']!),
                )
              ]),
            ),
          );
        }));
  }
}
