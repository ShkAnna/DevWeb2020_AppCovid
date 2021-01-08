
    
    <!-- JavaScript files-->
    
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="${pageContext.request.contextPath}/resources/js/front.js"></script>
    <!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery.coronatracker/jquery-3.4.1.min.js" charset="utf-8"></script> -->
    <script src="${pageContext.request.contextPath}/resources/jquery.coronatracker/js/jquery.coronatracker.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery.coronatracker/jquery-jvectormap-2.0.5/jquery-jvectormap-2.0.5.min.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery.coronatracker/jquery-jvectormap-2.0.5/jquery-jvectormap-world-mill-en.js" charset="utf-8"></script>
  	
  	<script src="${pageContext.request.contextPath}/resources/codebase/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/codebase/ext/dhtmlxscheduler_minical.js" type="text/javascript" charset="utf-8"></script>
   	<script src="${pageContext.request.contextPath}/resources/codebase/ext/dhtmlxscheduler_container_autoresize.js"></script>
   	<script src="${pageContext.request.contextPath}/resources/codebase/ext/dhtmlxscheduler_agenda_view.js" ></script>
   	<!-- use your own Google API key
	<script src="//maps.google.com/maps/api/js?key=AIzaSyBpxf_sy28gn2hTK1qG6pkk5gbNZLHUaGo&sensor=false" type="text/javascript"></script>`
	<script src="${pageContext.request.contextPath}/resources/codebase/ext/dhtmlxscheduler_map_view.js"></script>
   	-->
   	<script src="//maps.google.com/maps/api/js?key=AIzaSyAmBpYILZc2Ktp2Qw8rRBX_ur7_qOGiJEk" type="text/javascript"></script>
	
 	<script src="${pageContext.request.contextPath}/resources/codebase/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/codebase/ext/dhtmlxscheduler_map_view.js" type="text/javascript" charset="utf-8"></script>
	
  <script type="text/javascript">
  
	  	$('#modalDeleteUser').on('show.bs.modal', function (event) {
	  	  var button = $(event.relatedTarget); // Button that triggered the modal
	  	  var user = button.data('username'); // Extract info from data-* attributes
	  	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  	  //modal.find('.modal-title').text('New message to ' + user);
	  	  $(this).find('.modal-username').text(user);
	  	})
	  	
	  	$('#modalAddUser').on('show.bs.modal', function (event) {
	  	  //var button = $(event.relatedTarget); // Button that triggered the modal
	  	  //var user = button.data('username'); // Extract info from data-* attributes
	  	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  	  //modal.find('.modal-title').text('New message to ' + user);
	  	  //$(this).find('.modal-username').text(user);
	  	})
  	
		window.alert = function(){};
	    var defaultCSS = document.getElementById('bootstrap-css');
	    function changeCSS(css){
	        if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
	        else $('head > link').filter(':first').replaceWith(defaultCSS); 
	    }
	    
	    $(document).ready(function() {
	      var iframe_height = parseInt($('html').height()); 
	      window.parent.postMessage( iframe_height, '/');
	    });

	    /*var State_Id = document.getElementById('stateNotif);
	    if(malade) {
		    State_Id.innerHTML = "Malade";
		    State_Id.classList.remove("stateNotSick");
		    State_Id.classList.add("stateSick");
	    } else {
		    State_Id.innerHTML = "Pas malade";
		    State_Id.classList.remove("stateSick");
		    State_Id.classList.add("stateNotSick");
	    }*/
	    
        $("#corona_container_tab").coronaTracker({
            type:"table"
     	}).initialize();
        $("#corona_container").coronaTracker({
            area:"all",
            type:"map"
     	}).initialize();
	    
        function changeAppState() {
            var Image_Id = document.getElementById('appStateImg');
            var Txt_Id = document.getElementById('appStateTxt');
            var Btn_Id = document.getElementById('appStateBtn');
          
            if (Image_Id.src.match("${pageContext.request.contextPath}/images/appOff.png")) {
                Image_Id.src = "${pageContext.request.contextPath}/images/appOn.png";
                Txt_Id.classList.remove("appOff");
                Txt_Id.classList.add("appOn");
                Txt_Id.innerHTML = "Votre application est activé";
                Btn_Id.innerHTML = "Desactiver";
                Btn_Id.classList.remove("btn-primary");
                Btn_Id.classList.add("btn-danger");
            }
            else {
                Image_Id.src = "${pageContext.request.contextPath}/images/appOff.png";
                Txt_Id.classList.remove("appOn");
                Txt_Id.classList.add("appOff");
                Txt_Id.innerHTML = "Votre application n'est pas activé";
                Btn_Id.innerHTML = "Activer";
                Btn_Id.classList.remove("btn-danger");
                Btn_Id.classList.add("btn-primary");
            }
        }
       
    </script>