class Timer {

  //variables needed to establish difference in time
  float OldTime;


  Timer () {
    //declare starting values of variables
    OldTime = 0;
  }


  void time () {
    if (millis()-OldTime > 1000) {
      OldTime = millis();
      index++;
    }
  }
}
