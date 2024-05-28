import 'dart:convert';

decodePayload(jwt) {
  var jwtSplit = jwt!.split(".");
  return json
      .decode(ascii.decode(base64.decode(base64.normalize(jwtSplit[1]))));
}
