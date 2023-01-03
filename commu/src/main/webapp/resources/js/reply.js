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
	return {
		add: add
	};	
})();