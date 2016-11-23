
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function myMove(id) {
      if (id > 6){
        return
      }
    if(id == 3 || id == 6){
      var elem = document.getElementById(id.toString());
      var vert = 0;
      var horz = 0;
      var time = setInterval(frame, 0);
      function frame() {
        if (vert >= 220 ) {
          console.log(vert,horz);
          clearInterval(time);
          if(id == 6){
            elem.style.left = -110 + 'px'
          }
          myMove(id+1);
        } else {
          vert +=5;
          horz +=3.2;
          elem.style.top = vert  + 'px';
          elem.style.left = -horz + 'px';
        }
      }
   }

    else if(id == 2 || id == 5){
      var elem = document.getElementById(id.toString());
      var vert = 0;
      var horz = 0;
      var time = setInterval(frame, 0);
      function frame() {
        if (vert >= 200) {
          console.log(vert,horz);
          clearInterval(time);
          myMove(id+1);
        } else {
          vert +=5;
          elem.style.top = -vert + 'px';
          elem.style.left = -horz + 'px';
        }
      }
   }


    else if(id == 1 || id == 4){
      var elem = document.getElementById(id.toString());
      var vert = 0;
      var horz = 0;
      var time = setInterval(frame, 0);
      function frame() {
        if (vert >= 160 ) {
          console.log(id);
          clearInterval(time);
          myMove(id+1);
        } else {
          vert +=5;
          horz +=10;
          elem.style.top = -vert + 'px';
          elem.style.left = -horz + 'px';
        }
      }
    }
    








}



