

function jslide(){}

function repWrite(mem_no){
	var repData = $('[name=memReplyWriteForm]').serialize();
	$.ajax({
		type:"post",
		url:'rep_write.do',
		data:repData,
		success: function(data){
			if(data>0){
				repList(mem_no);
				$('[name=reply_cont]').val('');
			}else{
				alert('내용을 입력해주세요.');
			}
		}
	});
}
function repDelete(rep_no, mem_no){
	$.ajax({
		type:"post",
		url:"rep_delete.do",
		data:{"rep_no":rep_no},
		success: function(data){
			repList(mem_no);
		}
	});
}
function repEditOk(rep_no, mem_no){
	$.ajax({
		type:"post",
		url:"rep_edit.do",
		data:{"rep_no":rep_no,"rep_cont":$('[name=reply_cont_edit]').val()},/* dto데이터 넘어가게 */
		success: function(data){
			repList(mem_no);
		}
	});
}
function repEditMode(rep_no, mem_no){
	var html='';
	var repContainer = $('.rep_container');
	$.ajax({
		type: "post",
		url:"rep_list.do",
		data:{"lec_no_fk":$('[name=lec_no_fk]').val()},
		success: function(data){
			if(data.length>0){
				$.each(data,function(id,value){
				  if(value.reply_group == value.reply_no){
					html += '<div class="rep">';
					html += '<div><div>';
					if(value.member_state == -1){
						html += '<span class="mem_name">(탈퇴한 회원입니다.)</span>';
					}else{
						html += '<span class="mem_name">'+value.mem_name+'</span>';
					}
					html += '<span class="date">'+value.reply_date+'</span>';
					html += '</div>';
					if(value.reply_step == -1){
						html += '<span class="delete_cont">'+value.reply_cont+'</span>';
					}else{
						if(value.reply_no == rep_no){
							html +='<input type="text" name="reply_cont_edit" value="'+value.reply_cont+'" class="reply_input" autofocus>';
						}else{
							html += '<span class="rep_cont">'+value.reply_cont+'</span>';
						}
					}
					
					if(value.mem_no_fk == mem_no && value.reply_no==rep_no){/* 로그인한 유저넘버,댓글넘버가 같으면 완료,취소버튼 나타나게 */
						html += '<button class="cancel_btn" onclick="repList('+mem_no+')">취소</button>';
						html += '<button class="ok_btn" onclick="repEditOk('+value.reply_no+')">완료</button>';
					}
					html += '</div>';
					html += reReplyEdit(value.reply_no, rep_no, mem_no);
					html += '<div class="re_rep_write">';
					html += '<img src="resources/img/re_reply.png">';
					html += '<input type="text" name="re_reply_cont'+value.reply_no+'" class="reply_input" placeholder="답글 내용을 입력하세요.">';//대댓글cont
					html += '<input type="button" value="작성" onclick="reRepWrite('+value.reply_no+','+mem_no+','+value.lec_no_fk+')" class="write_btn">';/*  */
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '<hr class="rep_hr">';
				  }
				});
				repContainer.html(html);
			}
		}
	});
}
function repList(mem_no){
	var html='';
	var repContainer = $('.rep_container');
	var mem_no_fk = $('[name=mem_no_fk]').val();
	$.ajax({
		ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
		type: "post",
		url:'rep_list.do',
		data:{'lec_no_fk':$('[name=lec_no_fk]').val()},
		success: function(data){
			if(data.length>0){
				$.each(data,function(id,value){
				  if(value.reply_group == value.reply_no){
					html += '<div class="rep"><div>';
					html += '<div>';
					if(value.member_state == -1){
						html += '<span class="mem_name">(탈퇴한 회원입니다.)</span>';
					}else{
						html += '<span class="mem_name">'+value.mem_name+'</span>';
					}
					html += '<span class="date">'+value.reply_date+'</span>';
					if(value.mem_no_fk == mem_no && value.reply_step == 0){/* 로그인한 유저넘버와 같으면 삭제버튼 나타나게 */
						html += '<button class="delete_btn" onclick="repDelete('+value.reply_no+','+mem_no+')">삭제</button>';
						html += '<button class="edit_btn" onclick="repEditMode('+value.reply_no+','+mem_no+')">수정</button>';}
					html += '</div>';
					if(value.reply_step == -1){
						html += '<span class="delete_cont">'+value.reply_cont+'</span>';
					}else{
						html += '<span class="rep_cont">'+value.reply_cont+'</span>';
					}
					html += '</div>';
					html += reReplyList(value.reply_no, mem_no);//대댓글 불러오기
					html += '<div class="re_rep_write">';
					html += '<img src="resources/img/re_reply.png">';
					html += '<input type="text" name="re_reply_cont'+value.reply_no+'" class="reply_input" placeholder="답글 내용을 입력하세요.">';//대댓글cont
					html += '<input type="button" value="작성" onclick="reRepWrite('+value.reply_no+','+mem_no+','+value.lec_no_fk+')" class="write_btn">';/*  */
					html += '</div>';
					html += '</div>';
					html += '<hr class="rep_hr">';
				  }
				});
				repContainer.html(html);
			}
		}
	});
}
function reReplyList(rep_no,mem_no){
	var list='';
	$.ajax({
		type:"post",
		url:"re_rep_list.do",
		async: false, 
		data:{"rep_no":rep_no, "lec_no":$("[name=lec_no_fk]").val()},
		success: function(data){
			if(data.length>0){
			$.each(data,function(id,value){
			  if(value.reply_no!=value.reply_group){
				list += '<hr class="re_rep_hr">';
				list += '<div class="re_rep">';
				list += '<div class="l_block"><img src="resources/img/re_reply.png"></div>';
				list += '<div style="width:95%;" class="r_block">';
				list += '<div>';
				if(value.member_state == -1){
					list += '<span class="mem_name">(탈퇴한 회원입니다.)</span>';
				}else{
					list += '<span class="mem_name">'+value.mem_name+'</span>';
				}
				list += '<span class="date">'+value.reply_date+'</span>';
				if(value.mem_no_fk == mem_no && value.reply_step == 1){/* 로그인한 유저넘버와 같으면 버튼 나타나게 */
					list += '<button class="delete_btn" onclick="repDelete('+value.reply_no+','+mem_no+')">삭제</button>';
					list += '<button class="edit_btn" onclick="repEditMode('+value.reply_no+','+mem_no+')">수정</button>';
				}
				list += '</div>';
				if(value.reply_step == -1){
					list += '<span class="delete_cont">'+value.reply_cont+'</span>';
				}else{
					list += '<span class="rep_cont">'+value.reply_cont+'</span>';
				}
				list += '</div>';
				list += '</div>';
			  }
			});
			}
		}
	});
	return list;
}
function reRepEditOk(rep_no, mem_no){
	$.ajax({
		type:"post",
		url:"rep_edit.do",
		data:{"rep_no":rep_no,"rep_cont":$('[name=re_reply_cont_edit]').val()},/* dto데이터 넘어가게 */
		success: function(data){
			repList(mem_no);
		}
	});
}
function reReplyEdit(rep_no,re_rep_no,mem_no){
	var list='';
	$.ajax({
		type:"post",
		url:"re_rep_list.do",
		async: false, 
		data:{"rep_no":rep_no, "lec_no":$("[name=lec_no_fk]").val()},
		success: function(data){
			if(data.length>0){
			$.each(data,function(id,value){
			  if(value.reply_group != value.reply_no){
				list += '<hr class="re_rep_hr">';
				list += '<div class="re_rep">';
				list += '<div class="l_block"><img src="resources/img/re_reply.png"></div>';
				list += '<div style="width:95%;" class="r_block">';
				list += '<div>';
				if(value.member_state == -1){
					list += '<span class="mem_name">(탈퇴한 회원입니다.)</span>';
				}else{
					list += '<span class="mem_name">'+value.mem_name+'</span>';
				}
				list += '<span class="date">'+value.reply_date+'</span>';
				list += '</div>';
				
				if(value.reply_step == -1){
					list += '<span class="delete_cont">'+value.reply_cont+'</span>';
				}else{
					if(value.reply_no == re_rep_no){
						list += '<input type="test" name="re_reply_cont_edit" value="'+value.reply_cont+'" class="reply_input">';
						list += '<button class="cancel_btn" onclick="repList('+mem_no+')">취소</button>';
						list += '<button class="ok_btn" onclick="reRepEditOk('+value.reply_no+','+mem_no+')">완료</button>';
					}else{
						list += '<span class="rep_cont">'+value.reply_cont+'</span>';
					}
				}
				list += '</div>';
				list += '</div>';
			  }
			});
			}
		}
	});
	return list;
}
function reRepWrite(rep_no, mem_no, lec_no){
	var repCont = $('[name=re_reply_cont'+rep_no+']').val();
	var memName = $('[name=mem_name]').val();
	$.ajax({
		type:"post",
		url:'re_rep_write.do',
		data:{"reply_cont":repCont,"reply_no":rep_no, "lec_no_fk":lec_no,"mem_no_fk":mem_no,"mem_name":memName},
		success: function(data){
			if(data>0){
				repList(mem_no);
			}else{
				alert('내용을 입력해주세요.');
			}
		}
	});
}

	$(function() {
		var count = 0;
		var comu_count = $("#comu_container>div").children(".comu_cont").length;
		var comu_slide = $("#comu_container>div");
		
		var slide_width = (100 * comu_count) + "%";
		$("#comu_container>div").css("width", slide_width);
		
		var width = 100/comu_count+"%";
		$(".comu_cont").css("width",width);
		
		var no = 0;
		
		$("#prev").click(function(){
			prevSlide();
		});
		$("#next").click(function(){
			nextSlide();
		});
		
		function slide(n){
			var current = n*-100+"%";
			var dots = $("#community .dot");
			if(n<0){
				no = comu_count-1;
				comu_slide.animate({left:no*-100+"%"},500);
				dots.css({"background-color":"skyblue","width":"8px"});
				$("#community .dot:nth-child("+comu_count+")").css({"background-color":"rgb(0,116,255)","width":"20px"});
			}else if(n>=comu_count){
				no = 0;
				comu_slide.animate({left:"0px"},500);
				dots.css({"background-color":"skyblue","width":"8px"});
				$("#community .dot:nth-child("+1+")").css({"background-color":"rgb(0,116,255)","width":"20px"});
			}else{
				no = n;
				comu_slide.animate({left:current},500);
				dots.css({"background-color":"skyblue","width":"8px"});
				$("#community .dot:nth-child("+(n+1)+")").css({"background-color":"rgb(0,116,255)","width":"20px"});
			}
		}
		jslide = slide;
		function nextSlide(){
			slide(no+1);
		}
		function prevSlide(){
			slide(no-1);
		}
		//10초 마다 다음 커뮤니티로 넘어가도록
		setInterval(nextSlide,10000);
	});