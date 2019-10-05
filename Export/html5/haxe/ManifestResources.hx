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

		data = '{"name":"swf-library","assets":"aoy4:pathy35:lib%2Fswf-library%2Fswf-library.biny4:sizei20874y4:typey4:TEXTy2:idR1y7:preloadtgh","rootPath":null,"version":2,"libraryArgs":["lib/swf-library/swf-library.bin"],"libraryType":"openfl._internal.formats.swf.SWFLiteLibrary"}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_swf_library_bin extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("/projects/May2019/October2019/SimpleSWFLayout/Export/html5/obj/libraries/swf-library/swf-library.bin") @:noCompletion #if display private #end class __ASSET__lib_swf_library_swf_library_bin extends haxe.io.Bytes {}
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
