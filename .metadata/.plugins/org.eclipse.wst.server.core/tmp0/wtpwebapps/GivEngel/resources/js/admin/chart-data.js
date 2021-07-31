var randomScalingFactor = function(){ return Math.round(Math.random()*1000)};

	
var lineChartData	

$.ajax({
	url:"chartPricePerTime.giv",
	type:"post",
	async: false,
	success:function(data){

		lineChartData = {
				labels : ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"],
				datasets : [
					{
						label: "총 상품 판매량",
						fillColor : "rgba(220,220,220,0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						data : [data.chartList[0].userCnt,data.chartList[1].userCnt,data.chartList[2].userCnt,data.chartList[3].userCnt,data.chartList[4].userCnt,data.chartList[5].userCnt,data.chartList[6].userCnt,data.chartList[7].userCnt,data.chartList[8].userCnt,data.chartList[9].userCnt,data.chartList[10].userCnt,data.chartList[11].userCnt,data.chartList[12].userCnt,data.chartList[13].userCnt,data.chartList[14].userCnt,data.chartList[15].userCnt,data.chartList[16].userCnt,data.chartList[17].userCnt,data.chartList[18].userCnt,data.chartList[19].userCnt,data.chartList[20].userCnt,data.chartList[21].userCnt,data.chartList[22].userCnt,data.chartList[23].userCnt]
					},
					{
						label: "총 상품 판매수익",
						fillColor : "rgba(48, 164, 255, 0.2)",
						strokeColor : "rgba(48, 164, 255, 1)",
						pointColor : "rgba(48, 164, 255, 1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(48, 164, 255, 1)",
						data : [data.chartList[0].priceSum,data.chartList[1].priceSum,data.chartList[2].priceSum,data.chartList[3].priceSum,data.chartList[4].priceSum,data.chartList[5].priceSum,data.chartList[6].priceSum,data.chartList[7].priceSum,data.chartList[8].priceSum,data.chartList[9].priceSum,data.chartList[10].priceSum,data.chartList[11].priceSum,data.chartList[12].priceSum,data.chartList[13].priceSum,data.chartList[14].priceSum,data.chartList[15].priceSum,data.chartList[16].priceSum,data.chartList[17].priceSum,data.chartList[18].priceSum,data.chartList[19].priceSum,data.chartList[20].priceSum,data.chartList[21].priceSum,data.chartList[22].priceSum,data.chartList[23].priceSum]
					}
				]

			}
		
	}
});


var lineChartData7	
$.ajax({
	url:"chartTrendData.giv",
	type:"post",
	async: false,
	success:function(data){
		var label = new Array();
		var dataset = new Array();
		
		for(var i=0;i<data.date.length;i++){
			label.push(data.date[i]);
			dataset.push(data.ratio[i]);
		}
		
		lineChartData7 = {
				labels : label,
				datasets : [
					{
						label: "트렌트 분석 데이터",
						fillColor : "rgba(220,220,220,0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						data : dataset
					}
				]

			}
		
	}
});
	

	
		
var barChartData	
$.ajax({
	url:"chartPriceAndCash.giv",
	type:"post",
	success:function(data){
		var cash = [];
		var buy = [];
		for(var i=0;i<7;i++){
			cash[i] =0;
			buy[i] =0;
		}
		for(var i=0;i<data.chartBarList.length;i++){
			
			cash[i] = data.chartBarList[i].cash_sum;
			buy[i] = data.chartBarList[i].buy_sum;
		}
		barChartData = {
				labels : ["6일 전","5일 전","4일 전","3일 전","2일 전","1일 전","오늘"],
				datasets : [
					{
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,0.8)",
						highlightFill: "rgba(220,220,220,0.75)",
						highlightStroke: "rgba(220,220,220,1)",
						data : [cash[6],cash[5],cash[4],cash[3],cash[2],cash[1],cash[0]]
					},
					{
						fillColor : "rgba(48, 164, 255, 0.2)",
						strokeColor : "rgba(48, 164, 255, 0.8)",
						highlightFill : "rgba(48, 164, 255, 0.75)",
						highlightStroke : "rgba(48, 164, 255, 1)",
						data : [buy[6],buy[5],buy[4],buy[3],buy[2],buy[1],buy[0]]
					}
				]

			}
	}
});

var barChartData2
$.ajax({
	url:"chartTrendData2.giv",
	type:"post",
	success:function(data){
		
		barChartData2 = {
				labels : ["월요일","화요일","수요일","목요일","금요일","토요일","일요일"],
				datasets : [
					{
						fillColor : "rgba(48, 164, 255, 0.2)",
						strokeColor : "rgba(48, 164, 255, 0.8)",
						highlightFill : "rgba(48, 164, 255, 0.75)",
						highlightStroke : "rgba(48, 164, 255, 1)",
						data : [data.mon,data.tus,data.wed,data.thu,data.fri,data.sat,data.sun]
					}
					
				]

			}
	}
});


	var pieData = [
			{
				value: 44,
				color:"#30a5ff",
				highlight: "#62b9fb",
				label: "기부경험 있다"
			},
			{
				value: 50,
				color: "#ffb53e",
				highlight: "#f6495f",
				label: "기부경험 없다"
			}
			

		];
			
	var doughnutData = [
				{
					value: 6,
					color:"#30a5ff",
					highlight: "#62b9fb",
					label: "매우 그렇다"
				},
				{
					value: 33,
					color: "#ffb53e",
					highlight: "#fac878",
					label: "그렇다"
				},
				{
					value: 40,
					color: "#1ebfae",
					highlight: "#3cdfce",
					label: "보통이다"
				},
				{
					value: 20,
					color: "#f9243f",
					highlight: "#f6495f",
					label: "아닌것 같다"
				}

			];
			
	var radarData
	$.ajax({
		url:"hotCategory.giv",
		type:"post",
		async: false,
		success:function(data){
			radarData = {
				    labels: [data.tops[0], data.tops[1], data.tops[2], data.tops[3], data.tops[4], data.tops[5], data.tops[6]],
				    datasets: [
				        {
				            label: "가장 Hot한 태그 Top 7",
				            fillColor : "rgba(48, 164, 255, 0.2)",
				            strokeColor : "rgba(48, 164, 255, 0.8)",
				            pointColor : "rgba(48, 164, 255, 1)",
				            pointStrokeColor : "#fff",
				            pointHighlightFill : "#fff",
				            pointHighlightStroke : "rgba(48, 164, 255, 1)",
				            data: [data.top[0], data.top[1], data.top[2], data.top[3], data.top[4], data.top[5], data.top[6]]
				        }
				       
				    ]
				};
		}
	});
	
	
	
	
	
	var polarData
	$.ajax({
		url:"categoryReport.giv",
		type:"post",
		async: false,
		success:function(data){
			
			polarData = [
			    {
			    	value: data.countAcc,
			    	color: "#1ebfae",
			    	highlight: "#38cabe",
			    	label: "ACC"
			    },
			    {
			    	value: data.countBag,
			    	color: "#ffb53e",
			    	highlight: "#fac878",
			    	label: "BAG"
			    },
			    {
			    	value: data.countTop,
			    	color:"#30a5ff",
			    	highlight: "#62b9fb",
			    	label: "TOP"
			    },
			    {
			    	value: data.countBottom,
			    	color: "#f9243f",
			    	highlight: "#f6495f",
			    	label: "BOTTOM"
			    }
			
			    ];
			}
			
		});

