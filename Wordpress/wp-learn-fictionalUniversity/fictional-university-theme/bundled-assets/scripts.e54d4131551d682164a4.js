!function(e){function t(t){for(var r,o,l=t[0],a=t[1],c=t[2],u=0,p=[];u<l.length;u++)o=l[u],Object.prototype.hasOwnProperty.call(i,o)&&i[o]&&p.push(i[o][0]),i[o]=0;for(r in a)Object.prototype.hasOwnProperty.call(a,r)&&(e[r]=a[r]);for(h&&h(t);p.length;)p.shift()();return n.push.apply(n,c||[]),s()}function s(){for(var e,t=0;t<n.length;t++){for(var s=n[t],r=!0,l=1;l<s.length;l++){var a=s[l];0!==i[a]&&(r=!1)}r&&(n.splice(t--,1),e=o(o.s=s[0]))}return e}var r={},i={0:0},n=[];function o(t){if(r[t])return r[t].exports;var s=r[t]={i:t,l:!1,exports:{}};return e[t].call(s.exports,s,s.exports,o),s.l=!0,s.exports}o.m=e,o.c=r,o.d=function(e,t,s){o.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:s})},o.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},o.t=function(e,t){if(1&t&&(e=o(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var s=Object.create(null);if(o.r(s),Object.defineProperty(s,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)o.d(s,r,function(t){return e[t]}.bind(null,r));return s},o.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return o.d(t,"a",t),t},o.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},o.p="/wp-content/themes/fictional-university-theme/bundled-assets/";var l=window.webpackJsonp=window.webpackJsonp||[],a=l.push.bind(l);l.push=t,l=l.slice();for(var c=0;c<l.length;c++)t(l[c]);var h=a;n.push([2,1]),s()}([,function(e,t,s){},function(e,t,s){"use strict";s.r(t);s(1);var r=class{constructor(){this.menu=document.querySelector(".site-header__menu"),this.openButton=document.querySelector(".site-header__menu-trigger"),this.events()}events(){this.openButton.addEventListener("click",()=>this.openMenu())}openMenu(){this.openButton.classList.toggle("fa-bars"),this.openButton.classList.toggle("fa-window-close"),this.menu.classList.toggle("site-header__menu--active")}},i=s(0);var n=class{constructor(){if(document.querySelector(".hero-slider")){const e=document.querySelectorAll(".hero-slider__slide").length;let t="";for(let s=0;s<e;s++)t+=`<button class="slider__bullet glide__bullet" data-glide-dir="=${s}"></button>`;document.querySelector(".glide__bullets").insertAdjacentHTML("beforeend",t),new i.a(".hero-slider",{type:"carousel",perView:1,autoplay:3e3}).mount()}}},o=s(3),l=s.n(o);var a=class{constructor(){this.resultsDiv=l()("#search-overlay__results"),this.openButton=l()(".js-search-trigger"),this.closeButton=l()(".search-overlay__close"),this.searchOverlay=l()(".search-overlay"),this.searchTerm=l()("#search-term"),this.overlayOpen=!1,this.typingTimer,this.isSpinnerVisible=!1,this.previousSearchTerm,this.events()}events(){this.openButton.on("click",this.openOverlay.bind(this)),this.closeButton.on("click",this.closeOverlay.bind(this)),l()(document).on("keydown",this.keyPressedDispatcher.bind(this)),this.searchTerm.on("keyup",this.typingLogic.bind(this))}typingLogic(){this.previousSearchTerm!=this.searchTerm.val()&&(clearTimeout(this.typingTimer),console.log("val: ",this.searchTerm.val()),this.searchTerm.val()?(this.isSpinnerVisible||(this.resultsDiv.html('<div class="spinner-loader"></div>'),this.isSpinnerVisible=!0),this.typingTimer=setTimeout(this.getResults.bind(this),2e3)):(this.resultsDiv.html(""),this.isSpinnerVisible=!1)),this.previousSearchTerm=this.searchTerm.val()}getResults(){console.log("getResults"),this.resultsDiv.html("Results for :"+this.searchTerm.val()),this.isSpinnerVisible=!1}openOverlay(){this.searchOverlay.addClass("search-overlay--active"),l()("body").addClass("body-no-scroll"),this.overlayOpen=!0}closeOverlay(){this.searchOverlay.removeClass("search-overlay--active"),this.overlayOpen=!1}keyPressedDispatcher(e){83!=e.keyCode||this.overlayOpen||l()("input","textarea").is(":focus")||this.openOverlay(),27==e.keyCode&&this.overlayOpen&&this.closeOverlay()}};new r,new n;new a}]);