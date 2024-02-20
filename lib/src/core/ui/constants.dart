import 'package:flutter/material.dart';


sealed class FontConstants {
  static const fontFamily = 'Poppins';
}

sealed class ImageConstants{
  static const backgroundChair = 'assets/images/background_image_chair.jpg';
  static const imageLogo = 'assets/images/imgLogo.png';
  static const avatar = 'assets/images/avatar.png';
}

sealed class ColorsConstants{
  static const brow = Color(0xFFB07B01);
  static const grey = Color(0xFF999999);
  static const greyLight = Color(0xFFE6E2E9);
  static const red = Color(0xFFEB1212);
}

sealed class RouteConstants{
  static const login = '/auth/login';
  static const registerUser = '/auth/register/user';
  static const registerBarberShop = '/auth/register/barbershop';
  static const homeAdm = '/home/adm';
  static const homeEmployee = '/home/employee';
  static const registerEmployee = '/register/employee';//tela
  static const users = '/users';
  static const barbershop = '/barbershop';
}