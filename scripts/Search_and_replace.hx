
class Search_and_replace {

	static function main() {

		// check if FileSystem is available
		#if sys
		trace("file system can be accessed");
		#end
		// else it traces "You cannot access the sys package while targeting js (for sys.FileSystem)".


		if (Sys.args().length == 0) {
			trace('you forgot to add a file-path argument!');
			return;
		}

		// get file-path argument and create a proper file-path string
		var file_path:String = Sys.args()[0]; // just gets the first argument
		var path = new haxe.io.Path(file_path); // not sure if needed

		if (path.dir == null) {
			var programPath = new haxe.io.Path(Sys.programPath());
			path.dir = programPath.dir; 
		}

		file_path = path.toString();

		// read
		var fc:String = sys.io.File.getContent(file_path);
		trace(fc);

		// do stuff

		// if only file argument, just save it
		if (Sys.args().length == 1) {
			// TODO: test if this turns it into unicode
			sys.io.File.saveContent(file_path, fc);
			return;
		}

		var search:String = Sys.args()[1];
		var replace:String = Sys.args()[2];

		//StringTools.contains(fc, search);
		StringTools.replace(fc, search, replace);

		// write
		sys.io.File.saveContent(file_path, fc);
	}
}

/*
Save file to disk
This example writes an object person to a json file:

var user = {name:"Mark", age:31};
var content:String = haxe.Json.stringify(user);
sys.io.File.saveContent('my_folder/my_file.json',content);
Api documentation: https://api.haxe.org/sys/io/File.html
Cross platform paths

Dealing with paths, directories, slashes, extensions on multiple platforms or OSes can be slightly awkward. Haxe provides the haxe.io.Path class which supports the common path formats.

Extracting info from a path:

var location = "path/to/file.txt";
var path = new haxe.io.Path(location);
trace(path.dir); // path/to
trace(path.file); // file
trace(path.ext); // txt
Combining info into a new path:

var directory = "path/to/";
var file = "./file.txt";
trace(haxe.io.Path.join([directory, file])); // path/to/file.txt
Api documentation: https://api.haxe.org/haxe/io/Path.html
Recursive loop through all directories / files

function recursiveLoop(directory:String = "path/to/") {
	if (sys.FileSystem.exists(directory)) {
		    trace("directory found: " + directory);
			for (file in sys.FileSystem.readDirectory(directory)) {
				      var path = haxe.io.Path.join([directory, file]);
					  if (!sys.FileSystem.isDirectory(path)) {
						          trace("file found: " + path);
								          // do something with file
								        
					  } else {
						          var directory = haxe.io.Path.addTrailingSlash(path);
								          trace("directory found: " + directory);
										          recursiveLoop(directory);
												        
					  }
					      
			}
			  
	} else {
		    trace('"$directory" does not exists');
			  
	}
	
}
Api documentation: https://api.haxe.org/sys/FileSystem.html
Checking file attributes

var stat:sys.FileStat = sys.FileSystem.stat("myFile.txt");
trace("Last access time: " + stat.atime);
trace("Last modification time: " + stat.mtime);
trace("Last status change time: " + stat.ctime);
trace("The user id: " + stat.uid);
trace("File size: " + stat.size);
*/
