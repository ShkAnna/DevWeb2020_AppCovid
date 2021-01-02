<!-- navbar-->
	<header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a>
					<a href="dashboard-user" class="navbar-brand">
						<div class="brand-text d-none d-md-inline-block">
							<strong><span style="font-size:15px;">AppCovid</span></strong>
							<img class="im1" src="images/covid.png" width="40" height="40" style="margin-left: 0.5rem !important;">  
							<!-- <strong class="text-primary">Dashboard</strong> -->
						</div>
					</a>
				</div>
				<ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
					<!-- Add friend-->
					<li class="nav-item dropdown">
						<a id="friends" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">
							<i class="fa fa-user-plus" style="font-size:20px;"></i>
						</a>
						<ul aria-labelledby="notifications" class="dropdown-menu">
							<li>
								<form class="dropdown-item text-center" method="post" action="friends">
									<div class="form-row  justify-content-center" style="margin-bottom: 1rem !important;">
										<div class="notification-content">
										Entrez le pseudo de l'ami que vous souhaitez ajouter
										</div>
									</div>
									<div class="form-row justify-content-center" style="margin-bottom: 1rem !important;">
										<input type="text" class="form-control rounded-lg" id="login" name="login" placeholder="">
									</div>
									<div class="form-row justify-content-center">
										<button class="btn btn-primary rounded-lg" style="font-weight: bold;" type="submit">Ajouter</button>
									</div>
								</form>
							</li>
						</ul>
					</li>
					<!-- Notifications dropdown-->
					<li class="nav-item dropdown">
						<a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">
							<i class="fa fa-bell" style="font-size:20px;"></i>
							<span class="badge badge-warning">12</span>
						</a>
						<ul aria-labelledby="notifications" class="dropdown-menu">
							<li>
								<a rel="nofollow" href="#" class="dropdown-item"> 
									<div class="notification d-flex justify-content-between">
										<div class="notification-content">
											<i class="fa fa-envelope"></i>You have 6 new messages 
										</div>
										<div class="notification-time">
											<small>4 minutes ago</small>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a rel="nofollow" href="#" class="dropdown-item"> 
									<div class="notification d-flex justify-content-between">
										<div class="notification-content">
											<i class="fa fa-twitter"></i>You have 2 followers
										</div>
										<div class="notification-time">
											<small>4 minutes ago</small>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a rel="nofollow" href="#" class="dropdown-item"> 
									<div class="notification d-flex justify-content-between">
										<div class="notification-content">
											<i class="fa fa-upload"></i>Server Rebooted
										</div>
										<div class="notification-time">
											<small>4 minutes ago</small>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a rel="nofollow" href="#" class="dropdown-item"> 
								<div class="notification d-flex justify-content-between">
									<div class="notification-content">
										<i class="fa fa-twitter"></i>You have 2 followers
									</div>
									<div class="notification-time">
										<small>10 minutes ago</small>
									</div>
								</div>
								</a>
							</li>
							<li>
								<a rel="nofollow" href="#" class="dropdown-item all-notifications text-center">
								<strong><i class="fa fa-bell"></i>view all notifications</strong>
								</a>
							</li>
						</ul>
	                </li>
	                <!-- Log out-->
	                <li class="nav-item">
		                <a href="logout" class="nav-link logout">
			                <span class="d-none d-sm-inline-block" style="font-size:20px;">Logout</span>
			                <i class="fa fa-sign-out" style="font-size:20px;"></i>
	                	</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>