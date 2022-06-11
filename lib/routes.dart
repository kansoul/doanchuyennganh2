import 'package:chatapp/screens/add_friend/add_friend.dart';
import 'package:chatapp/screens/chats_screen/chats_screen.dart';
import 'package:chatapp/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'profile/edit_profile/edit_profile_screen.dart';
import 'profile/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/welcome/welcome_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  ChatsScreen.routeName: (context) => ChatsScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  AddFriendScreen.routeName: (context) => AddFriendScreen(),
  //VideoCallScreem.routeName: (context) => VideoCallScreem(),
};
