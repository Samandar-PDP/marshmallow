import '../../data/model/love_random.dart';

abstract class LoveRepository {
  Future<LoveRandom> getRandom(String boyName, String girlName);
}

// duck, cat, bird
// INTERFACE SEGREGATION
abstract class Fly {
  void fly();
}

abstract class Walk {
  void walk();
}

abstract class Swim {
  void swim();
}

 class Duck implements Fly, Swim, Walk {
  @override
  void fly() {
    // TODO: implement fly
  }

  @override
  void swim() {
    // TODO: implement swim
  }

  @override
  void walk() {
    // TODO: implement walk
  }
}

class Cat extends Walk {

  @override
  void walk() {
    // TODO: implement walk
  }
}

class Bird extends Fly {

  @override
  void fly() {
    // TODO: implement fly
  }
}