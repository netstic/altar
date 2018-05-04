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
module Main{
use Altar;
use Time;


    class CommandTest1:Command{
      proc  init(){
            super.init("test","Test command");
        }
         proc this(args:[?D]){
            writeln("Executing test command",args);
         }

    }

    class CommandTest2:Command{
      proc  init(){
            super.init("test","Test command");
        }
         proc this(args:[?D]){
            writeln("Executing test command2:",args);
         }

    }


    proc main(args: [] string) {
    
        write_logo();
        var commander = new CommandEngine();

        var cmd_test=new CommandTest1();
        var cmd_test2=new CommandTest2();

        commander.addCommand("test",cmd_test);
        commander.addCommand("test2",cmd_test2);
        
        commander.Execute(args);

    }

}