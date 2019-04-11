/**
 * 
 */

(function(x, e, o, s, n) {
	var a = window.fedops || {};
	a.apps = a.apps || {};
	a.apps[x] = {
		startLoadTime : e && e.now && e.now()
	};
	try {
		a.sessionId = o.getItem("fedops.logger.sessionId")
	} catch (x) {
	}
	a.sessionId = a.sessionId || window.wixBiSession.viewerSessionId;
	window.fedops = a;
	var d = "//frog.wix.com/bolt-performance?appName=" + x
			+ "&src=72&evid=21&session_id=" + a.sessionId + "&_=" + s();
	if (!!n && !!n.sendBeacon) {
		n.sendBeacon(d)
	} else {
		(new Image).src = d
	}
})('bolt-viewer', window.performance, window.localStorage, Math.random,
		window.navigator);



var santaBase = 'https://static.parastorage.com/services/santa/1.6908.1';
var boltBase = 'https://static.parastorage.com/services/wix-bolt/1.2147.0';



var requirejs = {
  onNodeCreated: function(node) {
    var src = node.getAttribute('src');
    var shouldIgnore = ['googletagmanager.com', 'google-analytics.com', 'googleadservices.com', 'doubleclick.net', 'connect.facebook.net'].some(function (domain) {
        return src.indexOf(domain) !== -1;
    });
    if (!shouldIgnore) {
        node.setAttribute('crossorigin', 'anonymous')
    }
  }
}


window.messageBuffer = [];
window.messageHandler = function(event) {messageBuffer.push(event)};
window.addEventListener('message', window.messageHandler, false);


