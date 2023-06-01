extension ServerCodeExtension on int {
  bool get success {
    if (this >= 200 && this <300){
      return true;
    }
    return false;
  }
}