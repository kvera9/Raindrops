class Timer {

  //variables needed to establish difference in time
  float OldTime;


  Timer () {
    //declare starting values of variables
    OldTime = 0;
  }


  float time () {
    //needed so that the timer doens't just recognize the if statement once
  return millis() - OldTime;
  
  }
}


