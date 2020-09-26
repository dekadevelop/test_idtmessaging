String clearTrailingComma(String json) {
  if (json == null) {
    return json;
  }
  return json.replaceAll(',]', ']');
}
