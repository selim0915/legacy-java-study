var players = $("[data-player] > .video > div");
var playerYT = [].slice.call(players);
playerYT = new Array(playerYT.length);
function onYouTubeIframeAPIReady() {
	for (var i = 0; i < players.length; i++) {
		playerYT[i] = new YT.Player(players[i], {
			width : "250px",
			height : "375px",
			videoId : players[i].dataset.id,
			playerVars : {
				controls : "0",
				disablekb : "1",
				enablejsapi : "1",
				modestbranding : "1",
				showinfo : "0",
				rel : "0",
				cc_load_policy : "1",
				cc_lang_pref : "en"
			},
			events : {
				'onStateChange' : onPlayerStateChange
			}
		});
	}
}
function toggleYTClass(x) {
	$(
			'[data-player-id="' + x + '"]' + " .thumb, " + '[data-player-id="'
					+ x + '"]' + " .video").toggleClass("ytHide");
}
function onPlayerStateChange(event) {
	if (event.data == YT.PlayerState.ENDED) {
		toggleYTClass($(event.target.h).attr("id"));
	}
}
$(".thumb").click(function(event) {
	toggleYTClass($(this).parent().attr("data-player-id"));
	var click_i = $(".thumb").index(this);
	playerYT[click_i].playVideo();
});