class Timer {

  float currentTime = 0;
  float OldTime = 0;


  Timer () {
    currentTime = millis();
    OldTime = 0;
  }


  float time () {
  return currentTime - OldTime;
  
  
  }
}
}

