String capitalize(String s) {
  return s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
}
