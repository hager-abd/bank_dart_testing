import 'dart:io';

import 'bank.dart';

class bank_system{
  List<bank> users =[];
  int id=0;
  void mainmenu(){
    print('1-view users');
    print('2-Add user');
    print('3-Delete user');
    print('4-Update user');
    print('5-Withdraw_money');
    print('6-Deposit_money');
    print('7-indebtedness_money');
    print('8-exit');
    stdout.write('choose (1:8 )');
    String? choice=stdin.readLineSync();

    switch(choice){
      case '1' :viewUsers();
      case '2' :addUser();
      case '3' :deleteUser();
      case '4' :updateUser();
      case '5' :Withdraw_money();
      case '6' :Deposit_money();
      case '7' :indebtedness_money();
      case '8' :print('exit');
      default:print('invalied choice');
    }

  }
  void addUser(){
    stdout.write('enter your First name ');
    String?fname =stdin.readLineSync();
    stdout.write('enter your Last name ');
    String?lname =stdin.readLineSync();
    stdout.write('enter your address ');
    String?address =stdin.readLineSync();
    stdout.write('enter your age ');
    int?age =int.parse(stdin.readLineSync()!);
    stdout.write('enter your national_id ');
    int?national_id =int.parse(stdin.readLineSync()!);
    stdout.write('enter your phone ');
    int?phone =int.parse(stdin.readLineSync()!);
    stdout.write('enter your num_of_account ');
    int?num_of_account =int.parse(stdin.readLineSync()!);
    stdout.write('enter your money ');
    int?money =int.parse(stdin.readLineSync()!);
    if(fname==null||fname.isEmpty||lname==null||lname.isEmpty||address==null||address.isEmpty)
    {
      print('error ,try again please');
      addUser();
    }else{
      bank data=bank(++id,fname:fname,lname:lname,age:age,national_id:national_id,phone:phone,address:address,num_of_account:num_of_account,money:money);
      users.add(data);

      mainmenu();}
  }
  void viewUsers(){
    for(int i=0;i<users.length;i++){
      bank show=users[i];
      print('id:${show.id}:,First name:${show.fname},Last name:${show.lname},address:${show.address},Age:${show.age},National_id:${show.national_id},phone:${show.phone},num_of_account:${show.num_of_account},money:${show.money}');
    }
    mainmenu();

  }

  void deleteUser(){
    stdout.write('Enter iD ');
    String? x=stdin.readLineSync();
    int? id=int.tryParse(x??" ");
    if(id==null||!users.any((element)=>element.id==id)){
      print('error ,try again please');
      deleteUser();
    }else{
     users.removeWhere((task)=>task.id==id);
     print('user deleted with id $id');
      mainmenu();
    }

  }
  void updateUser(){
    stdout.write('Enter iD ');
    String? x=stdin.readLineSync();
    int? id=int.tryParse(x??" ");
    if(id==null||!users.any((element)=>element.id==id)){
      print('error ,try again please');
      updateUser();
    }else{ stdout.write('enter your First name ');
    String?fname =stdin.readLineSync();
    stdout.write('enter your Last name ');
    String?lname =stdin.readLineSync();
    stdout.write('enter your address ');
    String?address =stdin.readLineSync();
    stdout.write('enter your age ');
    int?age =int.parse(stdin.readLineSync()!);
    stdout.write('enter your national_id ');
    int?national_id =int.parse(stdin.readLineSync()!);
    stdout.write('enter your phone ');
    int?phone =int.parse(stdin.readLineSync()!);
    stdout.write('enter your num_of_account ');
    int?num_of_account =int.parse(stdin.readLineSync()!);
    stdout.write('enter your money ');
    int?money =int.parse(stdin.readLineSync()!);
    if(fname==null||fname.isEmpty||lname==null||lname.isEmpty||address==null||address.isEmpty) {
      print('error ,try again please');
      addUser();
    }else{
      bank newdata=users.firstWhere((task)=>task.id==id);
      newdata.fname=fname;
      newdata.lname=lname;
      newdata.age=age;
      newdata.national_id=national_id;
      newdata.phone=phone;
      newdata.address=address;
      newdata.num_of_account=num_of_account;
      newdata.money=money;
      mainmenu();
    }

    }
  }
  void Withdraw_money(){
    stdout.write('Enter numuber of account user ');
    int? num_of_account =int.tryParse(stdin.readLineSync()!);
    if(num_of_account==null||!users.any((element)=>element.num_of_account==num_of_account)){
      print('error ,try again please');
      Withdraw_money();
    }else{
    stdout.write('enter your Withdraw_money ');
    int?money =int.parse(stdin.readLineSync()!);
    if(money==null||money=="" || money>users.firstWhere((task)=>task.num_of_account==num_of_account).money){
      print('error money ,try again please,you have ${users.firstWhere((task)=>task.num_of_account==num_of_account).money}');
      Withdraw_money();
    } else{
      bank newdata=users.firstWhere((task)=>task.num_of_account==num_of_account);
      newdata.money-=money;
      print('Successful Withdraw_money $money');
      mainmenu();
    }

    }
  }


  void Deposit_money(){
    stdout.write('Enter numuber of account user ');
    int? num_of_account =int.tryParse(stdin.readLineSync()!);
    if(num_of_account==null||!users.any((element)=>element.num_of_account==num_of_account)){
      print('error ,try again please');
      Deposit_money();
    }else{
      stdout.write('enter your Deposit_money ');
      int?money =int.parse(stdin.readLineSync()!);
      if(money==null||money==""){
        print('error ,try again please');
        Deposit_money();
      } else{
        bank newdata=users.firstWhere((task)=>task.num_of_account==num_of_account);
        newdata.money+=money;
        print('Successful Deposit_money $money');
        mainmenu();
      }
    }}
    void indebtedness_money(){
      stdout.write('Enter numuber of account user ');
      int? num_of_account =int.tryParse(stdin.readLineSync()!);
      if(num_of_account==null||!users.any((element)=>element.num_of_account==num_of_account)){
        print('error ,try again please');
        indebtedness_money();
      }else{
        stdout.write('enter your indebtedness_money ');
        int?money =int.parse(stdin.readLineSync()!);
        if(money==null||money==""){
          print('error money ,try again please,you indebted ${users.firstWhere((task)=>task.num_of_account==num_of_account).money}');
          indebtedness_money();
        } else{
          bank newdata=users.firstWhere((task)=>task.num_of_account==num_of_account);
          newdata.money-=money;
          print('Successful indebtedness_money $money');
          mainmenu();
        }

      }
    }
  }