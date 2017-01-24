
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




// document.getElementById("successAndErrorMessages").innerHTML="someContent";
// document.createElement("SPAN");
// document.getElementById("myList").appendChild(node);



// <li><div class="card back">*</div></li>
 
// <li><div class= "<%=c1%>">
//         <span class="rank"><%=@card1.rank%></span>
//         <span class="suit"><%=@card1.suit%></span>
//     </div></li>


function scrapEmail(string){
  var email = "";
  for(var i = 0;i < string.length;i++){
    char = string[i];
    if (char !== ":"){
      email += char;
    }
    else{
      return email;
    }
  }

}

function stringToArray(string){
  if (typeof myVar !== 'string'){
    return string;
  }
  var current = ""
  var final = []
  for (var i = 1; i < string.length; i++){
      ii = string[i]
      if(ii == "," || ii == "]" ){
          final.push(current) 
          current = ""
      }
      else{
          current += ii
      }
      
  }
  return final
}

function withIn (string){
    leftBrace = 1
    rightBrace = 0
    current = "["
    for (var i = 1; i < string.length; i++){
        ii = string[i]
        if( ii === '['){
            leftBrace++
        }
        else if( ii === ']'){
            rightBrace++
        }
        current += ii
        if (rightBrace === leftBrace){
            return current
        }
    }
    return "error"
}
function superStringToArray(string){
  var current = ""
  var final = []
  for (var i = 1; i < string.length; i++){
      ii = string[i]
      if( ii === '['){
            innerList = withIn(string.substring(i))
            final.push([stringToArray(innerList)])
            current = ""
            i += innerList.length 
        } 
      else if (ii == "," || ii == "]" ){
          final.push(current) 
          current = ""
      }
      else{
          current += ii
      }


  }
  return final
}







function myMove(current) {
    if (current > 11) {
        return;
    }

    
    if (current === 3 || current === 6) {
        var elem = document.getElementById( current.toString() );
        
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
     
      var vert = 0;
      var horz = 0;
      function frame2() {
        if (vert >= 200) {
          clearInterval(time);
          if (current === 5){
            elem.style.left = +30 + "px";
          }
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
     
      var vert = 0;
      var horz = 0;
      function frame3() {
        if (vert >= 160) {
          clearInterval(time);
          if (current === 4){
            elem.style.left = -280 + "px";
          }
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
    else if (current === 7){
      var elem = document.getElementById( current.toString());
 
      var vert = 0;
      var horz = 0;
      function frame4() {
        if (horz >= 280) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          
          horz += 10;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame4, 1);
      
    }

    else if (current === 8){
      var elem = document.getElementById( current.toString());
   
      var vert = 0;
      var horz = 0;
      function frame8() {
        if (horz >= 230) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          
          horz += 10;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame8, 1);
      
    }

    else if (current === 9){
      var elem = document.getElementById( current.toString());
      var vert = 0;
      var horz = 0;
      function frame5() {
        if (horz >= 180) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          
          horz += 10;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame5, 1);
      
    }

    else if (current === 10){
      var elem = document.getElementById( current.toString());
      var vert = 0;
      var horz = 0;
      function frame6() {
        if (horz >= 130) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          
          horz += 10;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame6, 1);
      
    }

    else if (current === 11){
      var elem = document.getElementById( current.toString());
      
      var vert = 0;
      var horz = 0;
      function frame7() {
        if (horz >= 80) {
          clearInterval(time);
          return myMove(current + 1);
        } 
        else {
          
          horz += 10;
          elem.style.top = -1*vert + "px";
          elem.style.left = -1*horz + "px";
        };
      };
      var time = setInterval(frame7, 1);
      
    }
  

  }

  function foldCheck(gameID) {
  $(function() {
$.get('/hand2s/' + gameID.toString()).success (function(hands) {
  $.get( '/user2s/' + gameID.toString()).success (function(players)  {
  for(var i = 0;i < hands.length; i++){
      var hand = hands[i];
      for(var ii = 0;ii < players.length; ii++){
        if(hand.player_id == players[ii].id){
            var player = players[ii];
            break;
        }
      }
      
      
    // for some reason this is doing the loop yet the $.get is only using the last data values
    // loop 1,2,3... get uses 3,3,3....fml
    
      var div = document.getElementById("c" + player.id.toString());
      div.innerHTML = player.email + ": " + player.chips_bank.toString(); 
      var civ = document.getElementById("ac" + player.id.toString());
      if(hand.fold == false){
        civ.innerHTML = "Betting to: " + player.betting;

      }
      else{
        civ.innerHTML = "Folded";
        //make sure this is user
        var biv = document.getElementById("raise");
        biv.disabled = true;
// 

  // autosycranous behavior messes up folding on screen
$.post('/hands/' + hand.id, {
        _method: "PUT",
        hand: {
          fold: hand.fold
        }
      }).success (function(data) {
  div = document.getElementById(data.positions_id)
  div.className = "card back"
  div.style= "background:black;top:" + div.style.top.toString() + ";left:" + div.style.left.toString()
  div.innerHTML = "*"
}
  )





// 

      }


 
  


  }

  })

})

})

}



