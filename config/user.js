
// Performance & Privacy Hardening user.js for Low-End Hardware
user_pref('browser.send_pings', false);
user_pref('browser.urlbar.speculativeConnect.enabled', false);
user_pref('dom.event.clipboardevents.enabled', false);
user_pref('network.dns.disablePrefetch', true);
user_pref('network.prefetch-next', false);
user_pref('privacy.trackingprotection.enabled', true);
user_pref('geo.enabled', false);
user_pref('media.peerconnection.enabled', false);

// Performance Optimizations
user_pref('toolkit.cosmeticAnimations.enabled', false); // Disable UI animations
user_pref('browser.tabs.animate', false); // Disable tab animations
user_pref('browser.download.animateNotifications', false);
user_pref('layers.acceleration.disabled', true); // Disable hardware acceleration if no GPU
user_pref('browser.sessionstore.interval', 600000); // Save session less frequently (every 10m)
user_pref('browser.newtabpage.activity-stream.feeds.telemetry', false);
user_pref('browser.newtabpage.activity-stream.telemetry', false);
user_pref('intl.accept_languages', 'zh-CN, zh, en-US, en');

