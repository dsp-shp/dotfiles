// ==UserScript==
// @name A/V permissions for everything
// @match https*://*
// @run-at document-start
// ==/UserScript==

navigator.mediaDevices.getUserMedia({ video: true, audio: true });
navigator.geolocation.getCurrentPosition(true, false);
