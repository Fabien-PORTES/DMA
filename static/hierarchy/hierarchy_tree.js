var labelType, useGradients, nativeTextSupport, animate;

(function() {
	var ua = navigator.userAgent, iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i), typeOfCanvas = typeof HTMLCanvasElement, nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'), textSupport = nativeCanvasSupport && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
	labelType = (!nativeCanvasSupport || (textSupport && !iStuff)) ? 'Native' : 'HTML';
	nativeTextSupport = labelType == 'Native';
	useGradients = nativeCanvasSupport;
	animate = !(iStuff || !nativeCanvasSupport);
})();

var Log = {
	elem : false,
	write : function(text) {
		if (!this.elem)
			this.elem = document.getElementById('log');
		this.elem.innerHTML = text;
		this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
	}
};


function init() {

	var url_start = "../../../ws/hierarchy/" + HConf.viewName + "?";
	var url_initial = url_start + HConf.startCond + '&' + HConf.connection + "&_maxlevel=" + HConf.maxLevel + "&_mapcolumns=" + HConf.columns;
	var url_load_prf = url_start + HConf.continueCond;
	var url_load_sfx = '&' + HConf.connection + "&_maxlevel=" + HConf.maxLevel + "&_mapcolumns=" + HConf.columns;
	
	$jit.ST.Plot.NodeTypes.implement({
		'nodeline' : {
			'render' : function(node, canvas, animating) {
				if (animating === 'expand' || animating === 'contract') {
					var pos = node.pos.getc(true), nconfig = this.node, data = node.data;
					var width = nconfig.width, height = nconfig.height;
					var algnPos = this.getAlignedPos(pos, width, height);
					var ctx = canvas.getCtx(), ort = this.config.orientation;
					ctx.beginPath();
					if (ort == 'left' || ort == 'right') {
						ctx.moveTo(algnPos.x, algnPos.y + height / 2);
						ctx.lineTo(algnPos.x + width, algnPos.y + height / 2);
					} else {
						ctx.moveTo(algnPos.x + width / 2, algnPos.y);
						ctx.lineTo(algnPos.x + width / 2, algnPos.y + height);
					}
					ctx.stroke();
				}
			}
		}
	});

	// largeur de la frame, pour repositionner le premier noeud
	var offsetX = document.documentElement.clientWidth / 2.5;
	
	var st = new $jit.ST({
		'injectInto' : 'content',
		duration : 800,
		transition : $jit.Trans.Quart.easeInOut,
		levelDistance : 60,
		offsetX: offsetX,
		levelsToShow : HConf.maxLevel,
		siblingOffset : 6,
		Node : {
			autoWidth : true,
			height : 25,
			width : 120,
			type : 'nodeline',
			color : '#23A4FF',
			lineWidth : 2,
			align : "left",
			overridable : true
		},
		Edge : {
			type : 'bezier',
			lineWidth : 1,
			color : '#555555',
			overridable : true
		},
		Navigation : {
			enable : true,
			panning : true,
			zooming : 8
		},
		request : function(nodeId, level, onComplete) {
			jx.load(url_load_prf + nodeId + url_load_sfx, function(data) {
				var json = eval('(' + data + ')');
				var subtree = $jit.json.getSubtree(json, nodeId);
				$jit.json.prune(subtree, level);
				onComplete.onComplete(nodeId, subtree);
			});
		},
		onBeforeCompute : function(node) {
			Log.write("Loading " + node.name);
		},
		onAfterCompute : function() {
			Log.write("");
		},
		onCreateLabel : function(label, node) {
			label.id = node.id;
			label.style.cursor = 'pointer';
			label.style.fontWeight = 'bold';
			label.innerHTML = HConf.createLabelHtml(node, label.style);
			label.onclick = function() {
				st.onClick(node.id);
			};
		},
		onBeforePlotNode : function(node) {
			if (node.selected) {
				node.data.$color = "#ff7";
			} else {
				delete node.data.$color;
			}
		},
		onBeforePlotLine : function(adj) {
			if (adj.nodeFrom.selected && adj.nodeTo.selected) {
				adj.data.$color = "#eed";
				adj.data.$lineWidth = 3;
			} else {
				delete adj.data.$color;
				delete adj.data.$lineWidth;
			}
		}

	});

	jx.load(url_initial, function(data) {
		var json = eval('(' + data + ')');
		st.loadJSON(json);

		st.compute();
		st.onClick(st.root);
		st.controller.onAfterCompute();
	});
}
