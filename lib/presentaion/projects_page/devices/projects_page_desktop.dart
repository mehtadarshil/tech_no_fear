import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:tech_no_fear/config/app_colors.dart';
import 'package:tech_no_fear/gen/fonts.gen.dart';

class ProjectsPageDesktop extends StatelessWidget {
  const ProjectsPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Wrap(
          spacing: 60,
          runSpacing: 40,
          children: List.generate(
            20,
            (index) => const ProjectCard(),
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 220,
      border: const Border.fromBorderSide(BorderSide.none),
      shadowColor: AppColors.whiteColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(25),
      color: AppColors.blackColor,
      blur: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: CachedNetworkImage(
              imageUrl: "https://picsum.photos/200",
              width: 220,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Spending Forms",
              style: TextStyle(fontFamily: FontFamily.interBold, fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Spending Forms is expense management app, where user can add expense, slip there bills, send a friend requests, etc.",
              style:
                  TextStyle(fontFamily: FontFamily.interRegular, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
