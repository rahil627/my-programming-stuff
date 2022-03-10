
// TODO: sys package autocompletes correctoly, but is not showing documentation for functions :(



class Search_and_replace {

	static function main() {

		var file_path:String = Sys.args()[0]; // just gets the first argument

		// check if FileSystem is available
		#if sys
		trace("file system can be accessed");
		#end
		// otherwise you will get the error: "You cannot access the sys package while targeting js (for sys.FileSystem)".
	
		// read content of a file
		var content:String = sys.io.File.getContent(file_path);
		trace(content);
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
