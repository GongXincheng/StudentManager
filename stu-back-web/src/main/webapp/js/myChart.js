//柱状图
var MyBar = function(xData,yData){
	var optionBar = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		    	top:'5%',
		        left: '3%',
		        right: '10%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : xData,
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		        	name: '数据',
		            type: 'bar',
		            barWidth: '60%',
		            data: yData
		        }
		    ]
		}
	
	return optionBar;
};



//饼图
var MyPie = function(data1,data2){
	var optionPie = {
			backgroundColor: '#f8f8f8',	
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        bottom: 30,
		        left: 'center',
		        data: data1
		    },
		    grid: {
		    	top: 0,
		        left: 0,
		        right: 0,
		        bottom: 0,
		        containLabel: false
		    },
		    xAxis : [  
                 {  
                     type : 'value',  
                     splitNumber: 2,  
                     scale: true,  
                     show:false,  
                 }  
            ],
            yAxis : [  
                 {  
                     type : 'value',  
                     splitNumber: 2,  
                     scale: true,  
                     show:false,  
                 }  
             ],
		    series : [
		        {
		        	name: '数据',
		            type: 'pie',
		            radius : '60%',
		            center: ['50%', 200],
		            selectedMode: 'single',
		            data: data2,
		            
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		}
	
	return optionPie;
};
















