var platform = new H.service.Platform({
	    apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
	  });
	var defaultLayers = platform.createDefaultLayers();

	var pickUpLocationMap = new H.Map(document.getElementById('pickUpLocationMap'), defaultLayers.vector.normal.map, {
	    center: {lat: 7.289946585454237, lng: 80.63505034705457},
	    zoom: 11,
	    pixelRatio: window.devicePixelRatio || 1
	});
	window.addEventListener('resize', () => pickUpLocationMap.getViewPort().resize());
	var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(pickUpLocationMap));
	
	
	var platform_drop = new H.service.Platform({
	    apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
	  });
	var defaultLayers_drop = platform_drop.createDefaultLayers();

	var dropLocationMap = new H.Map(document.getElementById('dropLocationMap'), defaultLayers_drop.vector.normal.map, {
	    center: {lat: 52.496, lng: 13.382},
	    zoom: 11,
	    pixelRatio: window.devicePixelRatio || 1
	});
	window.addEventListener('resize', () => dropLocationMap.getViewPort().resize());
	var behavior_drop = new H.mapevents.Behavior(new H.mapevents.MapEvents(dropLocationMap));
	
	
	var platform_dis = new H.service.Platform({
	    apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
	  });
	var defaultLayers_dis = platform_dis.createDefaultLayers();

	var disMap = new H.Map(document.getElementById('disMap'), defaultLayers_dis.vector.normal.map, {
	    center: {lat: 52.496, lng: 13.382},
	    zoom: 11,
	    pixelRatio: window.devicePixelRatio || 1
	});
	window.addEventListener('resize', () => disMap.getViewPort().resize());
	var behavior_dis = new H.mapevents.Behavior(new H.mapevents.MapEvents(disMap));
	
	
// Get Location
		
	function getLocationsList(inp, searchAreaLat, searchAreaLng, apiKey, city) {
		
		var returnLocationList = false;
		
		inp.keyup(function(){
// console.log(this.value);
			var inpValue = this.value;
			var locationNameArray = [];
			var locationLatArray = [];
			var locationLngArray = [];
			
			var a;
			var b;
			
// console.log(inpValue != "");
			
			$("#"+this.id+ "autocomplete-list").remove();
			
			if(inpValue != ""){
				
				var urlLink = "https://autosuggest.search.hereapi.com/v1/autosuggest?at=7.29497,80.63867&limit=13&lang=en&q=" + inpValue + "&apiKey=YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs";
				
				var inpElement = this;
				var inpID = this.id;
				
			    $.ajax({
			    	type: 'GET',
			        url: urlLink,
			        async: false,
			        success: function(data) {
			        	if(data.hasOwnProperty('items')){
			        		
			        		for (var i = 0; i < data.items.length; i++) {
			        			
			        			if(data.items[i].hasOwnProperty('address')){
			        				if(data.items[i].address.hasOwnProperty('label')){
			        					locationNameArray.push(data.items[i].address.label);								
				        			}
			        			}
			        			if(data.items[i].hasOwnProperty('position')){
			        				locationLatArray.push(data.items[i].position.lat);
			        				locationLngArray.push(data.items[i].position.lng);
			        			}
			        			
			        		}
// console.log(locationLatArray);
// console.log(locationLngArray);
			        		
			        		a = document.createElement("DIV");
			        		a.setAttribute("id", inpID + "autocomplete-list");
			        		a.setAttribute("class", "autocomplete-items");
// console.log(inpElement);
// console.log(inpElement.parentNode);
			        		inpElement.parentNode.appendChild(a);
			        		
// console.log("length : "+locationNameArray.length);
			        		
			        		for(var i = 0; i < locationNameArray.length; i++){
			        			
// console.log("List : "+locationNameArray[i]);
			        			
			        			b = document.createElement("DIV");
			        			b.innerHTML = locationNameArray[i];
			        			b.innerHTML += "<input type='hidden' value='" + locationNameArray[i] + "'>";
			        			b.innerHTML += "<input type='hidden' value='" + locationLatArray[i] + "'>";
			        			b.innerHTML += "<input type='hidden' value='" + locationLngArray[i] + "'>";
			        			b.addEventListener(
			        					"click",
			        					function(e) {
			        						
			        						var locationLat = this.getElementsByTagName("input")[1].value;
			        						var locationLng = this.getElementsByTagName("input")[2].value;
			        						
			        						var locationCity = getLocationCity(locationLat, locationLng, null);
			        						
			        						if(city == locationCity){
			        							
			        							$("#"+inpID+"City").val(locationCity);
			        							$("#"+inpID+"Coordinates").val(locationLat+","+locationLng);
			        							
			        							inp.val(this.getElementsByTagName("input")[0].value);
			        							
// console.log("locationCity : "+locationCity);
			        							
			        							$("#"+inpID+ "autocomplete-list").remove();
			        							
			        							if(inpID == "pickUpLocation"){
			        								addMarkersToMap(pickUpLocationMap, locationLat, locationLng);
			        							}
			        							
			        							if(inpID == "dropLocation"){
			        								addMarkersToMap(dropLocationMap, locationLat, locationLng);
			        							}
			        						}else{
			        							alert("Soory Your Location Out Of "+city+"...!"+locationCity);
			        						}
			        						

			        					});
			        			a.appendChild(b);
			        		}
			        	}
			        },
			        error: function(err) {
			        	alert("Some Thing Went Wrong : EC-GLL");
			        	console.log(err);
			        }
			      });
			}else{
// console.log(this.id);
				$("#"+this.id+"City").val("");
				$("#"+this.id+"Coordinates").val("");
				$("#"+this.id+ "autocomplete-list").remove();
				
				if(this.id == "pickUpLocation"){
					removeMarkers(pickUpLocationMap);
				}
				
				if(this.id == "dropLocation"){
					removeMarkers(dropLocationMap);
				}
				
			}

			});
	}
	
	getLocationsList($("#pickUpLocation"), null, null, null, "Kandy");
	getLocationsList($("#dropLocation"), null, null, null, "Kandy");
	
	function getLocationCity(locationLat, locationLng, apiKey) {
		
		var locationCity = null;
		
		var urlLink = "https://discover.search.hereapi.com/v1/discover?at=7.2900981379930325,80.63468193110042&q="+locationLat+", "+locationLng+"&apiKey=YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs";
		
		$.ajax({
	    	type: 'GET',
	        url: urlLink,
	        async: false,
	        success: function(data) {
	        	
// console.log(data);
	        	if(data.hasOwnProperty('items')){
	        		
	        		if(data.items[0].hasOwnProperty('address')){
        				if(data.items[0].address.hasOwnProperty('county')){
        					locationCity = (data.items[0].address.county);								
	        			}
        			}
	        		
	        	}
	        	
	        },
	        error: function(err) {
	         alert("Some Thing Went Wrong : EC-GLC");
	        	console.log(err);
	        }
	      });
		
		return locationCity;
		
	}
	
	function addMarkersToMap(map, locationLat, locationLng) {

// console.log(map);
	    var mapObject = map.getObjects();

	    if(mapObject.length > 0){

	    	map.removeObject(mapObject[0]);
	    }
	    var marker = new H.map.Marker({lat:locationLat, lng:locationLng});
	    map.addObject(marker);
	    
	    var newCenterOfMap = {lat: locationLat, lng: locationLng};
	    
	    map.setCenter(newCenterOfMap);
	    map.setZoom(18);

	}
	
	function removeMarkers(map){
		var mapObject = map.getObjects();

	    if(mapObject.length > 0){

	    	map.removeObject(mapObject[0]);
	    }
	}
	
	function getDistanceAndRoute(map, btn, apiKey){
		
		btn.click(function(e){
			var pickUpLocationCoordinates = $("#pickUpLocationCoordinates").val();
			var dropLocationCoordinates = $("#dropLocationCoordinates").val();
			
			if((pickUpLocationCoordinates != "")&& (dropLocationCoordinates != "")){
// console.log(pickUpLocationCoordinates);
// console.log(dropLocationCoordinates);
				
				var mapObjects = map.getObjects();
//				console.log(mapObjects.length);
				
				if(mapObjects.length > 0){
					for(var i =0; i < mapObjects.length; i++){
						map.removeObject(mapObjects[i]);
					}
				}
				

				function calculateRouteFromAtoB(platform) {
				  var router = platform.getRoutingService(null, 8),
				      routeRequestParams = {
				        routingMode: 'fast',
				        transportMode: 'car',
				        origin: pickUpLocationCoordinates, 
				        destination: dropLocationCoordinates, 
				        return: 'polyline,turnByTurnActions,actions,instructions,travelSummary'
				      };

				  router.calculateRoute(
				    routeRequestParams,
				    onSuccess,
				    onError
				  );
				}

				function onSuccess(result) {
				  var route = result.routes[0];

				  addRouteShapeToMap(route);
				  addManueversToMap(route);
				  getDistance(route);
				}

				function onError(error) {
				  alert('Can\'t reach the remote server');
				}

				var platform = new H.service.Platform({
				  apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
				});

// var defaultLayers = platform.createDefaultLayers();
				
			    var centerOfMap = {lat:pickUpLocationCoordinates.split(',')[0] , lng: pickUpLocationCoordinates.split(',')[1]};
			    
			    map.setCenter(centerOfMap);
			    map.setZoom(8);

				var bubble;

				function openBubble(position, text) {
				  if (!bubble) {
				    bubble = new H.ui.InfoBubble(
				      position,

				      {content: text});
				    ui.addBubble(bubble);
				  } else {
				    bubble.setPosition(position);
				    bubble.setContent(text);
				    bubble.open();
				  }
				}

				function addRouteShapeToMap(route) {
				  route.sections.forEach((section) => {
				    let linestring = H.geo.LineString.fromFlexiblePolyline(section.polyline);
				    let polyline = new H.map.Polyline(linestring, {
				      style: {
				        lineWidth: 4,
				        strokeColor: 'rgba(0, 128, 255, 0.7)'
				      }
				    });
				    map.addObject(polyline);

				    map.getViewModel().setLookAtData({
				      bounds: polyline.getBoundingBox()
				    });
				  });
				}

				function addManueversToMap(route) {
				  var svgMarkup = '<svg width="18" height="18" ' +
				    'xmlns="http://www.w3.org/2000/svg">' +
				    '<circle cx="8" cy="8" r="8" ' +
				      'fill="#1b468d" stroke="white" stroke-width="1" />' +
				    '</svg>',
				    dotIcon = new H.map.Icon(svgMarkup, {anchor: {x:8, y:8}}),
				    group = new H.map.Group(),
				    i,
				    j;

				  route.sections.forEach((section) => {
				    let poly = H.geo.LineString.fromFlexiblePolyline(section.polyline).getLatLngAltArray();

				    let actions = section.actions;
				    // Add a marker for each maneuver
				    for (i = 0; i < actions.length; i += 1) {
				      let action = actions[i];
				      var marker = new H.map.Marker({
				        lat: poly[action.offset * 3],
				        lng: poly[action.offset * 3 + 1]},
				        {icon: dotIcon});
				      marker.instruction = action.instruction;
				      group.addObject(marker);
				    }

				    group.addEventListener('tap', function (evt) {
				      map.setCenter(evt.target.getGeometry());
				      openBubble(evt.target.getGeometry(), evt.target.instruction);
				    }, false);

				    map.addObject(group);
				  });
				}
				
				function getDistance(route) {
					  let duration = 0,
					    distance = 0;

					  route.sections.forEach((section) => {
					    distance += section.travelSummary.length;
					    duration += section.travelSummary.duration;
					  });
					  
//					  console.log(distance);
//					  console.log(duration);
					  
					  $("#bookingDis").val((distance/1000)+"km");
					  $("#bookingPrice").val("RS "+(distance*60)/1000);
				}

				calculateRouteFromAtoB(platform);
//				console.log(mapObjects);

			}
			});
		
	}
	
	getDistanceAndRoute(disMap, $("#next"), null);
	

	
	