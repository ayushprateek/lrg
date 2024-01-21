bool isUnauthenticated(code) {
  return code == 401;
}

bool isSuccess(code) {
  return code >= 200 && code < 300;
}

bool isError(code) {
  return code >= 400;
}
