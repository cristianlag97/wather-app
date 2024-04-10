enum PAGES {
  config,
  error,
  home,
  splash,
  searchcity,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.config:
        return "/config";
      case PAGES.searchcity:
        return "/search-city";
      case PAGES.splash:
        return '/splash';
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
      case PAGES.splash:
        return 'SPLASH';
      case PAGES.error:
        return "ERROR";
      case PAGES.home:
      default:
        return "HOME";
    }
  }
}
