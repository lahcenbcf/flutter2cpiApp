import 'dart:math';


String generateTag() {
  //
  //
  const int length = 10;
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
 
  //
  //
  
  return String.fromCharCodes(
     Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
    
  

}


