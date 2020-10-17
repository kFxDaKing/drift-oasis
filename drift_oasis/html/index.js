$('#nav').on('onload', '#nav-info', function(){
 $("#nav-info").addClass("active");
});

$(function() {
  $('#container').hide();
  ResetPages()
  window.addEventListener("message", (event) => {
    var item = event.data;
    if(item !== undefined && item.type === "ui") {
      if(item.display === true) {
        $('#container').show();
        
      } else {
        $('#container').hide();
      }
    }
  })
})

var SI_SYMBOL = ["", "k", "M", "B", "T", "P", "E"];

function abbreviateNumber(number){

    // what tier? (determines SI symbol)
    var tier = Math.log10(number) / 3 | 0;

    // if zero, we don't need a suffix
    if(tier == 0) return number;

    // get suffix and determine scale
    var suffix = SI_SYMBOL[tier];
    var scale = Math.pow(10, tier * 3);

    // scale the number
    var scaled = number / scale;

    // format number and add suffix
    return scaled.toFixed(1) + suffix;
}
function GetRankName(id) {
  if (id == 0) {
    return "Newbie";
  } else if (id == 1) {
    return "Decent";
  } else if (id == 2) {
    return "Pro";
  } else if (id == 3) {
    return "Instructor";
  } else if (id == 4) {
    return "Legendary";
  } else if (id == 5) {
    return "Drift King";
  } else if (id == 6) {
    return "Administrator";
  }
}

function ResetPages() {
  document.getElementById('ui-body-info').style.display = "block";
  document.getElementById('ui-body-car').style.display = "none";
  document.getElementById('ui-body-unlockables').style.display = "none";
  document.getElementById('ui-body-ranks').style.display = "none";
  document.getElementById('ui-body-maps').style.display = "none";
  document.getElementById('ui-body-lscustoms').style.display = "none";
  
  $('a li').removeClass("active");
  $("#nav-info").addClass("active");
}

$(function() {
  window.addEventListener("message", (event) => {
    var player = event.data;

    
    if(player !== undefined && player.type === "ui") {
      var Rank = player.currentRank
      switch (Rank) {
        case 0:
          Rank = "Newbie Drifter";
          break;
        case 1:
          Rank = "Decent Drifter";
          break;
        case 2:
          Rank = "Pro Drifter";
          break;
        case 3:
          Rank = "Drift Instructor";
          break;
        case 4:
          Rank = "Legendary Drifter";
          break;
        case 5:
          Rank = "Drift King";
          break;
        case 6:
        Rank = "Administrator";
      }
      document.getElementById("player_name").textContent = player.name;
      document.getElementById("drift_points").textContent = "$"+player.points;
      document.getElementById("money-spent").textContent = player.MoneySpent;
      document.getElementById("total-earned").textContent = player.TotalEarned;
      document.getElementById("cars-unlocked").textContent = player.UnlockedVehicles;
      document.getElementById("cars-locked").textContent = player.LockedVehicles;
      document.getElementById("current-rank").textContent = Rank;
    }
  })
})
function CloseUI() {
  $('#container').hide();
  ResetPages()
  $.post(`https://${GetParentResourceName()}/CloseUI`, JSON.stringify({}));
}

document.onkeyup = function (data) {
  if (data.which == 27) { 
    $('#container').hide();
    ResetPages()
    $.post(`https://${GetParentResourceName()}/CloseUI`, JSON.stringify({}));
  }
};

document.getElementById("information").addEventListener("click", ShowInfo);
function ShowInfo() {
  document.getElementById('ui-body-info').style.display = "block";
  document.getElementById('ui-body-car').style.display = "none";
  document.getElementById('ui-body-unlockables').style.display = "none";
  document.getElementById('ui-body-ranks').style.display = "none";
  document.getElementById('ui-body-maps').style.display = "none";
  document.getElementById('ui-body-lscustoms').style.display = "none";
}

document.getElementById('car').addEventListener("click", ShowCar);
function ShowCar() {
  document.getElementById('ui-body-info').style.display = "none";
  document.getElementById('ui-body-car').style.display = "block";
  document.getElementById('ui-body-unlockables').style.display = "none";
  document.getElementById('ui-body-ranks').style.display = "none";
  document.getElementById('ui-body-maps').style.display = "none";
  document.getElementById('ui-body-lscustoms').style.display = "none";
}

document.getElementById('unlockables').addEventListener("click", ShowUnlockables);
function ShowUnlockables() {
  document.getElementById('ui-body-info').style.display = "none";
  document.getElementById('ui-body-car').style.display = "none";
  document.getElementById('ui-body-unlockables').style.display = "block";
  document.getElementById('ui-body-ranks').style.display = "none";
  document.getElementById('ui-body-maps').style.display = "none";
  document.getElementById('ui-body-lscustoms').style.display = "none";
}

document.getElementById('ranks').addEventListener("click", ShowRanks);
function ShowRanks() {
  document.getElementById('ui-body-info').style.display = "none";
  document.getElementById('ui-body-car').style.display = "none";
  document.getElementById('ui-body-unlockables').style.display = "none";
  document.getElementById('ui-body-ranks').style.display = "block";
  document.getElementById('ui-body-maps').style.display = "none";
  document.getElementById('ui-body-lscustoms').style.display = "none";
}
document.getElementById('maps').addEventListener("click", ShowMaps);
function ShowMaps() {
  document.getElementById('ui-body-info').style.display = "none";
  document.getElementById('ui-body-car').style.display = "none";
  document.getElementById('ui-body-unlockables').style.display = "none";
  document.getElementById('ui-body-ranks').style.display = "none";
  document.getElementById('ui-body-maps').style.display = "block";
  document.getElementById('ui-body-lscustoms').style.display = "none";
}
document.getElementById('lscustoms').addEventListener("click", ShowLsCustoms);
function ShowLsCustoms() {
  document.getElementById('ui-body-info').style.display = "none";
  document.getElementById('ui-body-car').style.display = "none";
  document.getElementById('ui-body-unlockables').style.display = "none";
  document.getElementById('ui-body-ranks').style.display = "none";
  document.getElementById('ui-body-maps').style.display = "none";
  document.getElementById('ui-body-lscustoms').style.display = "block";
}

$('a li').click(function(){
  $('a li').removeClass("active");
  $(this).addClass("active");
});   

window.addEventListener("message", (event) => {
  var vehicle = event.data;
  var rank = vehicle.currentRank;
  var Vehicles = "";
  var vehicleList = "";
  var html = "";
  var html2 = "";
  vehicleList = vehicle.PlayerOwnedVehicles
  Vehicles = vehicleList

  if(vehicle !== undefined && vehicle.type === "ui" && Vehicles !== undefined) {

    for (var i = 0; i < Vehicles.length;  i++) {
      if (Vehicles[i].owned < 1) {
        if (rank >= Vehicles[i].rank) {

          html2+= "<div class='ui-card'>";

          html2+="<h4>"+Vehicles[i].name+"</h4><button id='ui-vehicle-price'>$"+abbreviateNumber(Vehicles[i].price)+"</button>";
    
    
          html2+=" <button id='unlock' class='Unlockbtn' prank-value='"+rank+"' name-value='"+Vehicles[i].name+"' price-value='"+Vehicles[i].price+"' rank-value='"+Vehicles[i].rank+"' value='"+Vehicles[i].id+"'>Unlock</button>";
        
          html2+="</div>";
        } else {
            
          html2+= "<div class='ui-card-unbuyable'>";

          html2+="<h4>"+Vehicles[i].name+"</h4><button id='ui-vehicle-price'>$"+abbreviateNumber(Vehicles[i].price)+"</button>";


          html2+="<h4>"+GetRankName(Vehicles[i].rank)+"</h4>";
        
          html2+="</div>";
        }

      }

      if(Vehicles[i].owned > 0) {
      html+= "<div class='ui-card'>";

      html+="<h4>"+Vehicles[i].name+"</h4>";
    
      html+="<button class='spawnbtn' name-value='"+Vehicles[i].name+"' value='"+Vehicles[i].id+"'>Spawn</button>";

      html+="</div>";
    
      }

    }
    document.getElementById("ui-body-unlockables-list").innerHTML = html2;
    document.getElementById("ui-body-car-list").innerHTML = html;
  }
})

$('#ui-body-car-list').on('click', '.spawnbtn', function(){
      $('#container').hide();
      ResetPages()

      var vehicleID = $(this).val();
      var CarName = $(this).attr("name-value");

      fetch(`https://${GetParentResourceName()}/SpawnCar`, {
        method: 'POST',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
              Vehicle: vehicleID,
              VehicleName: CarName
        })

      }).then(resp => resp.json()).then(resp => console.log(resp));
    });

$('#ui-body-unlockables').on('click', '.Unlockbtn', function(){
    $('#container').hide();
    ResetPages()  

    var vehicleID = $(this).val();
    var VehName = $(this).attr("name-value");
    var vehiclePrice = $(this).attr("price-value");
    var VehicleRank = $(this).attr("rank-value");
    var PlayerRank = $(this).attr("prank-value");
    
    fetch(`https://${GetParentResourceName()}/UnlockCar`, {
      method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          },
          body: JSON.stringify({
            Vehicle: vehicleID,
            VehicleName: VehName,
            Price: vehiclePrice,
            vRank: VehicleRank,
            pRank: PlayerRank
        })

      }).then(resp => resp.json()).then(resp => console.log(resp));

    });

    $('#ui-body-ranks-list').on('click', '#rank-upgrade', function(){
      $('#container').hide();
      ResetPages()

      var RP = $(this).val();
      var RID = $(this).attr("id-value");
      var RankN = $(this).attr("name-value");

      fetch(`https://${GetParentResourceName()}/RankUpgrade`, {
        method: 'POST',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
              RankPrice: RP,
              RankID: RID,
              RankName: RankN
        })

      }).then(resp => resp.json()).then(resp => console.log(resp));
    });
    
    $('#ui-body-maps-list').on('click', '#maps-teleport', function(){
      $('#container').hide();
      ResetPages()

      var TP = $(this).val();
      var RR = $(this).attr("id-value");
      var RN = $(this).attr("name-value");
      fetch(`https://${GetParentResourceName()}/mapTeleport`, {
        method: 'POST',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
              TravelPrice: TP,
              rankRequired: RR,
              MapName: RN
        })

      }).then(resp => resp.json()).then(resp => console.log(resp));
    });
    
    
    $('#ui-body-lscustoms-list').on('click', '#maps-teleport', function(){
      $('#container').hide();
      ResetPages()

      var TP = $(this).val();
      var RR = $(this).attr("id-value");
      var RN = $(this).attr("name-value");
      fetch(`https://${GetParentResourceName()}/mapTeleport`, {
        method: 'POST',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
              TravelPrice: TP,
              rankRequired: RR,
              MapName: RN
        })

      }).then(resp => resp.json()).then(resp => console.log(resp));
    });