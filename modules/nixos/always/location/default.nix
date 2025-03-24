{...}: {
  time.timeZone = "Europe/Amsterdam";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {LC_TIME = "nl_NL.UTF-8";};
  };
}
