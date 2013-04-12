class LowPass {
  ArrayList buffer;
  int len;
  float output;
  
  LowPass(int len) {
    this.len = len;
    buffer = new ArrayList(len);
  }
  
  void input(float v) {
    buffer.add(new Float(v));
    if(len == 0) {
      buffer.remove(0);
    } else {
      len--;
    }
    
    float sum = 0;
    for(int i=0; i<buffer.size(); i++) {
      Float fv = (Float)buffer.get(i);
      sum += fv.floatValue();
    }
    output = sum / buffer.size();
  }
}
