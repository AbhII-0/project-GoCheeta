var platform = new H.service.Platform({
	    apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
	  });
	var defaultLayers = platform.createDefaultLayers();

	var map = new H.Map(document.getElementById('map'), defaultLayers.vector.normal.map, {
	    center: {lat: 7.289946585454237, lng: 80.63505034705457},
	    zoom: 11,
	    pixelRatio: window.devicePixelRatio || 1
	});
	window.addEventListener('resize', () => map.getViewPort().resize());
	var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));
	
	
	var platform_drop = new H.service.Platform({
	    apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
	  });
	var defaultLayers_drop = platform_drop.createDefaultLayers();

	var map_drop = new H.Map(document.getElementById('map_drop'), defaultLayers_drop.vector.normal.map, {
	    center: {lat: 52.496, lng: 13.382},
	    zoom: 11,
	    pixelRatio: window.devicePixelRatio || 1
	});
	window.addEventListener('resize', () => map_drop.getViewPort().resize());
	var behavior_drop = new H.mapevents.Behavior(new H.mapevents.MapEvents(map_drop));
	
	
	var platform_dis = new H.service.Platform({
	    apikey: "YTAWUS1lgkY8BVl63vM5ipT3V4vecBnwC1_EHk3DNvs"
	  });
	var defaultLayers_dis = platform_dis.createDefaultLayers();

	var map_dis = new H.Map(document.getElementById('map_dis'), defaultLayers_dis.vector.normal.map, {
	    center: {lat: 52.496, lng: 13.382},
	    zoom: 11,
	    pixelRatio: window.devicePixelRatio || 1
	});
	window.addEventListener('resize', () => map_dis.getViewPort().resize());
	var behavior_dis = new H.mapevents.Behavior(new H.mapevents.MapEvents(map_dis));