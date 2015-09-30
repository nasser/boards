/*
 * simple sexy full screen prompts
 * 
 * ramsey nasser, sep 2015
 */

function fullScreenPrompt (placeholder, type, cb) {
  var input = document.createElement("input");
  input.setAttribute("type", type);
  input.setAttribute("placeholder", placeholder);
  input.setAttribute("class", "fullscreen");
  input.setAttribute("style", "position: fixed;\
                               top: 0;\
                               left: 0;\
                               z-index: 100;\
                               width: 100%;\
                               height: 100%;\
                               text-align: center;\
                               border: 0;\
                               opacity: 0.9;\
                               font-size: 15vw;");
  
  input.onkeydown = function(event) {
    if (event.keyCode == 13) {
      document.body.removeChild(input);
      cb(input.value);
    }
  }
  
  document.body.appendChild(input);
  input.focus();
}

function textPrompt (placeholder, cb) {
  fullScreenPrompt(placeholder, "text", cb);
}

function passwordPrompt (placeholder, cb) {
  fullScreenPrompt(placeholder, "password", cb);
}