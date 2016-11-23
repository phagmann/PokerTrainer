
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


function myMove(current) {
    if (current > 6) {
        return;
    }

    console.log(current)
    if (current === 3 || current === 6) {
        var elem = document.getElementById( current.toString() );
        console.log(elem);
        var vert = 0;
        var horz = 0;
        function frame1() {
        if (vert >= 220 ) {
          clearInterval(time);
          if (current === 6){
            elem.style.left = -110 + "px";
          }
          return myMove(current + 1);
         } 
        else {
          vert += 5;
          horz += 3.2;
          elem.style.top = vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
        var time = setInterval(frame1, 1);
        
   }

    else if (current === 2 || current === 5){
      var elem = document.getElementById(current.toString());
      console.log(elem);
      var vert = 0;
      var horz = 0;
      function frame2() {
        if (vert >= 200) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          vert += 5;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame2, 1);
      
   }


    else if (current === 1 || current === 4){
      var elem = document.getElementById( current.toString());
      console.log(elem);
      var vert = 0;
      var horz = 0;
      function frame3() {
        if (vert >= 160) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          vert += 5;
          horz += 10;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame3, 1);
      
    }
    else{
      return myMove(current + 1);
    }
  

  }



