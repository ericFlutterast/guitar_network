class Tuner {
  final Map<String, double> _tune;

  Tuner.standartE()
      : _tune = {
          'E4': 329.63,
          'B': 246.96,
          'G': 196.00,
          'D': 147.83,
          'A': 110.00,
          'E2': 82.41,
        };

  Tuner.dropD()
      : _tune = {
          'E4': 329.63,
          'B': 246.96,
          'G': 196.00,
          'D': 147.83,
          'A': 110.00,
          'D2': 73.91,
        };

  Tuner.standartD()
      : _tune = {
          'D4': 293.66,
          'A': 220.00,
          'F': 174.62,
          'C': 130.82,
          'G': 98.00,
          'D2': 73.91,
        };

  Tuner.dropC()
      : _tune = {
          'D4': 293.66,
          'A': 220.00,
          'F': 174.62,
          'C': 130.82,
          'G': 98.00,
          'C2': 62.41,
        };

  Map<String, double> get getTune => _tune;

  List<dynamic> noteDefinitions(double pitch, double targetTone) {
    if (pitch < targetTone + 1 && pitch > targetTone - 1) {
      return ['', true];
    } else if (pitch > targetTone) {
      return ['-', false];
    } else if (pitch < targetTone) {
      return ['+', false];
    }

    return ['', false];
  }
}
