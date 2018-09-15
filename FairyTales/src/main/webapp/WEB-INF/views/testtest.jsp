<!DOCTYPE html>
<html lang="en" class="no-js demo-5">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>BookBlock: A Content Flip Plugin - Demo 5</title>
		<meta name="description" content="Bookblock: A Content Flip Plugin - Demo 5" />
		<meta name="keywords" content="javascript, jquery, plugin, css3, flip, page, 3d, booklet, book, perspective" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/default1.css" />
		<link rel="stylesheet" type="text/css" href="css/bookblock.css" />
		<!-- custom demo style -->
		<link rel="stylesheet" type="text/css" href="css/demo5.css" />
		<script src="js/modernizr.custom1.js"></script>
	</head>
	<body>
		<div class="container">
			<!-- Top Navigation -->
			<div class="main clearfix">
				<ul class="bb-custom-grid" id="bb-custom-grid">
					<li>
						<h3>Neonmob set</h3>
						<div class="bb-bookblock">
							<div class="bb-item"><a href="http://dribbble.com/shots/614568-Lands-Devil-Spirit-Jinx"><img src="images/1.png" alt="image01"/></a></div>
							<div class="bb-item"><a href="http://dribbble.com/shots/614264-Lands-Antspearer"><img src="images/2.png" alt="image02"/></a></div>
							<div class="bb-item"><a href="http://dribbble.com/shots/614153-Lands-Bonemonster"><img src="images/3.png" alt="image03"/></a></div>
							<div class="bb-item"><a href="http://dribbble.com/shots/614073-Lands-Boneater"><img src="images/4.png" alt="image04"/></a></div>
						</div>
						<nav>
							<span class="bb-current"></span>
							<span></span>
							<span></span>
							<span></span>
						</nav>
					</li>
				</ul>
			</div>
		</div><!-- /container -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/jquerypp.custom.js"></script>
		<script src="js/jquery.bookblock.js"></script>
		<script type="text/javascript">
			var Page = (function() {

				var $grid = $( '#bb-custom-grid' );

				return {
					init : function() {
						$grid.find( 'div.bb-bookblock' ).each( function( i ) {
							
							var $bookBlock = $( this ),
								$nav = $bookBlock.next().children( 'span' ),
								bb = $bookBlock.bookblock( {
									speed : 600,
									shadows : false
								} );
								
							// add navigation events
							$nav.each( function( i ) {
								$( this ).on( 'click touchstart', function( event ) {
									var $dot = $( this );
									$nav.removeClass( 'bb-current' );
									$dot.addClass( 'bb-current' );
									$bookBlock.bookblock( 'jump', i + 1 );
									return false;
								} );
							} );
							
							// add swipe events
							$bookBlock.children().on( {
								'swipeleft' : function( event ) {
									$bookBlock.bookblock( 'next' );
									return false;
								},
								'swiperight' : function( event ) {
									$bookBlock.bookblock( 'prev' );
									return false;
								}

							} );
							
						} );
					}
				};

			})();
		</script>
		<script>
				Page.init();
		</script>
	</body>
</html>