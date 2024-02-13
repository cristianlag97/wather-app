enum PAGES {
  config,
  error,
  home,
  searchcity,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.config:
        return "/config";
      case PAGES.searchcity:
        return "/search-city";
      case PAGES.error:
        return "/error";
      case PAGES.home:
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.config:
        return "CONFIG";
      case PAGES.searchcity:
        return "SEARCH-CITY";
      case PAGES.error:
        return "ERROR";
      case PAGES.home:
      default:
        return "HOME";
    }
  }
}
