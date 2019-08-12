 var tempChartData = {
      labels  : ['6월', '7월', '8월'],
      // labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label               : '이수재',
          backgroundColor     : 'navy',
          pointRadius          : false,
          data                : [28, 28, 20],
//          borderColor         : 'rgba(60,141,188,0.8)',
//          pointColor          : '#3b8bba',
//          pointStrokeColor    : 'rgba(60,141,188,1)',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(60,141,188,1)',
        },
        {
          label               : '예지',
          backgroundColor     : 'green',
          pointRadius         : false,
          data                : [38, 29, 7],
//          borderColor         : 'rgba(210, 214, 222, 1)',
//          pointColor          : 'rgba(210, 214, 222, 1)',
//          pointStrokeColor    : '#c1c7d1',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
          label               : '아이유',
          backgroundColor     : 'tan',
          pointRadius         : false,
          data                : [15, 33, 20],
//          borderColor         : 'rgba(210, 214, 222, 1)',
//          pointColor          : 'rgba(210, 214, 222, 1)',
//          pointStrokeColor    : '#c1c7d1',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
          label               : '태연',
          backgroundColor     : 'grey',
          pointRadius         : false,
          data                : [1, 32, 20],
//          borderColor         : 'rgba(210, 214, 222, 1)',
//          pointColor          : 'rgba(210, 214, 222, 1)',
//          pointStrokeColor    : '#c1c7d1',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '박보영',
        	backgroundColor     : 'plum',
        	borderColor         : 'rgba(210, 214, 222, 1)',
        	pointRadius         : false,
        	data                : [35, 29, 10]
//        	pointColor          : 'rgba(210, 214, 222, 1)',
//        	pointStrokeColor    : '#c1c7d1',
//        	pointHighlightFill  : '#fff',
//        	pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '연우',
        	backgroundColor     : 'brown',
        	pointRadius         : false,
        	data                : [15, 9, 20]
//        	borderColor         : 'rgba(210, 214, 222, 1)',
//        	pointColor          : 'rgba(210, 214, 222, 1)',
//        	pointStrokeColor    : '#c1c7d1',
//        	pointHighlightFill  : '#fff',
//        	pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '윤아',
        	backgroundColor     : '#3C8DBC',
        	pointRadius         : false,
        	data                : [40,22, 10]
//        	borderColor         : 'rgba(210, 214, 222, 1)',
//        	pointColor          : 'rgba(210, 214, 222, 1)',
//        	pointStrokeColor    : '#c1c7d1',
//        	pointHighlightFill  : '#fff',
//        	pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '수재리',
        	backgroundColor     : 'rgba(210, 214, 222, 1)',
        	pointRadius         : false,
        	data                : [9, 9, 41]
//        	borderColor         : 'rgba(210, 214, 222, 1)',
//        	pointColor          : 'rgba(210, 214, 222, 1)',
//        	pointStrokeColor    : '#c1c7d1',
//        	pointHighlightFill  : '#fff',
//        	pointHighlightStroke: 'rgba(220,220,220,1)',
        },
      ]
    }
    
    //-------------
    //- BAR CHART -
    //-------------
    // This will get the first returned node in the jQuery collection.
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = jQuery.extend(true, {}, tempChartData)
    var temp0 = tempChartData.datasets[0]
    var temp1 = tempChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    var barChart = new Chart(barChartCanvas, {
      type: 'bar', 
      data: barChartData,
      options: barChartOptions
    })