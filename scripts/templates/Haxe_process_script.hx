// https://stackoverflow.com/questions/35547117/haxe-run-system-commands-as-an-adminstrator#36451192

// TODO: untested, just copied from above source
class Process_Template {
public static function Process_Template() {

	// can uses Sys.command for running commands, like a batch script
	// outputs stdout to the current process
	Sys.command("ls", "-a");

	// can use sys.io.Process for more advanced stuff
    if(Sys.systemName()=="Windows"){
		// can store stdout
        var output = new sys.io.Process("ipconfig", []).stdout.readAll().toString();
        trace("output:::"+output);
    }

    if(Sys.systemName()=="Linux"){
        var output = new sys.io.Process("ifconfig", []).stdout.readAll().toString();
        trace("output:::"+output);
    }

    // an entire bash command / script in the arguments parameter!
    var output = new sys.io.Process("bash", ["-c 'echo rootS_PASswoRd | sudo -S ifconfig'"]).stdout.readAll().toString();
        trace("output:::"+output);

 }
}
