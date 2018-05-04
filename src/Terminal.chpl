/*
 * Copyright 2018 Altar's Authors.
 * Other additional copyright holders may be indicated within.
 *
 * The entirety of this work is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 *
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: Marcos Cleison Silva Santana
 * Github: @marcoscleison
 */
module Terminal{
const Black= "\x1b"+"[0;30m";
const Red= "\x1b"+"[0;31m";
const Green= "\x1b"+"[0;32m";
const Yellow= "\x1b"+"[0;33m";
const Blue= "\x1b"+"[0;34m";
const Purple= "\x1b"+"[0;35m";
const Cyan= "\x1b"+"[0;36m";
const White= "\x1b"+"[0;37m";
const BBlack= "\x1b"+"[1;30m";
const BRed= "\x1b"+"[1;31m";
const BGreen= "\x1b"+"[1;32m";
const BYellow= "\x1b"+"[1;33m";
const BBlue= "\x1b"+"[1;34m";
const BPurple= "\x1b"+"[1;35m";
const BCyan= "\x1b"+"[1;36m";
const BWhite= "\x1b"+"[1;37m";

const UBlack= "\x1b"+"[4;30m";
const URed= "\x1b"+"[4;31m";
const UGreen= "\x1b"+"[4;32m";
const UYellow= "\x1b"+"[4;33m";
const UBlue= "\x1b"+"[4;34m";
const UPurple= "\x1b"+"[4;35m";
const UCyan= "\x1b"+"[4;36m";
const UWhite= "\x1b"+"[4;37m";

const BkBlack= "\x1b"+"[40m";
const BkRed= "\x1b"+"[41m";
const BkGreen= "\x1b"+"[42m";
const BkYellow= "\x1b"+"[43m";
const BkBlue= "\x1b"+"[44m";
const BkPurple= "\x1b"+"[45m";
const BkCyan= "\x1b"+"[46m";
const BkWhite= "\x1b"+"[47m";
const HIBlack= "\x1b"+"[0;90m";
const HIRed= "\x1b"+"[0;91m";
const HIGreen= "\x1b"+"[0;92m";
const HIYellow= "\x1b"+"[0;93m";
const HIBlue= "\x1b"+"[0;94m";
const HIPurple= "\x1b"+"[0;95m";
const HICyan= "\x1b"+"[0;96m";
const HIWhite= "\x1b"+"[0;97m";
const BHIBlack= "\x1b"+"[1;90m";
const BHIRed= "\x1b"+"[1;91m";
const BHIGreen= "\x1b"+"[1;92m";
const BHIYellow= "\x1b"+"[1;93m";
const BHIBlue= "\x1b"+"[1;94m";
const BHIPurple= "\x1b"+"[1;95m";
const BHICyan= "\x1b"+"[1;96m";
const BHIWhite= "\x1b"+"[1;97m";
const BkHIBlack= "\x1b"+"[0;100m";
const BkHIRed= "\x1b"+"[0;101m";
const BkHIGreen= "\x1b"+"[0;102m";
const BkHIYellow= "\x1b"+"[0;103m";
const BkHIBlue= "\x1b"+"[0;104m";
const BkHIPurple= "\x1b"+"[0;105m";
const BkHICyan= "\x1b"+"[0;106m";
const BkHIWhite= "\x1b"+"[0;107m";
const Reset= "\x1b"+"[0m";


class Terminal{
    proc init(){

    }
    proc cursorUp(n:int=1){
        write("\x1b"+"[",n,"A");
    }
    proc cursorDown(n:int=1){
        write("\x1b"+"[",n,"B");
    }
    
    proc cursorForward(n:int=1){
        write("\x1b"+"[",n,"C");
    }
    proc cursorBackward(n:int=1){
        write("\x1b"+"[",n,"D");
    }
    proc cursorNextLine(n:int=1){
        write("\x1b"+"[",n,"E");
    }
    proc cursorPreviousLine(n:int=1){
        write("\x1b"+"[",n,"F");
    }
    proc cursorHorizontalAbsolute(n:int=1){
        write("\x1b"+"[",n,"G");
    }
    proc cursorGoto(row:int,column:int){
        write("\x1b"+"[",row,";",column,"H");
    }
    proc eraseDisplay(n:int=0){
       write("\x1b"+"[",n,"J");
    }
    proc eraseLine(n:int=2){
        write("\x1b"+"[",n,"K");
    }
    proc scrollUp(n:int=1){
        write("\x1b"+"[",n,"S");
    }
    proc scrollDown(n:int=1){
        write("\x1b"+"[",n,"T");
    }
    proc saveCursorPosition(){
        write("\x1b"+"[","s");
    }
    proc restoreCursorPosition(){
        write("\x1b"+"[","u");
    }

    proc ErrorLn(args ...?n){
         for i in 1..n {
            write(BRed,args[i]);
         }
         writeln(Reset);
    }

    proc progressBar(size:int, value:real, color:string=BRed, block:string="*"){
        this.eraseLine(2);
        var i=0;
        var str:string;
        var sz:int = (value*size/100):int;

        while(i<sz){
            str+=block;
            i+=1;
        }
        write(color,str);

    }


}



}