import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tech_no_fear/blocs/bloc/page_bloc.dart';
import 'package:tech_no_fear/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_no_fear/presentaion/home_page/devices/home_page_desktop.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PageBloc>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop
                ? const HomePageDesktop()
                : const SizedBox.shrink();
          },
        )),
      ),
    );
  }
}
