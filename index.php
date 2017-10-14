<?php
	include 'classes.inc';

	$dataHandler = new MyDataHandler();
	$data = $dataHandler->getPackagedData();
?>

<html>
<head>
	<title> PHP Project C0702741 </title>
	<link rel="stylesheet" type="text/css" href="./mystyle.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./myscript.js"></script>
<body>
	<div class="container">
		<div class="row">
			<div class="col header">
				<div class="row">
					<div class="col-md-10">
						<?php echo $data['top'][0]['fname'] . ' ' . $data['top'][0]['lname']; ?>
					</div>
					<div class="col-md-2">
						 <a class="btn btn-info width-80" href="./leave_a_message.html">
							<span class="glyphicon glyphicons-note"> </span>
							<span> Leave a message</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- Personal Data -->
			<div class ="col-md-3 scroll">
				
				<div style="height: 2%"></div>
				<div class="row">
					<div class="col">
						<div class="text-center">
						<img class="img-circle image" src= <?php echo $data['left'][0]['picture_url']; ?> alt="Profile Pic">
						</div>
					</div>
				</div>
				
				<div style="height: 2%"></div>
				<div class="row">
					<div class="text-center">
						<a class="btn btn-info width-80" href="tel:1-647-773-2820">
							<span class="glyphicon glyphicon-earphone"> </span>
							<span> <?php echo $data['left'][0]['phone']; ?> </span>
						</a>
					</div>
				</div>
				
				<div style="height: 2%"></div>
				<div class="row">
					<div class="text-center">
						<a class="btn btn-info width-80" href="mailto:deepeshhmehta@gmail.com">
							<span class="glyphicon glyphicon-envelope"> </span>
							<span> <?php echo $data['left'][0]['email']; ?> </span>
						</a>
					</div>
				</div>

				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<h5 class="border-bottom">About</h5>
						<p><?php echo $data['left'][0]['description']; ?></p>
						<p><?php echo $data['left'][0]['description2']; ?>
						</p>
					</div>
				</div>

				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<h5 class="border-bottom">Where to find me</h5>
						<p><?php echo $data['left'][0]['address']; ?></p>
					</div>
				</div>
				
			</div>

			<!-- Professional Data -->
			<div class ="col-md-8 col-md-offset-1 scroll">
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-xs-2" id="collapseAll">Collapse All</div>
					<div class="col-xs-2 col-xs-offset-8" id="expandAll">Expand All</div>
				</div>
				<!-- work -->
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<div class="switch" id="workToggle">Work <span class="glyphicon glyphicon-chevron-right"></span></div>
						<div id="workDetails" class="data">
							<table>
								<tr>
									<td>
										<a href="http://www.arth.tech" target="_blank"><p class="title">1Health Integrated Services</p></a>
									</td>
									<td>
										<p class="description"> (Application Developer) </p>
									</td>
									<td>
										<p class ="duration"> Sept 2016 - March 2017</p>
									</td>
								</tr>
								<tr>
									<td>
										<a href="http://www.hphsystems.com" target="_blank"><p class="title">HPHSYSTEMS</p></a>
									</td>
									<td>
										<p class="description"> (Jr.Developer) </p>
									</td>
									<td>
										<p class ="duration"> June 2016 - Aug 2016</p>
									</td>
								</tr>
								<tr>
									<td>
										<a href="#"><p class="title">Amygo Productions</p></a>
									</td>
									<td>
										<p class="description"> (Technical Director)) </p>
									</td>
									<td>
										<p class ="duration"> April 2014 - Aug 2016</p>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<!-- skillset -->
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<div class="switch" id="skillsToggle">Skills <span class="glyphicon glyphicon-chevron-right"></span></div>
						<div id="skillsDetails" class="data">
							<table>
								<tr>
									<td>
										<ul>
											<li><p class="description">PHP (Laravel  Ionic)</p></li>
											<li><p class="description">SQL</p></li>
											<li><p class="description">HTML and CSS</p></li>
										</ul>
										
									</td>
									<td>
										<ul>
											<li><p class="description">AngularJS</p></li>
											<li><p class="description">Android</p></li>
											<li><p class="description">iOS</p></li>
										</ul>
									</td>
								</tr>
							</table>
							
						</div>
					</div>
				</div>

				<!-- Education -->
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<div class="switch" id="educationToggle">Education <span class="glyphicon glyphicon-chevron-right"></span></div>
						<div id="educationDetails" class="data">
							<table>
								<tr>
									<td>
										<a href="https://www.lambtoncollege.ca/" target="_blank"><p class="title">Lambton College (Toronto)</p></a>
									</td>
									<td>
										<p class="description">MADT</p>
									</td>
									<td>
										<p class ="duration"> May 2017 - Jan 2019</p>
									</td>
								</tr>
								<tr>
									<td>
										<a href="http://mu.ac.in/portal/" target="_blank"><p class="title">Mumbai University</p></a>
									</td>
									<td>
										<p class="description"> BSc.IT </p>
									</td>
									<td>
										<p class ="duration"> July 2013 - March 2016</p>
									</td>
								</tr>
								<tr>
									<td>
										<a href="http://www.bcswest.org/" target="_blank"><p class="title">Bombay Cambridge School</p></a>
									</td>
									<td>
										<p class="description"> Secondary </p>
									</td>
									<td>
										<p class ="duration"> July 1999 - March 2011</p>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<!-- strengths -->
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<div class="switch" id="strengthToggle">Strengths <span class="glyphicon glyphicon-chevron-right"></span></div>
						<div id="strengthDetails" class="data">
							<table>
								<tr>
									<td>
										<ul>
											<li><p class="description">Confident Speaker</p></li>
											<li><p class="description">Quick Learner</p></li>
											<li><p class="description">Ability to analyze the problem</p></li>
											<li><p class="description">Multi tasker</p></li>
										</ul>
										
									</td>
									<td>
										<ul>
											<li><p class="description">Efficient solutions</p></li>
											<li><p class="description">Lazy (can find the easiest and simplest way out)</p></li>
											<li><p class="description">Calm Mind</p></li>
											<li><p class="description">Team Player</p></li>
										</ul>
									</td>
								</tr>
							</table>
							
						</div>
					</div>
				</div>

				<!-- Media Made by me -->
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-12 text-justify">
						<div class="switch" id="mediaToggle">Media Made By Me <span class="glyphicon glyphicon-chevron-right"></span></div>
						<div id="mediaDetails" class="data">
							<div class="row">
								<div align="center" class="embed-responsive embed-responsive-16by9">
								    <video autoplay loop class="embed-responsive-item" controls muted>
									  <source src="./myvideo.mp4" type="video/mp4">
									  Your browser does not support the video tag.
									</video>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>