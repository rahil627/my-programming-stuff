
class File_io_script_template {

	static function main() {

		// check if FileSystem is available
		#if sys
		trace("file system can be accessed");
		#end
		// else it traces "You cannot access the sys package while targeting js (for sys.FileSystem)".


		var file_path:String = Sys.args()[0]; // just gets the first argument

		// read
		var c:String = sys.io.File.getContent(file_path);
		trace(c);

		// do stuff


		// write
		sys.io.File.saveContent('file-path',c);
	}
}
