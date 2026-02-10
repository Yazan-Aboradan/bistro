abstract class AppUrls {
  static const baseUrl = 'https://api-bistro.scanly-app.com';
  static const getGamesUrl = baseUrl +'/api/menu/games/';
  static const getCategoriesUrl = baseUrl+'/api/menu/categories/';
  static const getWelcomingMessageUrl ='$baseUrl/api/mobile/settings/';
  static const languageUserUrl=baseUrl+'/api/users/users/change-language/';
  static const registerUserUrl = baseUrl+'/api/users/signup/';
  static const editUserUrl = baseUrl+'/api/users/update/';
  static const loginUrl = baseUrl+'/api/users/login/';
  static const featuredProductsUrl = baseUrl+'/api/menu/featured-products/';
  static const validatePhoneUrl = baseUrl+ '/api/users/validate-phone/';
}