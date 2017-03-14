

interface Body{
  float radius();
  void show();
  void showSpeed();
  String toString();
  void update();
  void applyForce(PVector f);
  PVector pos();
  float mass();
}