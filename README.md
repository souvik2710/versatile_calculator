## Author
Souvik Versatile
[Link to Profiles](https://www.linkedin.com/in/souvik2710/){:target="\_blank"}

## Versatile Calculator

 A simple calculator with some unique attributes that stores history of the previous calculations in a scrollview.
 It can able to handle exception cases


## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  versatile_calculator: ^0.0.2
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:versatile_calculator/versatile_calculator.dart';
```

## Example


[comment]: <> (<hr>)

<table>
<tr>
<td>

```dart
class DemoCalculatorScreen extends StatelessWidget {
  const DemoCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red[800]!,
            side: BorderSide(
              width: 1.0,
              color: Colors.red[800]!,
            ),
            onPrimary: Colors.white,
            elevation: 5,
          ),
          onPressed: (){
            showDialog(
                    barrierColor: Colors.white.withOpacity(0.2),
                    barrierDismissible: true,
                    context: context,
                    builder: (ctx) {
                      return VersatileCalculator();
                    });
          },

          child: Text('Check Calculator'),
        ),
      ),
    );
  }
}
```

</td>
<td>
<img  src="https://raw.githubusercontent.com/souvik2710/versatile_calculator/master/lib/pics/cal_example.png"  alt="">
</td>
</tr>
</table>

## Next Goals

- [ ] Make more ui and buttons more robust.
  Now all the buttons and functionalities are constant.In the future need to make it more customisable. 

- [x] Handle all exceptions
  Handling of exceptions complete

- [ ] Add the calculator only as a side container or as a part of another widget.