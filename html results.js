// generates an temporary html page and opens it for viewing
// similar to how BOSS does its reports
spacing();
divider();
console.log("This program and the file must be in the same directory.");

ask("Enter the filename (type quit to quit)", /.+/, function(filename) {
  // quit if they typed quit
  if (filename === "quit") {
    console.log("Goodbye.");
    quit();
  }

  // otherwise try opening the file
  else {
		fs = require("fs");

		// check if the  file exists
		fs.exists(filename, function(exists) {

			// if the file exists
		  if (exists) {
		  	readFile(filename);
		  }

			// if the file does not exist
		  else {
		  	console.log("That file does not exist.");
		  	quit();
		  }

		});
  }

}); // end ask


// reads the file
function readFile(filename) {
	fs.stat(filename, function(error, stats) {
		fs.open(filename, "r", function(error, fd) {
			var buffer = new Buffer(stats.size);

			fs.read(fd, buffer, 0, buffer.length, null, function(error, bytesRead, buffer) {
				// grab the data
				var data = buffer.toString("utf8", 0, buffer.length);

				// close fs
				fs.close(fd);

				// check if our appdata folder exists
				// todo: don't hardcode the appdata folder
				var appdataFolder = "C:\\Users\\Lord Kai\\AppData\\Roaming\\.ourappdatafolder\\";
				fs.stat(appdataFolder, function(error, stats) {

				// create the folder then move on
					if(error) {
						fs.mkdir(appdataFolder,function(error) {
							if(!error || (error && error.code === 'EEXIST')){
								createHTML(data, appdataFolder);
							} 

							else {
								console.log(error);
								quit();
							}
						});
					}

					// don't do anything, just move on
					else {
						createHTML(data, appdataFolder);
					}
				}); // end appdata folder check
			}); // end read
		}); // end open
	}); // end stat
}


// creates HTML from our file and outputs it into a temporary HTML file
function createHTML(data, appdataFolder) {
	// find out what we should do with something (just an example)
	ask("Enter something we can use", /.+/, function(something) {
		var html = "<html><head><title>Title</title></head><body><h1>Click the link!</h1>";

		// more html goes here
		// parse the data

		html += "</body></html>";

		// write the file
	  var tempFile = "temp.html";
		fs.writeFile(appdataFolder + tempFile, html, function(error) {
	    if(error) {
	        console.log(error);
	        quit();
	    } 

	    // wrote successfully
	    else {
	      launchInChrome(appdataFolder + tempFile);
			}
		});
	});
}


// launch the HTML file we created in Chrome
function launchInChrome(tempLocation) {
	var chromeLocation = "\"C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe\"";

	var exec = require('child_process').exec;
	var child = exec(chromeLocation + " \"" + tempLocation + "\"", function(error, stdout, stderr) {
		if (error != null) {
			console.log(stderr);
			quit();
		}

		// at this point we're done
		quit();

	}); // end child
}

// outputs some space and exits
function quit() {
	  divider();
	  spacing();
	  process.exit();
}

function divider() {
	console.log("------------------------------------");
}

function spacing() {
	console.log("\n\n");
}

// gets input from a user
function ask(question, format, callback) {
 var stdin = process.stdin, stdout = process.stdout;

 stdin.resume();
 stdout.write(question + ": ");

 stdin.once('data', function(data) {
   data = data.toString().trim();

   if (format.test(data)) {
     callback(data);
   } else {
     stdout.write("It should match: "+ format +"\n");
     ask(question, format, callback);
   }
 });
}