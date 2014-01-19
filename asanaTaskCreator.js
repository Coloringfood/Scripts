// generates an Asana task with subtasks from a properly formatted
// md file (one h1, then any number of h2 with + bullets underneath)
// headers must use # syntax, not ----
// it requires asana.js from rushis on GitHub

// global variables
var asana = require('./asana.js');
asana.setApiKey(/*api key here */);
var subtasks;


// begin output
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

  	// default file
  	if (filename  === ".") filename = "New Computer Installation.md";

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

				// parse the data into lines
				data = data.split("\r\n");

				// we'll store the sub tasks here
				subtasks = [];

				// loop across the lines (ignore the first line which is the file header)
				for(var i = 1; i < data.length; i++) {
					// ignore any blank lines
					if(data[i].length !== 0) {

						// turn h2s into headers for asana
						if(data[i][0] == "#") {
							var subtask = data[i].replace(/#/g, "").trim();
							subtask += ":";
						}

						// everything else should be a bullet (+, *, etc)
						else {
							subtask = data[i].substring(1).trim();
						}

						subtasks.push(subtask);
					}
				}

				// TODO: implement this myself, without this file
				// without request
				// and without utile
				// ... maybe
				// and with oauth

				// create asana task
				// ask for a task name
				ask("Enter the task name", /.+/, function(taskname) {
					
					// create the task
					var data = {
						workspace: /*workspace id */,
						name: taskname,
						assignee: /*assignee id */
					};

					asana.createTask(data, function(error, task) {

						// apparently you can't specify the project when creating the task, so add it here
						asana.addProject(task.data.id, {project: /*project id */}, function(error, empty) {

							// now we need to add all the subtasks
							// these must be in order, so they will call each other as they finish
							// also they must be added backwards since that's how asana adds them
							console.log("Adding subtasks (this could take a while)");
							addSubTask(task.data.id, subtasks.length - 1, subtasks);
						});
					});
				});

			}); // end read
		}); // end open
	}); // end stat
}

function addSubTask(task_id, current) {
	asana.addSubTask(task_id, {name: subtasks[current]}, function(error, response) {
		if(current === 0) {
			console.log("Finished");
		}
		else {
			current = current - 1;
			addSubTask(task_id, current);
		}
	});
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