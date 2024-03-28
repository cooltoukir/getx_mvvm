import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/general_exceptions_widget.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              userPreference.removeUser().then((value) {
                Get.offAllNamed(RouteName.loginView);
              });
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeController.error.value == "No internet") {
              return InterNetExceptionWidget(
                onPress: () {
                  homeController.userListApi();
                },
              );
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.userListApi();
              });
            }
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                });
        }
      }),
    );
  }
}
