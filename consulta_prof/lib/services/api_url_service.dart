
class ApiUrlService {
  final String _ipAddressDev = '192.168.1.240';
  String get _urlApi {
    return "http://$_ipAddressDev/ConsultaProfApi/";
  }

  String concat(String urlBase, String url) {
    if (urlBase.endsWith("/")) return "$urlBase$url";
    return "$urlBase/$url";
  }

  String getApi(String url) {
    return concat(_urlApi, url);
  }

  String urlReportLog() {
    return concat(_urlApi, 'Log/RegistreLog/');
  }
}
