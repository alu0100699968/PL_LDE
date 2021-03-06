'use strict';
$(document).ready(function() {
  
  $('#PARSE2').click(function() {
    var result, source;
    source = INPUT.value;
    try {
      result = JSON.stringify(gramaticaHTMLformato.parse(source), null, 2);
      result = result.replace(/>/g, "&gt;");
      result = result.replace(/</g, "&lt;");
      result = result.replace("\"&", "&");
      result = result.replace("gt;\"", "gt;");
    } catch (_error) {
      result = _error;
      result = "<div class=\"error\">" + result + "</div>";
    }
    return OUTPUT.innerHTML = result;
  });
  
  $('#PARSE3').click(function() {
    var result, source;
    source = INPUT.value;
    try {
      result = JSON.stringify(gramaticaHTMLformato.parse(source), null, 2);
      result = result.replace("\"<", "<");
      result = result.replace(">\"", ">");
    } catch (_error) {
      result = _error;
      result = "<div class=\"error\">" + result + "</div>";
    }
    return OUTPUT.innerHTML = result;
  });
  
  $('#PARSEDOWN').click(function() {
   var result, source;
    source = INPUT.value;
    try {
      result = JSON.stringify(gramaticaHTMLformato.parse(source), null, 2);
      result = result.replace("\"<", "<");
      result = result.replace(">\"", ">");
      var filename = "Criticas.html";
      var text = result;
        var pom = document.createElement('a');
  pom.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
  pom.setAttribute('download', filename);

  pom.style.display = 'none';
  document.body.appendChild(pom);

  pom.click();

  document.body.removeChild(pom);
    } catch (_error) {
      result = _error;
      result = "<div class=\"error\">" + result + "</div>";
    }
    return OUTPUT.innerHTML = result;
  });
  var dropZone, fileSelect, handleDragOver, handleDrop, handleFileSelect;
  dropZone = document.getElementById('INPUT');
  handleDrop = function(evt) {
    var files, reader;
    evt.stopPropagation();
    evt.preventDefault();
    files = evt.dataTransfer.files;
    reader = new FileReader;
    reader.onload = function(event) {
      document.getElementById('INPUT').value = event.target.result;
    };
    reader.readAsText(files[0], 'UTF-8');
    evt.target.style.background = 'white';
  };
  handleDragOver = function(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy';
    evt.target.style.background = '#070433';
  };
  handleFileSelect = function(evt) {
    var files, reader;
    files = evt.target.files;
    reader = new FileReader;
    reader.onload = function(event) {
      document.getElementById('INPUT').value = event.target.result;
    };
    reader.readAsText(files[0], 'UTF-8');
  };
  dropZone.addEventListener('dragover', handleDragOver, false);
  dropZone.addEventListener('drop', handleDrop, false);
  fileSelect = document.getElementById('select');
  fileSelect.addEventListener('change', handleFileSelect, false);
});

// ---
// generated by coffee-script 1.9.2
