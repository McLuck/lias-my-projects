function doBump(r,k,b,p,l,m,A,n,a,g,v,q,j,e,d,c,u){x=0;var o=r.replace(/\./,"");var y=new Array();var B=null;B=$$(r);B.each(function(f){content=f.get("href");if(f.get("href").indexOf("^")==0){var i=f.get("href").replace("^","");$(i).setStyle("display","none")}f.set("id",o+"_"+x);++x});var z="";var x=0;var t=0;if(!k){k=750}if(!b){b=250}if(!p){p="000"}if(!l){l="000"}if(!m||m>1){m=0.3}if(!A){A=7}if(!n){n=2}if(!a){a="303132"}if(!g){g=10}if(!v){v="000"}if(!q){q=2}if(!j){j=new Fx.Transition(Fx.Transitions.Quad.easeInOut,k)}if(!e){e=new Fx.Transition(Fx.Transitions.Quad.easeOut,b)}if(!c){c="center center"}if(!u){u="no-repeat"}if(!d){d="images/ajax-loader.gif"}var C="iconsets/"+q+"/";closeBtnPos=n+10;closeBtnPos=-closeBtnPos;nextBtnPos=n+20;prevBtnPos=n+20;prevBtnPos=-prevBtnPos;$$(r).addEvent("mouseover",function(f){if(this.get("href")!=null){var i=this.get("href");if(i.indexOf(".jpg")!=-1||i.indexOf(".gif")!=-1||i.indexOf(".png")!=-1){img=new Image();img.src=i;maxw=img.width;maxh=img.height}}});$$(r).addEvent("click",function(T){embeds=document.getElementsByTagName("object");for(x=0;x<embeds.length;x++){embeds[x].style.visibility="hidden"}T=new Event(T).stop();if($("grow")!=null){$("grow").dispose()}if(this.get("rev")!=null){var Y=this.get("rev")}var Q=this.get("href");var N=this.get("id");var M=N.split(/_/);N=M[1];maxw=0;maxh=0;var aa="";if(this.get("rel")!=null){var X=this.get("rel").split("-");maxw=X[0];maxh=X[1]}if(this.get("title")!=null){aa=this.get("title")}if(this.get("href")!=null){hr=this.get("href")}if(maxw==0){maxw=640}if(maxh==0){maxh=480}if(Q.indexOf(".jpg")!=-1||Q.indexOf(".gif")!=-1||Q.indexOf(".png")!=-1){img=new Image();img.src=Q;maxw=img.width;maxh=img.height}w=window.getSize().x.toInt();h=window.getSize().y.toInt();s=window.getScrollTop();var K=(w)/2;var G=(h)/2;var V=(w-maxw)/2;var P=((h-maxh)/2)+s;var S=n+"px solid #"+a;var D="#"+p+"  url("+d+") "+u+" "+c;if($("grow")!=null){$("grow").dispose()}var f=new Element("div",{styles:{width:"1px",height:"1px",position:"absolute",border:S,padding:"4px",background:D,left:K,top:G,cursor:"pointer",display:"block","z-index":"100000"},id:"grow"});$(f).setStyles({"-moz-border-radius":A+"px","-webkit-border-radius":A+"px","border-radius":A+"px"});var L=window.getScrollTop();bg=new Element("div",{styles:{background:"#"+l,width:"100%",height:"100%",opacity:m,position:"absolute",top:L,left:0},id:"bg"});if(Browser.Engine.name=="trident"&&Browser.Engine.version==4){var F=window.getHeight();$(bg).setStyle("height",F)}var I=new Element("img",{styles:{width:"24px",height:"24px",position:"absolute",top:closeBtnPos+"px",right:closeBtnPos+"px","z-index":"1000000"},src:C+"closed.png",id:"nycloser"});I.addEvent("click",function(ab){embeds=document.getElementsByTagName("object");for(x=0;x<embeds.length;x++){embeds[x].style.visibility="visible"}if($("flowp")!=null){jwplayer().stop();jwplayer().remove()}$(f).getChildren().dispose();bg.dispose();E.start({width:[maxw,1],height:[maxh,1],left:[V,K],top:[P,G+s]})});if(Browser.Engine.name!="trident"){window.addEvent("keyup",function(ab){if(ab.key=="esc"){embeds=document.getElementsByTagName("object");for(x=0;x<embeds.length;x++){embeds[x].style.visibility="visible"}if($("flowp")!=null){jwplayer().stop();jwplayer().remove()}$(f).getChildren().dispose();bg.dispose();E.start({width:[maxw,1],height:[maxh,1],left:[V,K],top:[P,G+s]})}})}else{document.addEvent("keyup",function(ab){embeds=document.getElementsByTagName("object");for(x=0;x<embeds.length;x++){embeds[x].style.visibility="visible"}if(ab.key=="esc"){if($("flowp")!=null){jwplayer().stop();jwplayer().remove()}$(f).getChildren().dispose();bg.dispose();E.start({width:[maxw,1],height:[maxh,1],left:[V,K],top:[P,G+s]})}})}bg.inject(document.body);f.injectInside(document.body);I.injectInside(f);window.addEvent("scroll",function(){$(bg).setStyle("top",window.getScrollTop())});var i=new Fx.Morph($("grow"),{transition:j,duration:k,wait:"link",onComplete:function(){$(f).dispose()}});var E=new Fx.Morph($("grow"),{transition:e,duration:b,wait:"link",onComplete:function(){$(f).dispose()}});var J=new Fx.Morph($("grow"),{transition:j,duration:k,wait:"link",onComplete:function(){if(d!=null){var ak="#"+p+"  url("+d+") "+u+" "+c;$(f).setStyle("background",ak)}else{$(f).setStyle("background","#"+p)}if($("prev")!=null){$("prev").setStyle("display","block")}if($("next")!=null){$("next").setStyle("display","block")}$("grow").setStyle("-moz-box-shadow","3px 3px "+g+"px #"+v);$("grow").setStyle("-webkit-box-shadow","3px 3px "+g+"px #"+v);$("grow").setStyle("box-shadow","3px 3px "+g+"px #"+v);if(Q.indexOf(".jpg")!=-1||Q.indexOf(".gif")!=-1||Q.indexOf(".png")!=-1){var af=new Element("img");af.src=Q;maxw=af.width;maxh=af.height;document.id(af).inject(f)}else{if(Q.indexOf(".flv")==-1&&Q.indexOf(".mp3")==-1&&Q.indexOf(".pdf")==-1&&Q.indexOf(".swf")==-1&&Q.indexOf(".jpg")==-1&&Q.indexOf(".gif")==-1&&Q.indexOf(".png")==-1&&Q.indexOf("^")==-1){var ad=new Element("div");ad.setStyle("display","block");ad.setStyle("overflow","hidden");ad.setStyle("padding","20px");ad.setStyle("height",maxh-40);ad.setStyle("width",maxw-40);ad.setAttribute("id","htmlframe");ad.inject(f);var ai=new IFrame();ai.setStyle("overflow","auto");ai.set("frameborder","0");ai.setStyle("width",maxw-40);ai.setStyle("height",maxh-40);ai.src=Q;ai.inject(ad)}else{if(Q.indexOf(".pdf")!=-1){var ab=new Element("div",{styles:{padding:"20px",height:maxh-40,width:maxw-40}});ab.inject(f);var ai=new IFrame();ai.src=Q;ai.setStyle("width",maxw-40);ai.setStyle("height",maxh-40);ai.inject(ab)}else{if(Q.indexOf(".swf")!=-1){var ab=new Element("div",{styles:{padding:"20px",height:maxh-40,width:maxw-40},id:"swf"});ab.inject(f);var ae=new Swiff(Q,{id:"video",width:maxw-40,height:maxh-40,container:ab})}else{if(Q.indexOf(".flv")!=-1){var ab=new Element("div",{styles:{padding:"20px",height:maxh-40,width:maxw-40,"z-index":"1000"},id:"flowp"});ab.inject(f);jwplayer(ab).setup({flashplayer:"mediaplayer/player.swf",file:Q,width:maxw,height:maxh,wmode:"transparent",skin:"skins/glow/glow.zip"})}else{if(Q.indexOf(".mp3")!=-1){var ab=new Element("div",{styles:{padding:"20px",height:maxh+10,width:maxw+10,"z-index":"1000"},id:"flowp"});ab.inject(f);jwplayer(ab).setup({flashplayer:"mediaplayer/player.swf",type:"sound",width:maxw,height:maxh,file:Q,src:Q,controlbar:"bottom",autoplay:"true",skin:"skins/glow/glow.zip"})}else{if(Q.indexOf("youtube")==0||Q.indexOf("vimeo")==0){var ad=new Element("div");ad.setStyle("display","block");ad.setStyle("overflow","hidden");ad.setStyle("padding","20px");ad.setStyle("height",maxh-40);ad.setStyle("width",maxw-40);ad.setAttribute("id","htmlframe");ad.inject(f);jwplayer(ad).setup({flashplayer:"mediaplayer/player.swf",width:maxw,height:maxh,file:Q,autostart:false,type:"sound",controlbar:"bottom",provider:"youtube"})}else{if(Q.indexOf("^")==0){Q=Q.replace("^","");var ab=new Element("div",{styles:{padding:"20px",height:"auto",width:"auto",color:"#fff",overflow:"hidden"}});var ag=document.id(Q).get("html");ab.set("html",ag);ab.inject(f)}}}}}}}}var ah=30+n;ah=-ah;if(aa!=""){var aj=new Element("div",{styles:{height:"15px","line-height":"11px",position:"absolute",bottom:ah+"px",left:"0px",color:"#eee",opacity:"0.9","z-index":"10000",background:"#000","-webkit-border-radius":"5px","-moz-border-radius":"5px","-border-radius":"5px",display:"block",padding:"3px 5px",border:"1px solid #"+a}});aj.set("html",aa);aj.inject(f);aj.set("id","maindesc")}if(Y!=null){var ac=new Element("div",{styles:{width:"auto",height:"20px",position:"absolute",left:"20px",bottom:"-41px",color:"#eee","text-decoration":"none",background:"#000","-webkit-border-radius":"5px","-moz-border-radius":"5px","-border-radius":"5px",display:"block",padding:"10px","border-bottom":"2px solid #303132","border-left":"2px solid #303132","border-right":"2px solid #303132"}});ac.inject(f);ac.set("html",Y);ac.set("id","addondesc")}}});$(bg).addEvent("click",function(ab){bg.dispose();jwplayer().stop();$(f).getChildren().dispose();E.start({width:[maxw,1],height:[maxh,1],left:[V,K],top:[P,G+s]})});var H=this.get("id");var X=H.split(/_/);X=X[1].toInt()+1;if(B[X]!=null){var Z=(maxh-30)/2;var W=new Element("a",{styles:{width:"30px",height:"30px",background:"url("+C+"next.png) no-repeat center center",position:"absolute",right:-nextBtnPos+"px",bottom:Z,display:"none"},id:"next"});W.addEvent("click",function(ad){if(Browser.Engine.trident){if(document.id("video")!=null){document.id("video").stop()}if(document.id("swf")!=null){document.id("swf").dispose()}}document.id("bg").dispose();document.id("grow").dispose();var ac=N.toInt()+1;var ab=o+"_"+ac;document.id(ab).fireEvent("click",this)});W.inject(f)}var R=this.get("id");var U=R.split("_");U=U[1].toInt()-1;if(B[U]!=null){var Z=(maxh-30)/2;var O=new Element("a",{styles:{width:"30px",height:"30px",background:"url("+C+"prev.png) no-repeat center center",position:"absolute",left:prevBtnPos+"px",bottom:Z,display:"none"},id:"prev"});O.addEvent("click",function(ad){if(Browser.Engine.trident){if(document.id("video")!=null){document.id("video").stop()}if(document.id("swf")!=null){document.id("swf").dispose()}}document.id("bg").dispose();document.id("grow").dispose();var ac=N.toInt()-1;var ab=o+"_"+ac;N=ac;document.id(ab).fireEvent("click",this)});O.inject(f)}J.start({width:[1,maxw],height:[1,maxh],left:[K,V],top:[G+s,P]})})};