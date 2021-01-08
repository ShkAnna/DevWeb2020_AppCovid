/*

@license
dhtmlxScheduler v.5.3.10 Professional Evaluation

This software is covered by DHTMLX Evaluation License. Contact sales@dhtmlx.com to get Commercial or Enterprise license. Usage without proper license is prohibited.

(c) XB Software Ltd.

*/
Scheduler.plugin(function(e){e.config.limit_start=null,e.config.limit_end=null,e.config.limit_view=!1,e.config.check_limits=!0,e.config.mark_now=!0,e.config.display_marked_timespans=!0,e._temp_limit_scope=function(){function t(t,a,n,i,r){var o=e,s=[],d={_props:"map_to",matrix:"y_property"};for(var _ in d){var l=d[_];if(o[_])for(var c in o[_]){var h=o[_][c],u=h[l];t[u]&&(s=o._add_timespan_zones(s,e._get_blocked_zones(a[c],t[u],n,i,r)))}}
return s=o._add_timespan_zones(s,e._get_blocked_zones(a,"global",n,i,r))}var a=null,n="dhx_time_block",i="default",r=function(e,t,a){return t instanceof Date&&a instanceof Date?(e.start_date=t,e.end_date=a):(e.days=t,e.zones=a),e},o=function(e,t,a){var i="object"==typeof e?e:{days:e};return i.type=n,i.css="",t&&(a&&(i.sections=a),i=r(i,e,t)),i};e.blockTime=function(t,a,n){var i=o(t,a,n);return e.addMarkedTimespan(i)},e.unblockTime=function(t,a,n){a=a||"fullday";var i=o(t,a,n)
;return e.deleteMarkedTimespan(i)},e.attachEvent("onBeforeViewChange",function(t,a,n,i){function r(t,a){var n=e.config.limit_start,i=e.config.limit_end,r=e.date.add(t,1,a);return t.valueOf()>i.valueOf()||r<=n.valueOf()}return!e.config.limit_view||(i=i||a,n=n||t,!r(i,n)||a.valueOf()==i.valueOf())||(setTimeout(function(){var t=r(a,n)?e.config.limit_start:a;e.setCurrentView(r(t,n)?null:t,n)},1),!1)}),e.checkInMarkedTimespan=function(a,n,r){n=n||i
;for(var o=!0,s=new Date(a.start_date.valueOf()),d=e.date.add(s,1,"day"),_=e._marked_timespans;s<a.end_date;s=e.date.date_part(d),d=e.date.add(s,1,"day")){var l=+e.date.date_part(new Date(s)),c=s.getDay(),h=t(a,_,c,l,n);if(h)for(var u=0;u<h.length;u+=2){var v=e._get_zone_minutes(s),g=a.end_date>d||a.end_date.getDate()!=s.getDate()?1440:e._get_zone_minutes(a.end_date),f=h[u],m=h[u+1];if(f<g&&m>v&&!(o="function"==typeof r&&r(a,v,g,f,m)))break}}return!o};var s=e.checkLimitViolation=function(t){
if(!t)return!0;if(!e.config.check_limits)return!0;var a=e,i=a.config,r=[];if(t.rec_type)for(var o=e.getRecDates(t),s=0;s<o.length;s++){var d=e._copy_event(t);e._lame_copy(d,o[s]),r.push(d)}else r=[t];for(var _=!0,l=0;l<r.length;l++){var c=!0,d=r[l];d._timed=e.isOneDayEvent(d),c=!i.limit_start||!i.limit_end||d.start_date.valueOf()>=i.limit_start.valueOf()&&d.end_date.valueOf()<=i.limit_end.valueOf(),c&&(c=!e.checkInMarkedTimespan(d,n,function(e,t,n,i,r){var o=!0
;return t<=r&&t>=i&&((1440==r||n<r)&&(o=!1),e._timed&&a._drag_id&&"new-size"==a._drag_mode?(e.start_date.setHours(0),e.start_date.setMinutes(r)):o=!1),(n>=i&&n<r||t<i&&n>r)&&(e._timed&&a._drag_id&&"new-size"==a._drag_mode?(e.end_date.setHours(0),e.end_date.setMinutes(i)):o=!1),o})),c||(c=a.checkEvent("onLimitViolation")?a.callEvent("onLimitViolation",[d.id,d]):c),_=_&&c}return _||(a._drag_id=null,a._drag_mode=null),_};e._get_blocked_zones=function(e,t,a,n,i){var r=[]
;if(e&&e[t])for(var o=e[t],s=this._get_relevant_blocked_zones(a,n,o,i),d=0;d<s.length;d++)r=this._add_timespan_zones(r,s[d].zones);return r},e._get_relevant_blocked_zones=function(e,t,a,n){return a[t]&&a[t][n]?a[t][n]:a[e]&&a[e][n]?a[e][n]:[]},e.attachEvent("onMouseDown",function(e){return!(e==n)}),e.attachEvent("onBeforeDrag",function(t){return!t||s(e.getEvent(t))}),e.attachEvent("onClick",function(t,a){return s(e.getEvent(t))}),e.attachEvent("onBeforeLightbox",function(t){var n=e.getEvent(t)
;return a=[n.start_date,n.end_date],s(n)}),e.attachEvent("onEventSave",function(t,a,n){if(!a.start_date||!a.end_date){var i=e.getEvent(t);a.start_date=new Date(i.start_date),a.end_date=new Date(i.end_date)}if(a.rec_type){var r=e._lame_clone(a);return e._roll_back_dates(r),s(r)}return s(a)}),e.attachEvent("onEventAdded",function(t){if(!t)return!0;var a=e.getEvent(t)
;return!s(a)&&e.config.limit_start&&e.config.limit_end&&(a.start_date<e.config.limit_start&&(a.start_date=new Date(e.config.limit_start)),a.start_date.valueOf()>=e.config.limit_end.valueOf()&&(a.start_date=this.date.add(e.config.limit_end,-1,"day")),a.end_date<e.config.limit_start&&(a.end_date=new Date(e.config.limit_start)),a.end_date.valueOf()>=e.config.limit_end.valueOf()&&(a.end_date=this.date.add(e.config.limit_end,-1,"day")),
a.start_date.valueOf()>=a.end_date.valueOf()&&(a.end_date=this.date.add(a.start_date,this.config.event_duration||this.config.time_step,"minute")),a._timed=this.isOneDayEvent(a)),!0}),e.attachEvent("onEventChanged",function(t){if(!t)return!0;var n=e.getEvent(t);if(!s(n)){if(!a)return!1;n.start_date=a[0],n.end_date=a[1],n._timed=this.isOneDayEvent(n)}return!0}),e.attachEvent("onBeforeEventChanged",function(e,t,a){return s(e)}),e.attachEvent("onBeforeEventCreated",function(t){
var a=e.getActionData(t).date,n={_timed:!0,start_date:a,end_date:e.date.add(a,e.config.time_step,"minute")};return s(n)}),e.attachEvent("onViewChange",function(){e._mark_now()}),e.attachEvent("onAfterSchedulerResize",function(){return window.setTimeout(function(){e._mark_now()},1),!0}),e.attachEvent("onTemplatesReady",function(){e._mark_now_timer=window.setInterval(function(){e._is_initialized()&&e._mark_now()},6e4)}),e._mark_now=function(t){var a="dhx_now_time";this._els[a]||(this._els[a]=[])
;var n=e._currentDate(),i=this.config;if(e._remove_mark_now(),!t&&i.mark_now&&n<this._max_date&&n>this._min_date&&n.getHours()>=i.first_hour&&n.getHours()<i.last_hour){var r=this.locate_holder_day(n);this._els[a]=e._append_mark_now(r,n)}},e._append_mark_now=function(t,a){var n="dhx_now_time",i=e._get_zone_minutes(a),r={zones:[i,i+1],css:n,type:n};if(!this._table_view){if(this._props&&this._props[this._mode]){var o,s,d=this._props[this._mode],_=d.size||d.options.length
;d.days>1?(d.size&&d.options.length&&(t=(d.position+t)/d.options.length*d.size),o=t,s=t+_):(o=0,s=o+_);for(var l=[],c=o;c<s;c++){var h=c;r.days=h;var u=e._render_marked_timespan(r,null,h)[0];l.push(u)}return l}return r.days=t,e._render_marked_timespan(r,null,t)}if("month"==this._mode)return r.days=+e.date.date_part(a),e._render_marked_timespan(r,null,null)},e._remove_mark_now=function(){for(var e="dhx_now_time",t=this._els[e],a=0;a<t.length;a++){var n=t[a],i=n.parentNode;i&&i.removeChild(n)}
this._els[e]=[]},e._marked_timespans={global:{}},e._get_zone_minutes=function(e){return 60*e.getHours()+e.getMinutes()},e._prepare_timespan_options=function(t){var a=[],n=[];if("fullweek"==t.days&&(t.days=[0,1,2,3,4,5,6]),t.days instanceof Array){for(var r=t.days.slice(),o=0;o<r.length;o++){var s=e._lame_clone(t);s.days=r[o],a.push.apply(a,e._prepare_timespan_options(s))}return a}if(!t||!(t.start_date&&t.end_date&&t.end_date>t.start_date||void 0!==t.days&&t.zones)&&!t.type)return a
;var d=0,_=1440;"fullday"==t.zones&&(t.zones=[d,_]),t.zones&&t.invert_zones&&(t.zones=e.invertZones(t.zones)),t.id=e.uid(),t.css=t.css||"",t.type=t.type||i;var l=t.sections;if(l){for(var c in l)if(l.hasOwnProperty(c)){var h=l[c];h instanceof Array||(h=[h]);for(var o=0;o<h.length;o++){var u=e._lame_copy({},t);u.sections={},u.sections[c]=h[o],n.push(u)}}}else n.push(t);for(var v=0;v<n.length;v++){var g=n[v],f=g.start_date,m=g.end_date
;if(f&&m)for(var p=e.date.date_part(new Date(f)),y=e.date.add(p,1,"day");p<m;){var u=e._lame_copy({},g);delete u.start_date,delete u.end_date,u.days=p.valueOf();var b=f>p?e._get_zone_minutes(f):d,x=m>y||m.getDate()!=p.getDate()?_:e._get_zone_minutes(m);u.zones=[b,x],a.push(u),p=y,y=e.date.add(y,1,"day")}else g.days instanceof Date&&(g.days=e.date.date_part(g.days).valueOf()),g.zones=t.zones.slice(),a.push(g)}return a},e._get_dates_by_index=function(t,a,n){var i=[]
;a=e.date.date_part(new Date(a||e._min_date)),n=new Date(n||e._max_date);for(var r=a.getDay(),o=t-r>=0?t-r:7-a.getDay()+t,s=e.date.add(a,o,"day");s<n;s=e.date.add(s,1,"week"))i.push(s);return i},e._get_css_classes_by_config=function(e){var t=[];return e.type==n&&(t.push(n),e.css&&t.push(n+"_reset")),t.push("dhx_marked_timespan",e.css),t.join(" ")},e._get_block_by_config=function(e){var t=document.createElement("div")
;return e.html&&("string"==typeof e.html?t.innerHTML=e.html:t.appendChild(e.html)),t},e._render_marked_timespan=function(t,a,n){var i=[],r=e.config,o=this._min_date,s=this._max_date,d=!1;if(!r.display_marked_timespans)return i;if(!n&&0!==n){if(t.days<7)n=t.days;else{var _=new Date(t.days);if(d=+_,!(+s>+_&&+o<=+_))return i;n=_.getDay()}var l=o.getDay();l>n?n=7-(l-n):n-=l}var c=t.zones,h=e._get_css_classes_by_config(t);if(e._table_view&&"month"==e._mode){var u=[],v=[];if(a)u.push(a),
v.push(n);else{v=d?[d]:e._get_dates_by_index(n);for(var g=0;g<v.length;g++)u.push(this._scales[v[g]])}for(var g=0;g<u.length;g++){a=u[g],n=v[g];var f=Math.floor((this._correct_shift(n,1)-o.valueOf())/(864e5*this._cols.length)),m=this.locate_holder_day(n,!1)%this._cols.length;if(!this._ignores[m]){
var p=this.config.rtl?this._colsS.col_length-1-m:m,y=e._get_block_by_config(t),b=Math.max(a.offsetHeight-1,0),x=Math.max(a.offsetWidth-1,0),w=this._colsS[p],k=this._colsS.heights[f]+(this._colsS.height?this.xy.month_scale_height+2:2)-1;y.className=h,y.style.top=k+"px",y.style.lineHeight=y.style.height=b+"px";for(var D=0;D<c.length;D+=2){var E=c[g],N=c[g+1];if(N<=E)return[];var S=y.cloneNode(!0);S.style.left=w+Math.round(E/1440*x)+"px",S.style.width=Math.round((N-E)/1440*x)+"px",a.appendChild(S),
i.push(S)}}}}else{var M=n;if(this._ignores[this.locate_holder_day(n,!1)])return i;if(this._props&&this._props[this._mode]&&t.sections&&t.sections[this._mode]){var A=this._props[this._mode];M=A.order[t.sections[this._mode]];var O=A.order[t.sections[this._mode]];if(A.days>1){M=M*(A.size||A.options.length)+O}else M=O,A.size&&M>A.position+A.size&&(M=0)}a=a||e.locate_holder(M);for(var g=0;g<c.length;g+=2){var E=Math.max(c[g],60*r.first_hour),N=Math.min(c[g+1],60*r.last_hour);if(N<=E){
if(g+2<c.length)continue;return[]}var S=e._get_block_by_config(t);S.className=h;var C=24*this.config.hour_size_px+1,T=36e5;S.style.top=Math.round((60*E*1e3-this.config.first_hour*T)*this.config.hour_size_px/T)%C+"px",S.style.lineHeight=S.style.height=Math.max(Math.round(60*(N-E)*1e3*this.config.hour_size_px/T)%C,1)+"px",a.appendChild(S),i.push(S)}}return i},e._mark_timespans=function(){var t=this._els.dhx_cal_data[0],a=[];if(e._table_view&&"month"==e._mode)for(var n in this._scales){
var i=new Date(+n);a.push.apply(a,e._on_scale_add_marker(this._scales[n],i))}else for(var i=new Date(e._min_date),r=0,o=t.childNodes.length;r<o;r++){var s=t.childNodes[r];s.firstChild&&e._getClassName(s.firstChild).indexOf("dhx_scale_hour")>-1||(a.push.apply(a,e._on_scale_add_marker(s,i)),i=e.date.add(i,1,"day"))}return a},e.markTimespan=function(t){var a=!1;this._els.dhx_cal_data||(e.get_elements(),a=!0);var n=e._marked_timespans_ids,i=e._marked_timespans_types,r=e._marked_timespans
;e.deleteMarkedTimespan(),e.addMarkedTimespan(t);var o=e._mark_timespans();return a&&(e._els=[]),e._marked_timespans_ids=n,e._marked_timespans_types=i,e._marked_timespans=r,o},e.unmarkTimespan=function(e){if(e)for(var t=0;t<e.length;t++){var a=e[t];a.parentNode&&a.parentNode.removeChild(a)}},e._addMarkerTimespanConfig=function(t){var a="global",n=e._marked_timespans,i=t.id,r=e._marked_timespans_ids;r[i]||(r[i]=[]);var o=t.days,s=t.sections,d=t.type;if(t.id=i,s){
for(var _ in s)if(s.hasOwnProperty(_)){n[_]||(n[_]={});var l=s[_],c=n[_];c[l]||(c[l]={}),c[l][o]||(c[l][o]={}),c[l][o][d]||(c[l][o][d]=[],e._marked_timespans_types||(e._marked_timespans_types={}),e._marked_timespans_types[d]||(e._marked_timespans_types[d]=!0));var h=c[l][o][d];t._array=h,h.push(t),r[i].push(t)}}else{n[a][o]||(n[a][o]={}),n[a][o][d]||(n[a][o][d]=[]),e._marked_timespans_types||(e._marked_timespans_types={}),e._marked_timespans_types[d]||(e._marked_timespans_types[d]=!0)
;var h=n[a][o][d];t._array=h,h.push(t),r[i].push(t)}},e._marked_timespans_ids={},e.addMarkedTimespan=function(t){var a=e._prepare_timespan_options(t);if(a.length){for(var n=a[0].id,i=0;i<a.length;i++)e._addMarkerTimespanConfig(a[i]);return n}},e._add_timespan_zones=function(e,t){var a=e.slice();if(t=t.slice(),!a.length)return t;for(var n=0;n<a.length;n+=2)for(var i=a[n],r=a[n+1],o=n+2==a.length,s=0;s<t.length;s+=2){var d=t[s],_=t[s+1];if(_>r&&d<=r||d<i&&_>=i)a[n]=Math.min(i,d),
a[n+1]=Math.max(r,_),n-=2;else{if(!o)continue;var l=i>d?0:2;a.splice(n+l,0,d,_)}t.splice(s--,2);break}return a},e._subtract_timespan_zones=function(e,t){for(var a=e.slice(),n=0;n<a.length;n+=2)for(var i=a[n],r=a[n+1],o=0;o<t.length;o+=2){var s=t[o],d=t[o+1];if(d>i&&s<r){var _=!1;i>=s&&r<=d&&a.splice(n,2),i<s&&(a.splice(n,2,i,s),_=!0),r>d&&a.splice(_?n+2:n,_?0:2,d,r),n-=2;break}}return a},e.invertZones=function(t){return e._subtract_timespan_zones([0,1440],t.slice())},
e._delete_marked_timespan_by_id=function(t){var a=e._marked_timespans_ids[t];if(a)for(var n=0;n<a.length;n++)for(var i=a[n],r=i._array,o=0;o<r.length;o++)if(r[o]==i){r.splice(o,1);break}},e._delete_marked_timespan_by_config=function(t){var a,n=e._marked_timespans,r=t.sections,o=t.days,s=t.type||i;if(r){for(var d in r)if(r.hasOwnProperty(d)&&n[d]){var _=r[d];n[d][_]&&(a=n[d][_])}}else a=n.global;if(a)if(void 0!==o)a[o]&&a[o][s]&&(e._addMarkerTimespanConfig(t),
e._delete_marked_timespans_list(a[o][s],t));else for(var l in a)if(a[l][s]){var c=e._lame_clone(t);t.days=l,e._addMarkerTimespanConfig(c),e._delete_marked_timespans_list(a[l][s],t)}},e._delete_marked_timespans_list=function(t,a){for(var n=0;n<t.length;n++){var i=t[n],r=e._subtract_timespan_zones(i.zones,a.zones);if(r.length)i.zones=r;else{t.splice(n,1),n--;for(var o=e._marked_timespans_ids[i.id],s=0;s<o.length;s++)if(o[s]==i){o.splice(s,1);break}}}},e.deleteMarkedTimespan=function(t){
if(arguments.length||(e._marked_timespans={global:{}},e._marked_timespans_ids={},e._marked_timespans_types={}),"object"!=typeof t)e._delete_marked_timespan_by_id(t);else{t.start_date&&t.end_date||(void 0!==t.days||t.type||(t.days="fullweek"),t.zones||(t.zones="fullday"));var a=[];if(t.type)a.push(t.type);else for(var n in e._marked_timespans_types)a.push(n);for(var i=e._prepare_timespan_options(t),r=0;r<i.length;r++)for(var o=i[r],s=0;s<a.length;s++){var d=e._lame_clone(o);d.type=a[s],
e._delete_marked_timespan_by_config(d)}}},e._get_types_to_render=function(t,a){var n=t?e._lame_copy({},t):{};for(var i in a||{})a.hasOwnProperty(i)&&(n[i]=a[i]);return n},e._get_configs_to_render=function(e){var t=[];for(var a in e)e.hasOwnProperty(a)&&t.push.apply(t,e[a]);return t},e._on_scale_add_marker=function(t,a){if(!e._table_view||"month"==e._mode){var n=a.getDay(),i=a.valueOf(),r=this._mode,o=e._marked_timespans,s=[],d=[];if(this._props&&this._props[r]){
var _=this._props[r],l=_.options,c=e._get_unit_index(_,a),h=l[c];if(_.days>1){var u=864e5,v=Math.round((a-e._min_date)/u),g=_.size||l.length;a=e.date.add(e._min_date,Math.floor(v/g),"day"),a=e.date.date_part(a)}else a=e.date.date_part(new Date(this._date));if(n=a.getDay(),i=a.valueOf(),o[r]&&o[r][h.key]){var f=o[r][h.key],m=e._get_types_to_render(f[n],f[i]);s.push.apply(s,e._get_configs_to_render(m))}}var p=o.global,y=p[i]||p[n];s.push.apply(s,e._get_configs_to_render(y))
;for(var b=0;b<s.length;b++)d.push.apply(d,e._render_marked_timespan(s[b],t,a));return d}},e.attachEvent("onScaleAdd",function(){e._on_scale_add_marker.apply(e,arguments)}),e.dblclick_dhx_marked_timespan=function(t,a){e.callEvent("onScaleDblClick",[e.getActionData(t).date,a,t]),e.config.dblclick_create&&e.addEventNow(e.getActionData(t).date,null,t)}},e._temp_limit_scope()});