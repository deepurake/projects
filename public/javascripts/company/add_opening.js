$.fn.fastSerialize = function() {
    //var a = [];
    var a=new Array();
    $('input,textarea,select', this).each(function() {
        var n = this.name;
        var t = this.type;

        if ( !n || this.disabled || t == 'reset' || t == 'hidden' ||
            (t == 'checkbox' || t == 'radio') && !this.checked ||
            (t == 'submit' || t == 'image' || t == 'button') && this.form.clicked != this ||
            this.tagName.toLowerCase() == 'select' && this.selectedIndex == -1)
            return;

        if (t == 'image' && this.form.clicked_x)
            return a.push(
                {name: n+'_x', value: this.form.clicked_x},
                {name: n+'_y', value: this.form.clicked_y}
            );

        if (t == 'select-multiple') {
            $('option:selected', this).each( function() {
                //a.push({name: n, value: this.value});
                 a[n]=this.value;
            });
            return;
        }

        //a.push({name: n, value: this.value});
        a[n]=this.value;
    });

    return a;
};
var $tabs;
jQuery(function($){

$("#contact_details2 input, #contact_details3 input").attr("disabled",true);
$("#eligibility_table tr:even").css('background-color','#DFF3FE');
$tabs = $("#tabs").tabs();

$tabs.bind('tabsselect', function(event,ui){
    var selectedTab = $tabs.tabs('option', 'selected');
    if(selectedTab==2 && ui.index==1)
        return true;
    return verifyCurrTab();    
});

//$tabs.data('disabled.tabs', [1, 2, 3, 4, 5]);

$('.continue_next').click(function (){
   if(verifyCurrTab()){
     var goToTab = $tabs.tabs('option', 'selected')+1;
     $tabs.tabs('select', goToTab);
   }
});

$('#more_contacts').click(function() {
  $('#less_contacts').attr("disabled",false);
  if($('#contact_details2').css("display")=="none"){
    $('#contact_details2').css("display","inline");
    $('#contact_details2 input').attr("disabled",false);
    return;
  }
  else{
    $('#contact_details3').css("display","inline");
    $('#contact_details3 input').attr("disabled",false);
    this.disabled=true;
    return;
  }
});

$('#less_contacts').click(function() {
  $('#more_contacts').attr("disabled",false);
  if($('#contact_details3').css("display")=="inline"){
    $('#contact_details3').css("display","none");
    $('#contact_details3 input').attr("disabled",true);
    return;
  }
  else{
    $('#contact_details2').css("display","none")
    $('#contact_details2 input').attr("disabled",true);
    this.disabled=true;
    return;
  }
});

$('.uncheckall').click(function(){
	$("." + this.id.substring(0, this.id.indexOf("_"))).attr("checked",false);
});

$('.checkall').click(function(){
	$("." + this.id.substring(0, this.id.indexOf("_"))).attr("checked",true);
});


$('#bond_yes').change(function(){
  $("#bond_details").attr("disabled",false);
});

$('#bond_no').change(function(){
  $("#bond_details").attr("disabled",true).css("border","");
});

$('#shortlist_yes').change(function(){
  $("#resume_criteria").attr("disabled",false);
});

$('#shortlist_no').change(function(){
  $("#resume_criteria").attr("disabled",true).css("border","");
});
$('#print_form').click(function(){
    var filleddata=$('#filled_form').html();
    var print_window=window.open("about:blank","Print_Job_Opening","width=800,height=600,scrollbars=1");
    print_window.document.write(filleddata);
    print_window.print();
});
$tabs.bind('tabsshow', function(){
        var goToTab = $tabs.tabs('option', 'selected')+1;
          
        //if(validateform()){
        if(goToTab==6) {
            eligibiltyToStr();
            var params=$('#job_opening').fastSerialize();
            params['opening[contact_details1][telephone]']=params['opening[contact_details1][telephone][0]']+params['opening[contact_details1][telephone][1]'];
            $("#filled_data_must td[id]").each(function() {
                var valueFilled=params[this.id.substring(4)];
                if(valueFilled==""){
                  $(this).html("<h6 style='color:red'>Not filled</h6>");
                }
                else if(valueFilled==null){
                    $(this).parent().remove();
                }
                else {
                  $(this).html(valueFilled);
                }
            });

            $("#filled_data_must .boolean").each(function(){
                if($(this).text()=="1") $(this).text("Yes");
                else $(this).text("No");
            });
            
            $("#filled_data_must .attachments").each(function(){
                if($(this).text().indexOf("<h6 s")==0) $(this).parent().remove();
            });
            
           //$("#val_packages").empty();
           $("#packages").clone().replaceAll( "#val_packages" ).attr("id","val_packages");
           $("#val_packages input[id]:disabled").parent().parent().remove();
           $("#val_packages input").each(function(){
                $(this).parent().text(this.value);
            });
           $("#val_packages tr").removeAttr("id");
            if(params["opening[contact_details2][name]"]!=null){
               $("#filled_contact_details2 td[id]").each(function() {
                  var valueFilled=params[this.id.substring(4)];
                  if(valueFilled==""){
                    $(this).html("<h6 style='color:red'>Not filled</h6>");
                  }
                  else {
                    $(this).html(valueFilled);
                  }
              });
              $("#filled_contact_details2").css("display","inline");
              if(params["opening[contact_details3][name]"]!=null){
                $("#filled_contact_details3 td[id]").each(function() {
                    var valueFilled=params[this.id.substring(4)];
                    if(valueFilled==""){
                      $(this).html("<h6 style='color:red'>Not filled</h6>");
                    }
                    else {
                      $(this).html(valueFilled);
                    }
                });
                $("#filled_contact_details3").css("display","inline");
              }
              else {
                $("#filled_contact_details3").css("display","none");
              }
            }
            else {
              $("#filled_contact_details2").css("display","none");
            }
            $("#filled_form").css("display","inline");

        }
        else if(goToTab==3)
            adjustpackages();
        return true;
    }
);
    $("#submitform").click(
        function submitform(){
            $("#job_opening").submit();
            return true;
        }
    );

}
);
function verifyCurrTab(){
      var goToTab = $tabs.tabs('option', 'selected')+1;
      if(goToTab==6) return true;
      if((goToTab==1 && verifytab1()) || (goToTab==2 && verifytab2()) ||(goToTab==3 && verifytab3()) ||(goToTab==4 && verifytab4()) ||(goToTab==5 && verifytab5())){
          //unhighlightTab($("#tab"+goToTab)[0]);
          $tabs.tabs('enable', goToTab);
        return true;
    }
    return false;
}
/*
      function highlightTab(x){
        if(x.innerHTML.length < 50) {
                x.style.color="#cd0a0a";
                x.innerHTML="<span class='ui-icon ui-icon-alert' style='float: left; margin-right: .3em;#cd0a0a'></span>"+x.innerHTML;
        }
      }
      function unhighlightTab(x){
        if(x.innerHTML.length > 50){
           x.style.color="";
           x.innerHTML=x.innerHTML.substring(85);
        }
      }

      function validateform(){
        var isvalid=true;
        var x = $("#tab1")[0];
        if(!verifytab1()){
           isvalid=false;
           highlightTab(x);
        }
        else {
          unhighlightTab(x)
        }


        x = $("#tab2")[0];
        if(!verifytab2()){
           isvalid=false;
           highlightTab(x);
        }
        else {
          unhighlightTab(x)
        }



        x = $("#tab3")[0];
        if(!verifytab3()){
           isvalid=false;
           highlightTab(x);
        }
        else {
          unhighlightTab(x)
        }

        x = $("#tab4")[0];
        if(!verifytab4()){
           isvalid=false;
           highlightTab(x);
        }
        else {
          unhighlightTab(x)
        }

        x = $("#tab5")[0];
        if(!verifytab5()){
           isvalid=false;
           highlightTab(x);
        }
        else {
          unhighlightTab(x)
        }
        return isvalid;
    }
*/
function adjustpackages(){
    var checkedProgs=new Array();
    checkedProgs["btech"]=isprog("btech");
    checkedProgs["mtech"]=isprog("mtech");
    checkedProgs["dual"]=isprog("dual");
    checkedProgs["mba"]=isprog("mba");
    checkedProgs["phd"]=isprog("phd");
    checkedProgs["mdes"]=isprog("mdes");
    checkedProgs["msci"]=isprog("msci");
    checkedProgs["msc2"]=isprog("msc2");
    $("#packages tr[id]").each( function(){
        var x=this.id;
        $("#"+x+" input").attr("disabled",!checkedProgs[x.substring(8)]);
    });
}

function isprog(prog){
  return ($("."+prog+":checked").length > 0);
}

function eligibiltyToStr()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
      {
      // code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
      }
    else if (window.ActiveXObject)
      {
      // code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    else
      {
      alert("Your browser does not support XMLHTTP!");
      }
    xmlhttp.onreadystatechange=function()
    {
    if(xmlhttp.readyState==4 && xmlhttp.status == 200)
      {
        $('#val_eligibility').html(xmlhttp.responseText);
      }
    }
    xmlhttp.open("POST","/eligibility_to_str",true);
    //Send the proper header information along with the request
    var eligibilty=$("#eligibility_table input,#job_opening div:first input").serialize();
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.setRequestHeader("Content-length", eligibilty.length);
    xmlhttp.setRequestHeader("Connection", "close");
    xmlhttp.send(eligibilty);
}

function addalerts(tabindex,alerts){
    var add_icon= "<p><span class='ui-icon ui-icon-alert' style='float: left; margin-right: .3em;'></span><strong>Alert: </strong>";
    var alert_msgs=$("#alert_msgs"+tabindex)[0];
    var content="";
    for(i=0;i<alerts.length;i++){
        content=content + add_icon + alerts[i] + "</p>";
    }
    alert_msgs.innerHTML=content;
    alert_msgs.style.display="block";
}

function removealerts(tabindex){
    var alert_msgs=$("#alert_msgs"+tabindex)[0];
    alert_msgs.innerHTML="";
    alert_msgs.style.display="none";
}
function verifytab1(){
 $("#job_profile textarea[value!="+"]").css("border","");
 var elems = $("#job_profile textarea[value="+"]").css("border","2px solid #cd0a0a");
 var isvalid=elems.length == 0;

if(!isvalid){
     var alerts= new Array();
     alerts[0]="Some * marked fields are not filled.";
     addalerts(1,alerts);
 }
 else {
    removealerts(1);
 }
 return isvalid;
}

function verifytab2(){
  var isvalid = $("#eligibility input:checked").length > 0;
 if(!isvalid){
     var alerts= new Array();
     alerts[0]="You haven't selected any checkbox";
     addalerts(2,alerts);
 }
 else {
    removealerts(2);
 }
 return isvalid;
}

function verifytab3() {
  $("#packages input").css("border","");
  var alerts= new Array();
  var isvalid=$("#packages input[disabled=false][value="+"]:not([name$='perks'])").css("border","2px solid #cd0a0a").length==0;
  if(!isvalid) alerts[0]="Package Information is not complete";
  var isvalidbond=$("#bond_details[value="+"]:enabled").css("border","2px solid #cd0a0a").length == 0;
  if(isvalidbond){
      $("#bond_details").css("border","");
    }
  else {
      alerts[alerts.length]="Bond details are not specified";
      isvalid=false;
  }
  var isvalidmedical = $("#medical_requirements[value="+"]").css("border","2px solid #cd0a0a").length == 0;
  if(isvalidmedical){
      $("#medical_requirements").css("border","");
  }
  else {
      alerts[alerts.length]="Medical requirements are not specified";
      isvalid=false;
  }
  if(!isvalid){
    addalerts(3,alerts);
  }
  else {
    removealerts(3);
  }
  return isvalid;
}
function verifytab4(){
var isvalid=true;
 var alerts = new Array();
 isvalid=$("#resume_criteria[value="+"]:enabled").css("border","2px solid #cd0a0a").length == 0;
 if(isvalid){
    removealerts(4);
    $("#resume_criteria").css("border","")

  }
  else {
    alerts[0]="Please specify criteria for shortlist on resumes";
    addalerts(4,alerts);
  }
 return isvalid;
}

function verifytab5(){
   $("#contact input[value!="+"]:text").css("border", "");
 var elems = $("#contact input[value="+"]:enabled:text").css("border", "2px solid #cd0a0a");
 var isvalid = elems.length == 0;
 var isemailvalid=true;
 var elems = $("#contact input[name$='email]']:enabled").each(function(){
     var email=this.value;
     apos=email.indexOf("@");
     dotpos=email.lastIndexOf(".");
     if (apos<1||dotpos-apos<2){
         $(this).css("border", "2px solid #cd0a0a");
         isemailvalid=false;
     }
});
 var alerts = new Array();
 if(!isvalid){
    alerts[0]="Contact information is not complete";    
  }
  if(!isemailvalid){
     alerts[alerts.length]="Some email addresses are not valid";     
  }
  if(!isvalid || !isemailvalid){
      addalerts(5,alerts);
  }
  else {
    removealerts(5);
  }
  return isvalid && isemailvalid;
}

