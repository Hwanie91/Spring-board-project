/***
*
*/
console.log("Reply module...");

var replyService = (function() {
	function add(reply, callback, error) {
		// reply : 댓글 객체
		// : 댓글 등록 후 수행할 메소드, 비동기
		console.log("add reply");
		
		$.ajax({
			type: 'post',
			url: '/commu/replies/new',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result) {
				if(callback) {
					callback(result);
				}
			},
			error: function(er) {
				if(error) {
					error(er);
				}
			}
		});
		
	}
	
	function getList(param, callback, error) {
		console.log("getList...");
		var bno = param.bno;
		var page = param.page || 1; // 페이지 번호가 있으면 페이지 번호 전달 없으면 1전달.
		
		$.getJSON("/commu/replies/pages/" + bno + "/" + page, 
					function(data) {
						if(callback) {
							callback(data);
						}
					}).fail(function(xhr, status, err) {
						if(error) {
							error(er);
						}
					});
		
	}
	
	function displayTime(timeValue) {
		var today = new Date(); // 현재 시간
		var gap = today.getTime() - timeValue; // 시간차이 연산
		var dateObj = new Date(timeValue); // 댓글이 등록된 시간을 변수에 할당
		var str = "";
		
		if(gap < (1000*60*60*24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9?'' : '0') + hh, ':', (mi > 9?'' : '0') + mi, ':', (ss > 9?'' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm > 9?'' : '0') + mm, '/', (dd > 9?'' : '0') + dd].join('');
		}
	}
	
	function get(rno, callback, error) {
		$.get("/commu/replies/" + rno, function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, er) {
			if(error) {
				error(er);
			}
		});
	}
	
	function update(reply, callback, error) {
		// reply : 댓글 객체
		// : 댓글 등록 후 수행할 메소드, 비동기
		console.log("rno : " + reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/commu/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			}
		});
	}
	
	function remove(rno, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/commu/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	return {
		add: add,
		getList: getList,
		displayTime: displayTime,
		get: get,
		update: update,
		remove: remove
	};	
})();