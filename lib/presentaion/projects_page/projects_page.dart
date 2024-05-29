import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tech_no_fear/presentaion/projects_page/devices/projects_page_desktop.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? const ProjectsPageDesktop()
                .animate()
                .fadeIn(duration: const Duration(seconds: 1))
            : const SizedBox.shrink();
      },
    );
  }
}
