$(document)
		.ready(
				function() {
					var base_color = "rgb(230,230,230)";
					var active_color = "rgb(237, 40, 70)";
					
					var selectVehicleTypePrice = 0;
					var selectCityName = null;
					var selectCityCordinate = null;
					
					var selectCityLat = null;
					var selectCityLng = null;

					var child = 1;
					var runNextFun = false;
					var length = $(".add-booking-section").length - 1;
					$("#prev").addClass("disabled");
					$("#submit").addClass("disabled");

					$(".add-booking-section").not(
							".add-booking-section:nth-of-type(1)").hide();
					$(".add-booking-section").not(
							".add-booking-section:nth-of-type(1)").css(
							'transform', 'translateX(100px)');

					var svgWidth = length * 200 + 24;
					$("#svg_wrap")
							.html(
									'<svg version="1.1" id="svg_form_time" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 '
											+ svgWidth
											+ ' 24" xml:space="preserve"></svg>');

					function makeSVG(tag, attrs) {
						var el = document.createElementNS(
								"http://www.w3.org/2000/svg", tag);
						for ( var k in attrs)
							el.setAttribute(k, attrs[k]);
						return el;
					}

					for (i = 0; i < length; i++) {
						var positionX = 12 + i * 200;
						var rect = makeSVG("rect", {
							x : positionX,
							y : 9,
							width : 200,
							height : 6
						});
						document.getElementById("svg_form_time").appendChild(
								rect);
						// <g><rect x="12" y="9" width="200"
						// height="6"></rect></g>'
						var circle = makeSVG("circle", {
							cx : positionX,
							cy : 12,
							r : 12,
							width : positionX,
							height : 6
						});
						document.getElementById("svg_form_time").appendChild(
								circle);
					}

					var circle = makeSVG("circle", {
						cx : positionX + 200,
						cy : 12,
						r : 12,
						width : positionX,
						height : 6
					});
					document.getElementById("svg_form_time")
							.appendChild(circle);

					$('#svg_form_time rect').css('fill', base_color);
					$('#svg_form_time circle').css('fill', base_color);
					$("circle:nth-of-type(1)").css("fill", active_color);

					checkInputFields($("#next"));

					$(".button")
							.click(
									function() {
										// console.log(runNextFun);

										if ($(this).attr("id") == "next") {

											if (runNextFun) {
												$("#svg_form_time rect").css(
														"fill", active_color);
												$("#svg_form_time circle").css(
														"fill", active_color);
												var id = $(this).attr("id");
												if (id == "next") {
													$("#prev").removeClass(
															"disabled");
													if (child >= length) {
														$(this).addClass(
																"disabled");
														$('#submit')
																.removeClass(
																		"disabled");
													}
													if (child <= length) {
														child++;
													}
												} else if (id == "prev") {
													$("#next").removeClass(
															"disabled");
													$('#submit').addClass(
															"disabled");
													if (child <= 2) {
														$(this).addClass(
																"disabled");
													}
													if (child > 1) {
														child--;
													}
												}
												var circle_child = child + 1;
												$(
														"#svg_form_time rect:nth-of-type(n + "
																+ child + ")")
														.css("fill", base_color);
												$(
														"#svg_form_time circle:nth-of-type(n + "
																+ circle_child
																+ ")").css(
														"fill", base_color);
												var currentSection = $(".add-booking-section:nth-of-type("
														+ child + ")");
												currentSection.fadeIn();
												currentSection.css('transform',
														'translateX(0)');
												currentSection
														.prevAll(
																'.add-booking-section')
														.css('transform',
																'translateX(-100px)');
												currentSection
														.nextAll(
																'.add-booking-section')
														.css('transform',
																'translateX(100px)');
												$('.add-booking-section').not(
														currentSection).hide();
											}

										} else {
											$("#svg_form_time rect").css(
													"fill", active_color);
											$("#svg_form_time circle").css(
													"fill", active_color);
											var id = $(this).attr("id");
											if (id == "next") {
												$("#prev").removeClass(
														"disabled");
												if (child >= length) {
													$(this)
															.addClass(
																	"disabled");
													$('#submit').removeClass(
															"disabled");
												}
												if (child <= length) {
													child++;
												}
											} else if (id == "prev") {
												$("#next").removeClass(
														"disabled");
												$('#submit').addClass(
														"disabled");
												if (child <= 2) {
													$(this)
															.addClass(
																	"disabled");
												}
												if (child > 1) {
													child--;
												}
											}
											var circle_child = child + 1;
											$(
													"#svg_form_time rect:nth-of-type(n + "
															+ child + ")").css(
													"fill", base_color);
											$(
													"#svg_form_time circle:nth-of-type(n + "
															+ circle_child
															+ ")").css("fill",
													base_color);
											var currentSection = $(".add-booking-section:nth-of-type("
													+ child + ")");
											currentSection.fadeIn();
											currentSection.css('transform',
													'translateX(0)');
											currentSection
													.prevAll(
															'.add-booking-section')
													.css('transform',
															'translateX(-100px)');
											currentSection
													.nextAll(
															'.add-booking-section')
													.css('transform',
															'translateX(100px)');
											$('.add-booking-section').not(
													currentSection).hide();
										}

									});
					
					$("#travel-city").on('change', function() {
						  $("#pickUpLocation").val("");
						  $("#pickUpLocationCity").val("");
						  $("#pickUpLocationCoordinates").val("");
						  $("#dropLocation").val("");
						  $("#dropLocationCity").val("");
						  $("#dropLocationCoordinates").val("");
					});

					function checkInputFields(btn) {
						btn
								.click(function() {
									var activeSection = $(".add-booking-section:nth-of-type("
											+ child + ")");
									var activeSectionID = activeSection
											.attr("id");
//									console.log(activeSectionID);
									if (activeSectionID == "add-booking-section-01") {

										var vehicleType = $("#vehicle-type")
												.val();
										var travelCity = $("#travel-city")
												.val();
//										console.log(vehicleType);
//										console.log(travelCity);
										if ((vehicleType != null)
												&& (travelCity != null)) {
											
											selectVehicleTypePrice = $('#vehicleTypeCharge'+vehicleType).val();
											selectCityName = $("#brancheName"+travelCity).val();
											selectCityCordinate = $('#brancheCordinate'+travelCity).val();
											
											const splitArray = selectCityCordinate.trim().split(",");
											
											selectCityLat = splitArray[0];
											selectCityLng = splitArray[1];
											
											$("#selectCityLat").val(selectCityLat);
											$("#selectCityLng").val(selectCityLng);
											
											var newCenterOfMap = {lat: selectCityLat, lng: selectCityLng};
										    
											pickUpLocationMap.setCenter(newCenterOfMap);
											pickUpLocationMap.setZoom(11);
											dropLocationMap.setCenter(newCenterOfMap);
											dropLocationMap.setZoom(11);
											
//											console.log(selectCityLat);
//											console.log(selectCityLng);
											
//											console.log(selectVehicleTypePrice);
//											console.log(selectCityName);
//											console.log(selectCityCordinate);
											
											runNextFun = true;
											
										} else {
											alert("Fill All Fields...!");
											runNextFun = false;
										}

									} else if (activeSectionID == "add-booking-section-02") {
										
										var pickUpLocation = $("#pickUpLocation").val();
										var pickUpLocationCity = $("#pickUpLocationCity").val();
										var pickUpLocationCoordinates = $("#pickUpLocationCoordinates").val();
//										console.log(pickUpLocation);
//										console.log(pickUpLocationCity);
//										console.log(pickUpLocationCoordinates);
										
										if((pickUpLocation != "") && (pickUpLocationCity != "") && (pickUpLocationCoordinates != "")){
											runNextFun = true;
										}else{
											alert("Fill All Fields...!");
											runNextFun = false;
										}
										
									} else if (activeSectionID == "add-booking-section-03") {
										var dropLocation = $("#dropLocation").val();
										var dropLocationCity = $("#dropLocationCity").val();
										var dropLocationCoordinates = $("#dropLocationCoordinates").val();
//										console.log(dropLocation);
//										console.log(dropLocationCity);
//										console.log(dropLocationCoordinates);
										
										if((dropLocation != "") && (dropLocationCity != "") && (dropLocationCoordinates != "")){
											runNextFun = true;
										}else{
											alert("Fill All Fields...!");
											runNextFun = false;
										}
									} else {
										console.log("Invalid Section : "
												+ activeSection);
										runNextFun = false;
									}

								});
					}
				});
