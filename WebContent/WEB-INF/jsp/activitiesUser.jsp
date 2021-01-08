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
				<div class="col-md-4 col-md-offset-4" style="text-align: center;">
        <h1>Nouvelle activité</h1>
        <form method="post" action="nouvelle-activite" >
            <div><label for="startDate" >Début de l'activité</label></div>
            <div class="form-row">
                <div class="col"><input class="form-control" type="time" id="startTime" name="startTime"><br></div>
                <div class="col"><input class="form-control" type="date" id="startDate"  name="startDate"  min="2019-09-01"><br><br></div>
            </div>
            <div><label for="endDate" >Fin de l'activité</label></div>
            <div class="form-row">
                <div class="col"> <input  class="form-control" type="time" id="endTime" name="endTime"><br></div>
                <div class="col"><input class="form-control" type="date" id="endDate" name="endDate"  min="2019-09-01"><br><br></div>
                <div class="errorDate" style="display:none;"></div>
                <div class="errorHour" style="display:none;"></div>
            </div>
            <div>
                <label for="place" >Choisissez un lieu :</label>
                <select class="form-control" name="place" id="place" required>
                    <c:forEach items="${places}" var="item">
                        <option value="${item.id}">  ${item.name}<br></option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <br>
                <br>
                <button class="btn btn-primary mb-2" type="submit" id="submitButton">Ajouter l'activité</button>
            </div>
        </form>
        <br>
        <div><button type="submit" class="btn btn-primary mb-2" onclick="window.location.href='nouveauLieuServlet'">Ajouter un nouveau lieu</button></div>
        
        <br>
    </div>
	       		<div class="col-lg-4">
	       			<div class="row">
	       				<div class="col-lg-12">
							<div class="card row justify-content-between align-items-center " style ="box-shadow:none;border:none;background:none;">
								<div id="cal_here" style='width:250px;'></div>
							</div>
						</div>
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
	  		$("#pickup_country").PlacePicker({
	    		btnClass:"btn btn-xs btn-default",
	    		key:"AIzaSyAmBpYILZc2Ktp2Qw8rRBX_ur7_qOGiJEk",
	    		center: {lat: 48.66521389660117, lng: 6.161156884097942},
	    		success:function(data,address){
	    			//data contains address elements and
	    			//address conatins you searched text
	    			//Your logic here
	    			$("#pickup_country").val(data.formatted_address);
	    		}
	    	});
	  		
	  	};
	  	var btn = null
	  	function getBtn() {
	  		console.log("change btn");
	  		btn = document.getElementById("placePickerUIButton");
	  		return btn;
	  	}
	  	
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
		        "date",
		        "prev",
		        "today",
		        "next"
		    ];
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
		
			
			scheduler.form_blocks["my_editor"]={
				    render:function(sns){
				        return "<div class='dhx_cal_ltext'>"+
				        "<div id='placePickerUIButton' onclick='getBtn(); iconPicker();' type='button' title='Pick location from map' >"+

				        "<input name='locationInput' class='w-100' style='height:50px;' type='textarea' id='pickup_country' placeholder='Address'>"+
				        "<i class='fa fa-map' style='position:absolute;bottom:0.8rem;right:2rem;font-size:20px'></i>"+
				        "</div>"+
				        "</div>";
				    },
				    set_value:function(node,value,ev){
				    	console.log("Change view "+node.querySelector("[name='locationInput']").value);
				        node.querySelector("[name='locationInput']").value = ev.location||"";
				    },
				    get_value:function(node,ev){
				        ev.location = node.querySelector("[name='locationInput']").value;
				        console.log(ev.location);
				        return ev.location.value;
				    },
				    focus:function(node){
				        var input = node.querySelector("[name='locationInput']"); 
				        input.select(); 
				        input.focus(); 
				    }
				};
				 
			scheduler.locale.labels.section_description = "Details";
			scheduler.config.lightbox.sections=[    
				{ name:"description", height:50, map_to:"text", type:"textarea", focus:true },
			    { name:"location", height:50, width:50, map_to:"locationInput", type:"my_editor"  },
			    { name:"time", height:72, type:"time", map_to:"auto"}   
			];
			
			//scheduler.attachEvent("onBeforeViewChange", resetConfig);
			scheduler.config.map_inital_zoom = 8;
			
			scheduler.templates.quick_info_content = function(start, end, ev){ 
			       return ev.location;
			};
			scheduler.init('scheduler_here',new Date(2018,0,10),"week");
			//scheduler.init('scheduler_here', new Date(2019,5,1), "map");
			
			//scheduler.load("${pageContext.request.contextPath}/backend/map-events");

			//dp = new dataProcessor("${pageContext.request.contextPath}/backend/map-events");
			//dp.init(scheduler);
			//dp.setTransactionMode("REST", false);
			
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