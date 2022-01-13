<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Contact</title>
<link rel="stylesheet" type="text/css" href="Contact.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/Project2/bootstrap/js/jquery.js"></script>
<script src="/Project2/bootstrap/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/Project2/CSSfile/Contact.css"
	type="text/css">

<script>  
    $(document).ready(function(){
      var i= 0,j=0;
      var check = false;
      var interval; 
      var window_height = $(window).height();
      var menu = $("#menu"); 

      var temp_height = 0;
      var set_animation = false;
      var check_about = true;
      var one = true,two = true, three = true, four = true,five = true, six = true, seven = true, eight = true, nine = true, ten = true,
      eleven = true, twelve = true, thirteen = true; 
      var count = 0;
      
      
		$("#form").submit(function(e) {

			var name = $("#name").val();
			var gmail = $("#gmail-input").val(); 
			var comment = $("#input-comment").val();

			if (name == '' || gmail == '' || comment == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});


      contact_animation();
      execute();
        function contact_animation(){

          $("#contact-heading").css({'left' : function(){return  -$("#contact-heading").width();}});
          $("#contact-heading").animate({left: ($(window).width() - $("#contact-heading").width())/2 },500);

          $("#contact-sub-heading").css({'right' : function(){return  -$("#contact-sub-heading").width();}});
          $("#contact-sub-heading").animate({right: ($(window).width() - $("#contact-sub-heading").width())/2 },500);
          
          $("#address").css({'left' : function(){return  -$("#address").width();}});
          $("#address").animate({left: parseInt($(window).width()*19 / 100) - $("#address").width()/2},500);

          $("#email").css({'right' : function(){return  -$("#email").width();}});
          $("#email").animate({right: parseInt($(window).width()*22 / 100) - $("#email").width()/2},500);  //

          $("#Phone").css({'top' : function(){return  200;}});
          $("#Phone").animate({top : 0},500);
        }


      function execute(){
         height = $("#contact-heading").height() + $("#contact-heading").offset().top - $("#contact").offset().top;  
        $("#contact-sub-heading").css({'top' : function(){ return height + 20;}  }); //#contact-sometext
        $("#contact-sometext").css({'top' : function(){ return  $("#contact-sub-heading").height() + $("#contact-sub-heading").offset().top - $("#contact").offset().top + 80  ;}  });
        
        var top_of_object = $("#contact-sub-heading").offset().top; 
        var bottom_of_one = $("#contact-sometext").offset().top + $("#contact-sometext").height() + 120 ;
        temp_height = $("#contact-sometext").height() + $("#contact-sometext").offset().top - $("#contact").offset().top;

       
        $(window).resize(function(){
          $("#contact-heading").css({'left' : function(){return  ($(window).width() - $("#contact-heading").width())/2;}});
          $("#contact-sub-heading").css({'right' : function(){return  ($(window).width() - $("#contact-sub-heading").width())/2;}});
        });
      }


        $(window).resize(function(){
          $("#contact-heading").css({'left' : function(){return  ($(window).width() - $("#contact-heading").width())/2;}});
          $("#contact-sub-heading").css({'right' : function(){return  ($(window).width() - $("#contact-sub-heading").width())/2;}});
        });
         


        $("#test").css({'width' :  (parseInt($(window).width()*22 / 100) - $("#email").width()/2)});


        var left = parseInt($(window).width()*19 / 100) - $("#address").width()/2;
        var right = (parseInt($(window).width()*22 / 100) - $("#email").width()/2);
        var wid = $(window).width() - (left + right);
/*        $("#comment").css({'top' : temp_height + 70,
                           'margin-left' : left,
                           'margin-right' :  right,
                            'width' : wid});
        $("#submit").css({'top' : temp_height + $("#comment").height() + 70 + 40,
                          'right' :  right});*/



    });
  </script>
</head>




<body>

	<jsp:include page="/HeaderContent.jsp" />
	<div id="contact">

		<div id="contact-heading">Contact us</div>
		<div id="contact-sub-heading">HOW WE CAN BE REACHED?</div>

		<div id="contact-sometext">

			<div id="test"></div>

			<div id="address">
				<div style="margin-bottom: 18px;">Address</div>
				<div>
					BSMRSTU <br> Gobra <br> Gopalganj, Bangladesh
				</div>
			</div>

			<div id="Phone">
				<div style="margin-bottom: 18px;">Phone</div>
				<div>
					Support: +8801911013641 (9am-5pm) <br> Authority :
					+8801678054090 (9am-5pm)
				</div>
			</div>

			<div id="email">
				<div style="margin-bottom: 18px;">Email</div>
				<div>
					Contact: contact@bsmrstucse.com <br> Support:
					support@bsmrstu.net
				</div>
			</div>

		</div>

	</div>

	<form action="ContactSubmit" id="form" method="post">
		<div id="comment">
			<div id="comment-part1"
				style="float: left; width: 48%; height: 100%; background: url("/Project2/image/background.png");">
				<textarea id="name" style="padding: 15px; margin-bottom: 20px"
					type="text" name="name" value="" placeholder="Your Name *"></textarea>
				<!-- <div style="width: 100%; height: 10%; background-color: white;"></div>  -->
				<textarea id="gmail-input" style="padding: 15px;" name="gmail" value=""
					placeholder="Your Email *"></textarea>
			</div>


			<div id="comment-part2"
				style="float: right; width: 48%; height: 100%; background-color: white;">
				<textarea id="input-comment"
					style="width: 100%; height: 100%; padding: 15px;" type="text"
					name="comment" value="" placeholder="Comment *"></textarea>
			</div>
		</div>

		<div id="submit">
			<button type="submit">Submit</button>
		</div>
	</form>


	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>