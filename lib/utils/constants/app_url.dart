class AppUrl {
  static var baseUrl1 = 'https://reqres.in' ;
  ////Because baseUrl1 is a testing url its not working so I use a private collection url////
  ///credentials to login for testing(email: aammir2000@gmail.com  , password:123456)///////
  static var baseUrl = 'https://api.staging.zeedlive.com/api/v1/';
  ////////////////////////// Registration and Auth URL ///////////////
  static String loginEndPint = '${baseUrl}login';

  static String registerApiEndPoint = '$baseUrl1/api/register';

  ///

}
