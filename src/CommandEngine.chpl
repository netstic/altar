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
module CommandEngine{

use Terminal;
use Spawn;

class CommandEngine{
    var commandsDom:domain(string);
    var commands:[commandsDom]CommandInterface;
    var term:Terminal;
    proc init(){
        this.term=new Terminal();
    }

    proc addCommand(name:string,cmd){
        if(!commandsDom.member(name)){
            commands[name]=new CommandInterface(cmd);
        }
    }
    proc Execute(args:[?D]){
    var cmd_name = args[D.first+1];
    var exargs = args[(D.first+1)..D.last];
    var argsv =  args[(D.first+2)..D.last];
        
        if(this.commandsDom.member(cmd_name)){
            var cmd = this.commands[cmd_name];
            cmd(argsv);
        }else{
            //
            try{
                exargs[exargs.domain.first]="altar-"+exargs[exargs.domain.first];
                var process = spawn(exargs);
                    process.close();
            }catch{
                term.ErrorLn("Command ",args[D.first+1]," not found");
            }
            
        }        
    }
}

class Command{
    var name:string;
    var help:string;
    proc init(name:string, help:string){
        this.name=name;
        this.help=help;
    }
    proc this(args:[?D]){

    }

}

class CommandInterface{
    forwarding var cmd:Command;
}

}