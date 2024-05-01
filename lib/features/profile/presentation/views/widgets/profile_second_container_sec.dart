import 'package:flutter/material.dart';
import 'package:food_recipes/core/helpers/custom_lunch_url.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/features/profile/presentation/views/widgets/custom_row_service_container.dart';
import '../../../../../core/routing/routes.dart';

class ProfileSecondContainerSec extends StatelessWidget {
  const ProfileSecondContainerSec({super.key});

  @override
  Widget build(BuildContext context) {

    return   Column(
      children: [
        CustomRowServiceContainer(
          onPressed: () {
            context.pushNamed(Routes.accountEditingViewView);
          },
          name: "Edit Account",
          iconName: Icons.person,
        ),
        CustomRowServiceContainer(
          onPressed: () {
            context.pushNamed(Routes.themeView);
          },
          name: "Theme",
          iconName: Icons.color_lens_outlined,
        ),
        CustomRowServiceContainer(
          onPressed: () {
            context.pushNamed(Routes.languageView);
          },
          name: "Language",
          iconName: Icons.language_outlined,
        ),
        CustomRowServiceContainer(
          onPressed: () {
            customLunchUrl(context,'https://www.linkedin.com/in/ebrahim-elkbbany-4b2374213/');
          },
          name: "Contact us",
          iconName: Icons.email,
        ),
        CustomRowServiceContainer(
          isLast: true,
          onPressed: () {},
          name: "Notifications",
          iconName: Icons.notifications,
        ),
      ],
    );
  }
}
