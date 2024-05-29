import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:tech_no_fear/blocs/bloc/page_bloc.dart';
import 'package:tech_no_fear/config/app_colors.dart';
import 'package:tech_no_fear/config/strings.dart';
import 'package:tech_no_fear/gen/assets.gen.dart';
import 'package:tech_no_fear/gen/fonts.gen.dart';
import 'package:tech_no_fear/main.dart';
import 'package:tech_no_fear/presentaion/projects_page/projects_page.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.person,
                size: 30,
              ),
              GlassContainer(
                blur: 4,
                border: const Border.fromBorderSide(BorderSide.none),
                color: AppColors.whiteColor.withOpacity(0.1),
                shadowStrength: 5,
                borderRadius: BorderRadius.circular(15),
                shadowColor: AppColors.whiteColor.withOpacity(0.3),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: AppColors.whiteColor),
                          onPressed: () {
                            getIt
                                .get<PageBloc>()
                                .add(PageChangeEvent(newPage: 0));
                          },
                          child: const Text(
                            Strings.home,
                            style: TextStyle(
                                fontFamily: FontFamily.interSemiBold,
                                fontSize: 16),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: AppColors.whiteColor),
                          onPressed: () {
                            getIt
                                .get<PageBloc>()
                                .add(PageChangeEvent(newPage: 1));
                          },
                          child: const Text(
                            Strings.aboutUs,
                            style: TextStyle(
                                fontFamily: FontFamily.interSemiBold,
                                fontSize: 16),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: AppColors.whiteColor),
                          onPressed: () {
                            getIt
                                .get<PageBloc>()
                                .add(PageChangeEvent(newPage: 2));
                          },
                          child: const Text(
                            Strings.projects,
                            style: TextStyle(
                                fontFamily: FontFamily.interSemiBold,
                                fontSize: 16),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<PageBloc, PageData>(
            bloc: getIt.get<PageBloc>(),
            builder: (context, state) {
              return [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 20, top: 150, bottom: 150),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(children: [
                                const TextSpan(
                                    text: Strings.welcomeToTNF,
                                    style: TextStyle(
                                        height: 0,
                                        fontFamily: FontFamily.interMedium,
                                        fontSize: 30)),
                                WidgetSpan(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Assets.images.welcome
                                      .image(height: 40, width: 40),
                                ))
                              ])),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) => (LinearGradient(
                                    colors: [
                                      AppColors.primaryLightColor,
                                      AppColors.primaryDarkColor
                                    ])).createShader(
                                  Rect.fromLTWH(
                                      0, 0, bounds.width, bounds.height),
                                ),
                                child: const Text(Strings.appName,
                                    style: TextStyle(
                                        fontFamily: FontFamily.bebasNeueRegular,
                                        fontSize: 60)),
                              )
                            ],
                          ),
                        ),
                        GlassContainer(
                          shadowColor: AppColors.primaryDarkColor,
                          border: const Border.fromBorderSide(BorderSide.none),
                          blur: 10,
                          child: Assets.images.iphone
                              .image(height: 300, width: 340, fit: BoxFit.fill),
                        )
                      ],
                    ),
                  ),
                )
                    .animate()
                    .moveY(
                        duration: const Duration(seconds: 1),
                        begin: 1000,
                        curve: Curves.decelerate)
                    .fadeIn(duration: const Duration(seconds: 4)),
                Container(),
                const ProjectsPage()
              ][state.currentPage];
            },
          ),
        )
      ],
    );
  }
}
