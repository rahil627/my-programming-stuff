enum Mode { // make sure this goes outside the class??
	Fast;
	Slow;
}

// class name must start with a capital letter and match the file-name, '-' is not allowed
class CLI_App_Template {

	static function main() { // why static?
		// begin
		var app = new CLI_App_Template(); // required to run a non-static function
		var options = app.parse_options();
		Sys.println("options: " + options);
		Sys.exit(1);
	}

	public function new() {
		// TODO: required to create an instance of a class?
	}

    function parse_options() {
		// var flags = new EnumFlags();
		var mode = Mode.Fast;
		var flag = false;
		var strings:List<String> = new List();

		var args = Sys.args();

		while( args.length > 0 )
		{
			var arg = args.shift(); // same as array.pop?
			switch ( arg ) {
				case "-fast":
					mode = Fast;
				case "-slow":
					mode = Mode.Slow;
				case "-flag":
					flag = true;
				case "-add":
					strings.add(args.shift());
				case "-help":
					Sys.println("Usage: haxe CLI_App_Template.hx [options]");
					Sys.println("options:");
					Sys.println("    -fast              go fast!");
					Sys.println("    -slow              go slow!");
					Sys.println("    -flag              change something");
					Sys.println("    -add string        input a string");
				// case "-main": // ignore haxe flags?
				// TODO: see haxe.macro.Context.getDefines()
				case _:
					Sys.println('unknown arg: "$arg"');
			}
		}

		return {a:mode, b:flag, c:strings}; // anonymous structure requires names for its fields..??
	}


}
