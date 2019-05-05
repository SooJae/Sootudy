<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
  <!-- /.content-wrapper -->
 
  <footer class="main-footer">
    <strong>Copyright &copy; 2019 Sootudy.</strong> All rights
    reserved.
  </footer>

</div>
<!-- ./wrapper -->


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
// Sidebar
$(document).ready(function(){
    $('#sidebarCollapse').on('click', function(){
        $('#sidebar').addClass('active');
        $('.overlay').fadeIn();
    });
    $('.overlay').on('click',function(){
        $('#sidebar').removeClass('active');
        $('.overlay').fadeOut();
    });
});

//Login 
$("#logout").on("click", function(e) {
	e.preventDefault();

	//$(this).remove();
	
	var str = '<form method="post" id="logoutSubmit" action="/customLogout">';
	str +='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></form>';
	$(this).html(str);
	$("#logoutSubmit").submit();
	
	//$(str).submit();

});
</script>

</body>
</html>