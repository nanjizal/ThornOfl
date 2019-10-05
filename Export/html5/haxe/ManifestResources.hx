package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":"swf-library","assets":"aoy4:pathy26:lib%2Fswf-library%2F20.pngy4:sizei1825428y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y26:lib%2Fswf-library%2F23.pngR2i32995R3R4R5R7R6tgoR0y26:lib%2Fswf-library%2F26.pngR2i9794R3R4R5R8R6tgoR0y26:lib%2Fswf-library%2F28.pngR2i11022R3R4R5R9R6tgoR0y26:lib%2Fswf-library%2F30.pngR2i35155R3R4R5R10R6tgoR0y35:lib%2Fswf-library%2Fswf-library.binR2i57647R3y4:TEXTR5R11R6tgh","rootPath":null,"version":2,"libraryArgs":["lib/swf-library/swf-library.bin"],"libraryType":"openfl._internal.formats.swf.SWFLiteLibrary"}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("swf-library", library);
		data = '{"name":null,"assets":"ah","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("swf-library");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("swf-library");
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_23_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_26_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_28_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_30_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_swf_library_bin extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("/projects/May2019/October2019/ThornOfl/Export/html5/obj/libraries/swf-library/20.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_20_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/ThornOfl/Export/html5/obj/libraries/swf-library/23.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_23_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/ThornOfl/Export/html5/obj/libraries/swf-library/26.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_26_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/ThornOfl/Export/html5/obj/libraries/swf-library/28.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_28_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/ThornOfl/Export/html5/obj/libraries/swf-library/30.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_30_png extends lime.graphics.Image {}
@:keep @:file("/projects/May2019/October2019/ThornOfl/Export/html5/obj/libraries/swf-library/swf-library.bin") @:noCompletion #if display private #end class __ASSET__lib_swf_library_swf_library_bin extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__lib_swf_library_json extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end
