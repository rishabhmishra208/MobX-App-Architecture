import 'package:flutter_modular/flutter_modular.dart';

import 'admin_widget.dart';
import '../../../Constants/constants_export.dart';
import '../../Screens/Home_Screen/home_screen.dart';
import '../../../Controllers/controllers_export.dart';
import '../../Screens/Search_Screen/search_screen.dart';
import '../../Screens/My_Space_Screen/my_space_screen.dart';
import '../../Screens/Download_Screen/download_screen.dart';
import '../../Screens/New_And_Hot_Screen/new_and_hot_screen.dart';

class AdminModule extends Module {
  @override
  void binds(i) {
    i.addInstance(AdminController());
  }

  @override
  void routes(r) {
    r.child(
      Routes.splash,
      child: (context) => const AdminWidget(),
      children: [
        ChildRoute(
          Routes.homeScreen,
          child: (context) => const HomeScreen(),
        ),
        ChildRoute(
          Routes.searchScreen,
          child: (context) => const SearchScreen(),
        ),
        ChildRoute(
          Routes.newAndHotScreen,
          child: (context) => const NewAndHotScreen(),
        ),
        ChildRoute(
          Routes.downloadsScreen,
          child: (context) => const DownloadScreen(),
        ),
        ChildRoute(
          Routes.mySpaceScreen,
          child: (context) => const MySpaceScreen(),
        ),
      ],
    );
  }
}
