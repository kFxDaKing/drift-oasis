$( document ).ready(function() {
  setTimeout(loadDatSkweenie, 2000);
});

function loadDatSkweenie() {
  var banner = ["&nbsp", "D" ,"r", "i", "f", "t", "&nbsp", "O", "a", "s", "i", "s", "&nbsp"]
  var rules = ["No Racism",
               "Players must be respectful to each other.", 
               "No Cheating/Exploiting.",
               "No Advertising/Soliciting.",
               "Follow the direction of the tracks.", 
               "Don't purposely hit other players while drifting.",
               "Don't steal other players vehicle.",
               "No Vehicle or player deathmatch."
              ]
  var fadeTime = 500
  var fadeTime2 = 500
  $(".infohold").fadeIn(900)
  $(".steamid").show(900)
  $(banner).each(function( i ) {
    var tCount = Number(i)
    fadeTime = fadeTime + 200
    $(".banner p:nth-child("+tCount+")").hide()
    $( ".banner" ).append( "<p>"+banner[tCount]+"</p>" );
    $(".banner p:nth-child("+tCount+")").fadeIn(fadeTime)
  })
  $(rules).each(function( i ) {
    var rCount = Number(i) 
    fadeTime2 = fadeTime2 + 300
    $(".block .text:nth-child("+rCount+")").hide()
    $( ".block:nth-child(1)" ).append( "<p class='text'>"+rules[rCount]+"</p>" )
    $(".block .text:nth-child("+rCount+")").show(fadeTime2)
  })
}