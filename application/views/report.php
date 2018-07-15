<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>SBD Demo</title>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="<?php echo base_url(); ?>assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>assets/css/dashboard.css" rel="stylesheet">
    <script src="<?php echo base_url(); ?>assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
                <a class="navbar-brand" href="#">SBD Report</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="<?php echo base_url(" report "); ?>">Report <span class="sr-only">(current)</span></a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Report</h1>
                <div class="col-md-12">
                    <h3 class="sub-header">Get Head Unit Types</h3>
                    <form id="headUnitTypeForm">
                        <div class="col-md-9">
                            <select class="form-control" id="oem">
                                <option value="">Select OEM</option>
                                <?php
                                    foreach($oemData as $data){
                                        echo '<option value="'.$data->id.'">'.$data->name.'</option>';
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <input class="btn btn-md btn-info" type="submit" value="Get Details" />
                        </div>
                    </form><br/><br/>
                </div>
                <div class="col-md-12" id="statDiv">
                    <div class="col-md-8" id="pieDiv"></div>
                    <div class="col-md-4" id="totDiv"></div>
                </div>
                <div class="col-md-12">
                    <h3 class="sub-header">Get Model Availability</h3>
                    <form id="modelAvailaility" method="post">
                        <div class="col-md-3">
                            <select class="form-control" id="proxy" required>
                                <option value="0">Select Proxy</option>
                                <option value="Y">Y</option>
                                <option value="N">N</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="carplay" required>
                                <option value="0">Select Carplay</option>
                                <option value="Y">Y</option>
                                <option value="N">N</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="androidAuto" required>
                                <option value="0">Select Android Auto</option>
                                <option value="Y">Y</option>
                                <option value="N">N</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <input class="btn btn-md btn-info" type="submit" value="Get Details" />
                        </div>
                    </form>
                    <div class="clearfix"></div>
                    <br/>
                    <div class="table-responsive">
                        <table id="modelTable" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Model</th>
                                    <th>Segment</th>
                                    <th>Variant</th>
                                    <th>Standard</th>
                                    <th>Stand Alone</th>
                                    <th>Pack</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Data Not Available</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br/>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--    <script src="<?php //echo base_url(); ?>/assets/js/vendor/holder.min.js"></script>s-->
    <script src="<?php echo base_url(); ?>/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script type="text/javascript">
        base_url = "<?php echo base_url(); ?>";
        $(document).ready(function() {
            $("#modelAvailaility").submit(function(e) {

                e.preventDefault();
                var elem = $(this);

                var proxy = $("#proxy").val();
                var carplay = $("#carplay").val();
                var androidAuto = $("#androidAuto").val();

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "<?php echo base_url(); ?>get-models",
                    data: {
                        proxy: proxy,
                        carplay: carplay,
                        androidAuto: androidAuto
                    },
                    success: function(result) {
                        if (result.response.status == "200") {
                            var template = "";
                            var i = 1;
                            
                            if(result.availability.length > 0){
                                $(result.availability).each(function(index, value) {
                                    if (value.standard == 0 || value.standard == '') {
                                        value.standard = '';
                                    }
                                    if (value.stand_alone == 0 || value.stand_alone == '') {
                                        value.stand_alone = '';
                                    }
                                    if (value.pack == 0 || value.pack == '') {
                                        value.pack = '';
                                    }

                                    template += '<tr>' +
                                        '<td>' + i + '</td>' +
                                        '<td>' + value.name + '</td>' +
                                        '<td>' + value.segment_name + '</td>' +
                                        '<td>' + value.variant + '</td>' +
                                        '<td>' + value.standard + '</td>' +
                                        '<td>' + value.stand_alone + '</td>' +
                                        '<td>' + value.pack + '</td>' +
                                        '</tr>';
                                    i++;
                                });
                                $("table#modelTable").find("tbody").html(template);
                            }else{
                                $("table#modelTable").find("tbody").html('<tr><td><span class="text-danger">Data not available.</span></td?</tr>');
                            }
                        }else if (result.response.status == "201") {
                            $("table#modelTable").find("tbody").html('<tr><span class="text-danger">Something went wrong.</span></tr>');
                        }
                    },
                    error: function() {                            
                        $("table#modelTable").find("tbody").html('<tr><span class="text-danger">Something went wrong.</span></tr>');
                    }
                });
            });
            
            $("#headUnitTypeForm").submit(function(e) {
                e.preventDefault();
                $("#headUnitTypeForm").parent().parent().find('#totDiv').html('');
                var elem = $(this);

                var oem = $("select#oem").val();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "<?php echo base_url(); ?>get-head-unit-type",
                    data: {
                        oem: oem
                    },
                    success: function(result) {
                        if (result.response.status == "200") {
                            if(result.headUnitType.length > 0){
                                elem.parent().parent().find('#statDiv').find('#pieDiv').html('<canvas id="pie-chart" width="800" height="450"></canvas>');

                                var oemHeadUnitType = result.headUnitType;
                                var headUnitType = [];
                                var totHeadUnitType = [];
                                var totalTypes = '';
                                
                                $.each(oemHeadUnitType, function(index, elem) {
                                    headUnitType.push(elem.head_unit_type);
                                    totHeadUnitType.push(elem.tot_head_unit_type);
                                    
                                    totalTypes += elem.tot_head_unit_type;
                                    
                                    $("#headUnitTypeForm").parent().parent().find('#totDiv').append('<label class="text-info">#Head Unit Type: '+elem.head_unit_type+'</label>'+
                                                            '<br/>'+
                                                            '<label class="text-danger">Total: '+elem.tot_head_unit_type+'</label>'+
                                                            '<br/>'+
                                                            '<label>Ratio: </label>'+
                                                            '<br>');
                                });
                                
//                                var unitTypeRatio = [];
//                                $.each(headUnitType, functon(index, elem){
//                                    unitTypeRatio = totHeadUnitType/totalTypes;
//                                    unitTypeRatio.push(["head_unit_type" = elem.head_unit_type, "tot_head_unit_type" = elem.tot_head_unit_type, "ratio" = unitTypeRatio]);
//                                });

                                new Chart(document.getElementById("pie-chart"), {
                                    type: 'pie',
                                    data: {
                                        labels: headUnitType,
                                        datasets: [{
                                            label: "Population (millions)",
                                            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                                            data: totHeadUnitType
                                        }]
                                    },
                                    options: {
                                        title: {
                                            display: true,
                                            text: 'Head Unit Type Statistics'
                                        }
                                    }
                                });
                            }else{
                                $('#statDiv').html('<span class="text-danger">Data not available.</span>');
                            }
                        }else if (result.response.status == "201") {
                            $('#statDiv').html('<span class="text-danger">Something went wrong.</span>');
                        }
                    },
                    error: function() {                                       
                        $('#statDiv').html('<span class="text-danger">Something went wrong.</span>');
                    }
                });
            });
        });
    </script>
</body>
</html>
