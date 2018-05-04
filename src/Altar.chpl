module Altar{
    use Terminal;
    use CommandEngine;


var altar_logo:string='''        _ _             
      | | |            
  __ _| | |_ __ _ _ __ 
 / _` | | __/ _` | '__|
| (_| | | || (_| | |   
 \__,_|_|\__\__,_|_|   
                    
''';


proc write_logo(){
    writeln(BRed,altar_logo,Reset);
}

    
}