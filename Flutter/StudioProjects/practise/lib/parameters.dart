void main() {
  abc(9, 'Do', 11);
  abc("Virat", "Kohli", 18);

  sum(2, 3);
  sum('Kis', 'han');
  //sum(2,'3');  // type error

  sum1(5, 5, 5);
  //sum1(5);    // error

  sum2(5, b: 10, c: 5);
  //sum2(5,10,5);  // error

  //named params
  sum3(1, b: 2, c: 4);
  name(101, s: "Hello");

  //optional params
  sum4(1, 2, 3);

  //named params
  print("anonymous1 : ${anonymous1(18, y: 18, z: 18)}");
  print("anonymous3 : ${anonymous3(10, y: 10, z: 10)}");

  //error
  //print("anonymous2 : ${anonymous2(18, z: 18)}");
  print("anonymous1 : ${anonymous1(8, z: 8)}");
  print("anonymous3 : ${anonymous3(123, z: 123)}");

  print("anonyOptional : ${anonyOptional(100 , 100)}");
  print("anonyOptional_2 : ${anonyOptional(100 ,100 , 100)}");

  varIntNamed(1, y: 2, z: 3);
  varIntOptional(4, 5, 6);

  //named params
  details(20, name: 1, email: 'abc@gmail.com');
  details_2(15, name: 'hello', number: 1234567890);

}


//----------------------------------------------------------------------------

void abc(x, var y, var z) {
  print("X : $x , Y : $y , Z : $z");
}

void sum(a, b) {
  print("Sum = ${a + b}");
}

void sum1(int a, var b, c) {
  print("Sum1 = ${a + b + c}");
}

void sum2(a, {b, c}) {
  print("Sum2 = ${a + b + c}");
}

// ---------------------------------------------------------------------------------
//error
// void named(int a, {int b, int c}) {
//   print("named = ${a + b + c}");
// }

//error
// void positional(int a, [int b, int c]) {
//   print("positional = ${a + b + c}");
// }

// b & c can't have a value of 'null' because of its type 'int', but the implicit default value is 'null'.
// So if we specify the type of variable in named/positional params
// Then we need to write ?(null check op.) compulsory
// And if we write ? after any variable then, we need to also write !(bang operator) where we use it.

// NOTE : above rule is not for var data type (bcz , it gives error)

void sum3(int a, {int? b, int? c}) {
  print("Sum3 = ${a + b! + c!}");
}

// but, in optional params if we write default value of variavle then, no need to write compulsory (?) & (!).
void sum4(int a, [int b = 0, int? c]) {
  print("Sum4 = ${a + b + c!}");
}

void sum5(int a, [int b = 0, int? c]) {
  print("Sum4 = ${a + b + c!}");
}
//---------------------------------------------------------------------------------
int anonymous1(int x, {int? y = 0, required int z}) => x + y! + z;
// OR int? anonymous1(int x, {int? y = 0, required int z}) => x + y! + z;

int anonymous2(int x, {int? y, required int z}) => x + y! + z;
// OR int? anonymous2(int x, {int? y, required int z}) => x + y! + z;

int anonymous3(int x, {int y = 0, required int z}) => x + y + z;

void varIntNamed(int x, {var y,  int? z}){
  print("Var + Int (named) =  ${x + y + z!}");
}

// but , if we specify return type then, it gives error
// int? anonymous4(int x, {var? y,  int? z}) => x + y! + z!;

//---------------------------------------------------------------------------------

// In optional params (give default val otherwise write (? and !} operator)
int anonyOptional(int x, [int? y, int z = 0]) => x + y! + z;

void varIntOptional(int x, [var y,  int? z]){
  print("Var + Int (optional) =  ${x + y + z!}");
}

// but it is not possible , it gives error
// int anonyOptional_2(int x, [int y = 0, int? z]) => x + y + z!;
// print("anonyOptional_2 : ${anonyOptional_2(100 ,   , 100)}");

// optional params can't be required
//error
// int anonyOptional(int x, [int y = 0,required int? z]) => x + y + z!;

//---------------------------------------------------------------------------------


void name(int a, {String? s}) {
  print("RollNo : $a , Name : $s");
}

// but, in named params if we write required keyword then, no need to write compulsory (?) & (!).
void details(age, {required name, required email}) {
  print("Age : $age , Name : $name , Email : $email");
}
// OR
void details_2(age, {required String name, required int number}) {
  print("Age : $age , Name : $name , Email : $number");
}

// error
// named params must be last argu
// void details_3({required name, required email}, age){
//   print("Age : $age , Name : $name , Email : $email");
// }

//error
// optional params must be last argu
// void login([String? name, String? email], number){
//   print("Name : $name , Email : $email");
// }

//error
// optional params can't be required  (bcz, it is optional params)
// void login([required String? name, required String? email]){
//   print("Name : $name , Email : $email");
// }
// OR
// void login([required name, required  email]){
//   print("Name : $name , Email : $email");
// }

//error
// both can't use in one method
// void namedOptional([int? y],{int? x}){
//   print("$x , $y")
// }
