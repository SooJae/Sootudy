 var tempChartData = {
      labels  : ['1월', '2월', '3월'],
      // labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label               : '이수재',
          backgroundColor     : 'navy',
          pointRadius          : false,
          data                : [28, 48, 40],
//          borderColor         : 'rgba(60,141,188,0.8)',
//          pointColor          : '#3b8bba',
//          pointStrokeColor    : 'rgba(60,141,188,1)',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(60,141,188,1)',
        },
        {
          label               : '김철수',
          backgroundColor     : 'green',
          pointRadius         : false,
          data                : [88, 89, 7],
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
          data                : [75, 33, 20],
//          borderColor         : 'rgba(210, 214, 222, 1)',
//          pointColor          : 'rgba(210, 214, 222, 1)',
//          pointStrokeColor    : '#c1c7d1',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
          label               : '김태연',
          backgroundColor     : 'grey',
          pointRadius         : false,
          data                : [65, 59, 80],
//          borderColor         : 'rgba(210, 214, 222, 1)',
//          pointColor          : 'rgba(210, 214, 222, 1)',
//          pointStrokeColor    : '#c1c7d1',
//          pointHighlightFill  : '#fff',
//          pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '박준범',
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
        	label               : '장준호',
        	backgroundColor     : 'brown',
        	pointRadius         : false,
        	data                : [95, 79, 40]
//        	borderColor         : 'rgba(210, 214, 222, 1)',
//        	pointColor          : 'rgba(210, 214, 222, 1)',
//        	pointStrokeColor    : '#c1c7d1',
//        	pointHighlightFill  : '#fff',
//        	pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '문규',
        	backgroundColor     : '#3C8DBC',
        	pointRadius         : false,
        	data                : [70,22, 80]
//        	borderColor         : 'rgba(210, 214, 222, 1)',
//        	pointColor          : 'rgba(210, 214, 222, 1)',
//        	pointStrokeColor    : '#c1c7d1',
//        	pointHighlightFill  : '#fff',
//        	pointHighlightStroke: 'rgba(220,220,220,1)',
        },
        {
        	label               : '남진우',
        	backgroundColor     : 'rgba(210, 214, 222, 1)',
        	pointRadius         : false,
        	data                : [9, 9, 100]
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