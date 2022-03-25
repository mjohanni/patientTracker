
bool ipValid(String ip) {
  var parts = ip.split('.');
  if (parts.length == 4) {
    for (var elem in parts) {
      try {
        int part = int.parse(elem);
        if (part > 255 || part < 0) {
          return false;
        }
      } catch (e) {
        return false;
      }
    }
    print("--------------------------ip works");
    return true;
  }
  return false;
}

bool portValid(String port){
  try{
    int portNumber = int.parse(port);
    if (portNumber < 1000 || portNumber > 9999){
      return false;
    }
    print("-----------------------port works!");
    return true;
  }catch(e){
    return false;
  }
}
