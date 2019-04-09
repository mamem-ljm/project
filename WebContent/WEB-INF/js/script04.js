/**
 * 
 */

// BEAT MESSAGE
var wixBiSession = {
	initialTimestamp : Date.now(),
	requestId : (function(m) {
		return m ? m[1] : ''
	})(document.cookie.match(/requestId=([^;]*)/)),
	viewerSessionId : 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
			function(c) {
				var r = Math.random() * 16 | 0, v = c == 'x' ? r
						: (r & 0x3 | 0x8);
				return v.toString(16);
			}),
	initialRequestTimestamp : (function() {
		return performance.timeOrigin ? performance.timeOrigin : Date.now()
				- performance.now();
	})(),
	visitorId : publicModel.sessionInfo.visitorId

	,
	is_rollout : 0,
	is_platform_loaded : 1,
	dc : '208',
	renderType : 'bolt',
	wixBoltExclusionReason : '',
	wixBoltExclusionReasonMoreInfo : '',
	sendBeacon : /(\?|\&)suppressbi\=true(\&|$)/.test(location.search) ? function() {
	}
			: function(url) {
				var sent = false;
				try {
					sent = navigator.sendBeacon(url);
				} catch (e) {
				}
				if (!sent) {
					(new Image()).src = url;
				}
			},
	sendBeat : (function() {
		var caching, match = document.cookie
				.match(/ssr-caching="cache.desc=(\w+).(?:varnish=(\w+))?/);
		if (!match) {
			caching = 'none';
		} else if (!match[2]) {
			caching = match[1] + ',none';
		} else {
			caching = match.slice(1).join();
		}
		var isCached = caching.indexOf("hit") === 0;
		var beatUrl = 'https://frog.wix.com/bt?src=29&evid=3'
				+ '&v=1.2147.0'
				+ '&msid=83ca291c-e3f1-4264-b2cf-97129d9f21e1'
				+ '&isp=0'
				+ '&st=2'
				+ '&dc=208'
				+ '&iss=1'
				+ '&url='
				+ encodeURIComponent(location.href.replace(
						/^http(s)?:\/\/(www\.)?/, '')) + '&is_cached='
				+ isCached + '&caching=' + caching;
		var referrer = document.referrer;
		if (referrer) {
			beatUrl += '&ref=' + encodeURIComponent(referrer);
		}
		match = document.cookie.match(/_wixCIDX=([^;]*)/)
		if (match) {
			beatUrl += '&client_id=' + match[1];
		}
		return function(et, name, extra) {
			var tts = '';
			if (performance.now) {
				tts = '&tts=' + Math.round(performance.now());
			}
			if (name && performance.mark) {
				performance.mark(name + ' (beat ' + et + ')');
			}
			var ts = et === 1 ? 0 : Date.now() - wixBiSession.initialTimestamp;
			extra = extra || ''
			if (extra.indexOf('pn=') === -1) {
				extra = '&pn=1' + extra
			}
			wixBiSession.sendBeacon(beatUrl
					+ '&et='
					+ et
					+ (name ? '&event_name=' + encodeURIComponent(name) : '')
					+ '&ts='
					+ ts
					+ tts
					+ '&vsi='
					+ wixBiSession.viewerSessionId
					+ '&rid='
					+ wixBiSession.requestId
					+ '&viewer_name='
					+ encodeURIComponent(wixBiSession.renderType)
					+ '&is_rollout='
					+ wixBiSession.is_rollout
					+ (wixBiSession.visitorId ? '&vid='
							+ wixBiSession.visitorId : '')
					+ (wixBiSession.siteMemberId ? '&mid='
							+ wixBiSession.siteMemberId : '') + extra);
		}
	})()
};
wixBiSession.sendBeat(1, 'Init');
// BEAT MESSAGE END
