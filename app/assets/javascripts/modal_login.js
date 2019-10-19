$(document).ready(function(){
  $("a.sign_in").on("click", function(){ // show login form
    $('#log_in_modal').modal('show');
  });
  $("a.sign_up").on("click", function(){ // hide login form, show signup form
    $($(this).closest('.modal')).modal('hide');
    $('#signup_modal').modal('show');
  });
  $("a.forgot").on("click", function(){
    $($(this).closest('.modal')).modal('hide');
    $('#forgot_password').modal('show');
  });
  $("a.edit").on("click", function(){
    $('#u_edit_modal').modal('show')
  });
});
