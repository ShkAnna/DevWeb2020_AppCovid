<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	
   	<jsp:include page="/WEB-INF/jsp/view/cssCollection.jsp" />
   	
 </head>
 
 <body>
    <jsp:include page="/WEB-INF/jsp/view/sideNavbar.jsp" />
    <div class="page">
   	<jsp:include page="/WEB-INF/jsp/view/header.jsp" /> 	
    <!-- Breadcrumb-->
    <div class="breadcrumb-holder">
    	<div class="container-fluid">
        	<ul class="breadcrumb">
          		<li class="breadcrumb-item"><a href="dashboard-user">Home</a></li>
          		<li class="breadcrumb-item active">Mes activités</li>
        	</ul>
      	</div>
    </div>
	<section>
	<jsp:include page="/WEB-INF/jsp/view/modalDeleteUser.jsp" />
	<jsp:include page="/WEB-INF/jsp/view/modalAddUser.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
		     		<div class="row">
		      			<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100vh;'>								    
								        <div class="dhx_cal_navline row justify-content-between align-items-center ">
								        	<div class="dhx_cal_prev_button">&nbsp;</div>
											<div class="dhx_cal_next_button">&nbsp;</div>
											<div class="dhx_cal_today_button"></div>
											<div class="dhx_cal_date"></div>
							            	<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
											<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
											<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
											<div class="dhx_cal_tab" name="agenda_tab" style="right:280px;"></div>
											<div class="dhx_cal_tab" name="map_tab" style="right:280px;"></div>
								        </div>
									</div>
									<div class="dhx_cal_header"></div>
									<div class="dhx_cal_data"></div>  
								</div>
			    			</div>
			    		</div>
		    	  	</div>
	       		</div>
	       		<div class="col-lg-4">
	       			<div class="row">
	       				<div class="col-lg-12">
							<div class="card row justify-content-between align-items-center " style ="box-shadow:none;border:none;background:none;">
								<div id="cal_here" style='width:250px;'></div>
							</div>
						</div>
	       			</div>
	       			<div class="row">
	       			
	       			</div>
	       		</div>
		    </div>
		</div> 
	</section>
	
    <jsp:include page="/WEB-INF/jsp/view/footer.jsp" />
    </div>
  	<jsp:include page="/WEB-INF/jsp/view/script.jsp" />
  	<script>
	  	window.onload = function() {
	  		changeActiveLi();
	  		init();
	  		doOnLoad();
	  	};
	  	
	  	function changeActiveLi() {
	  		var navChange = document.getElementById("side-main-menu");
	  		var active = navChange.getElementsByClassName("active");
	  		Array.prototype.forEach.call(active, function forElement(element) {
	  		    element.classList.remove("active");
	  		   });
	  		var notActive = navChange.getElementsByClassName("activities");
	  		console.log(notActive);
	  		Array.prototype.forEach.call(notActive, function forElement(element) {
	  		    element.classList.add("active");
	  		   });
	  	}
	  	
	  	function init() {
			scheduler.config.multi_day = true;
			//The structure of the scheduler
		    scheduler.config.header = [
		        "day",
		        "week",
		        "month",
		        "agenda",
		        "map",
		        "date",
		        "prev",
		        "today",
		        "next"
		    ];
			//scheduler.init('scheduler_here',new Date(2018,0,10),"week");
			scheduler.load("${pageContext.request.contextPath}/common/events.json");
			// Following config options are optional
			// If you remove them current date will be used as start period
			// and current date + 1 year as the end
			
			scheduler.config.agenda_start = new Date(2017, 7, 1);
			scheduler.config.agenda_end = new Date(2019, 7, 1);
			
			//'map' is the default name of the Map view
			//scheduler.init('scheduler_here',new Date(2019,8,1),"map");
			scheduler.config.prevent_cache = true;
			
			scheduler.locale.labels.map_tab = "Map";
			scheduler.locale.labels.section_location = "Location";
			
			scheduler.xy.map_date_width = 180; // date column width
			scheduler.xy.map_description_width = 400; // description column width

			scheduler.config.map_start = new Date(2019, 3, 1);
			scheduler.config.map_end = new Date(2020, 9, 1);


			scheduler.config.lightbox.sections=[	
				{ name:"description", height:50, map_to:"text", type:"textarea", focus:true },
				{ name:"location", height:43, map_to:"event_location", type:"textarea"  },
				{ name:"time", height:72, type:"time", map_to:"auto"}	
			]
			
			scheduler.config.map_inital_zoom = 8;
			
			scheduler.init('scheduler_here', new Date(2019,5,1), "map");
			scheduler.load("${pageContext.request.contextPath}/backend/map-events");

			dp = new dataProcessor("${pageContext.request.contextPath}/backend/map-events");
			dp.init(scheduler);
			dp.setTransactionMode("REST", false);
			
		}
		
		function show_minical(){
			if (scheduler.isCalendarVisible())
				scheduler.destroyCalendar();
			else
				scheduler.renderCalendar({
					position:"dhx_minical_icon",
					date:scheduler.getState().date,
					navigation:true,
					handler:function(date,calendar){
						scheduler.setCurrentView(date);
						scheduler.destroyCalendar()
					}
				});
		}
		var prev = null;
		var curr = null;
		var next = null;

		function doOnLoad() {
			//scheduler.config.multi_day = true;
			
			//scheduler.init('scheduler_here',new Date(2017,9,11),"week");
			//scheduler.load("${pageContext.request.contextPath}/common/events.json")
			
			var calendar = scheduler.renderCalendar({
				container:"cal_here", 
				navigation:true,
				handler:function(date){
					scheduler.setCurrentView(date, scheduler.getState().mode);
				}
			});
			scheduler.linkCalendar(calendar);

			scheduler.setCurrentView();
		}
  	</script>
  </body>
</html>