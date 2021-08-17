@extends('layouts.master')
@section('title','dashboard')
@section('parentPageTitle', 'index')
@section('content')
    <!-- Start row -->
    <div class="row">
        <!-- Start col -->
        <div class="col-lg-12 col-xl-8">
           <!-- Start row -->
            <div class="row">
                <!-- Start col -->

                <div class="col-lg-12 col-xl-12">
                    <div class="card m-b-30">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col-9">
                                    <h5 class="card-title mb-0">@translate(Status)</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body crm-tab-widget">
                            <div class="row align-items-center">
                                <div class="col-12 col-sm-5 p-0">
                                    <div class="nav flex-column nav-pills" id="v-pills-ticket-tab" role="tablist"
                                         aria-orientation="vertical">
                                        <a class="nav-link active" id="v-pills-support-tab" data-toggle="pill"
                                           href="#v-pills-support" role="tab" aria-controls="v-pills-support"
                                           aria-selected="true"><i
                                                class="feather icon-circle font-12 mr-1">

                                            </i>@translate(Courses)<span
                                                class="float-right font-14 text-muted">{{$total_course}}</span></a>
                                        <a class="nav-link" id="v-pills-sales-tab" data-toggle="pill"
                                           href="#v-pills-sales" role="tab" aria-controls="v-pills-sales"
                                           aria-selected="false">
                                            <i class="feather icon-circle font-12 mr-1"></i>@translate(Enrollments)<span
                                                class="float-right font-14 text-muted">{{$total_enrollments}}</span></a>
                                        <a class="nav-link" id="v-pills-product-tab" data-toggle="pill"
                                           href="#v-pills-product" role="tab" aria-controls="v-pills-product"
                                           aria-selected="false">
                                            <i class="feather icon-circle font-12 mr-1"></i>@translate(Instructors)<span
                                                class="float-right font-14 text-muted">{{$total_instructor}}</span></a>
                                        <a class="nav-link" id="v-pills-hiring-tab" data-toggle="pill"
                                           href="#v-pills-hiring" role="tab" aria-controls="v-pills-hiring"
                                           aria-selected="false">
                                            <i class="feather icon-circle font-12 mr-1"></i>@translate(Students)<span
                                                class="float-right font-14 text-muted">{{$total_students}}</span></a>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-7 p-0">
                                    <div class="tab-content" id="v-pills-ticket-tabContent">
                                        <div class="tab-pane fade show active" id="v-pills-support" role="tabpanel"
                                             aria-labelledby="v-pills-support-tab">
                                            <div id="apex-operation-course-chart"></div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-sales" role="tabpanel"
                                             aria-labelledby="v-pills-sales-tab">
                                            <div id="apex-operation-enrollment-chart"></div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-product" role="tabpanel"
                                             aria-labelledby="v-pills-product-tab">
                                            <div id="apex-operation-instructor-chart"></div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-hiring" role="tabpanel"
                                             aria-labelledby="v-pills-hiring-tab">
                                            <div id="apex-operation-student-chart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End col -->
            </div>
        </div>


        <!-- End col -->
    </div>
    <!-- End row -->

    

@endsection

@section('page-script')
    <script>
        "use strict"


        /* ----- Apex Operation Status2 Chart ----- */
        var options = {
            chart: {
                height: 260,
                type: 'radialBar',
                offsetY: -10
            },
            plotOptions: {
                radialBar: {
                    startAngle: -135,
                    endAngle: 135,
                    dataLabels: {
                        name: {
                            fontSize: '18px',
                            fontFamily: 'Mukta Vaani',
                            color: '#8A98AC',
                            offsetY: 120
                        },
                        value: {
                            offsetY: 76,
                            fontSize: '24px',
                            fontFamily: 'Mukta Vaani',
                            color: '#141d46',
                            formatter: function (val) {
                                return val ;
                            }
                        }
                    }
                }
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.15,
                    inverseColors: false,
                    opacityFrom: 1,
                    opacityTo: 1,
                    stops: [0, 50, 65, 91]
                },
            },
            stroke: {
                dashArray: 4
            },
            colors:["#506fe4"],
            series: [{{$total_enrollments}}],
            labels: ['@translate(Total Enrollments)'],
        }
        var chart = new ApexCharts(
            document.querySelector("#apex-operation-enrollment-chart"),
            options
        );
        chart.render();

        /* ----- Apex Operation Status3 Chart ----- */
        var options = {
            chart: {
                height: 260,
                type: 'radialBar',
                offsetY: -10
            },
            plotOptions: {
                radialBar: {
                    startAngle: -135,
                    endAngle: 135,
                    dataLabels: {
                        name: {
                            fontSize: '18px',
                            fontFamily: 'Mukta Vaani',
                            color: '#8A98AC',
                            offsetY: 120
                        },
                        value: {
                            offsetY: 76,
                            fontSize: '24px',
                            fontFamily: 'Mukta Vaani',
                            color: '#141d46',
                            formatter: function (val) {
                                return val;
                            }
                        }
                    }
                }
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.15,
                    inverseColors: false,
                    opacityFrom: 1,
                    opacityTo: 1,
                    stops: [0, 50, 65, 91]
                },
            },
            stroke: {
                dashArray: 4
            },
            colors:["#506fe4"],
            series: [{{$total_instructor}}],
            labels: ['@translate(Total Instructor)'],
        }
        var chart = new ApexCharts(
            document.querySelector("#apex-operation-instructor-chart"),
            options
        );
        chart.render();

        /* ----- Apex Operation Status4 Chart ----- */
        var options = {
            chart: {
                height: 260,
                type: 'radialBar',
                offsetY: -10
            },
            plotOptions: {
                radialBar: {
                    startAngle: -135,
                    endAngle: 135,
                    dataLabels: {
                        name: {
                            fontSize: '18px',
                            fontFamily: 'Mukta Vaani',
                            color: '#8A98AC',
                            offsetY: 120
                        },
                        value: {
                            offsetY: 76,
                            fontSize: '24px',
                            fontFamily: 'Mukta Vaani',
                            color: '#141d46',
                            formatter: function (val) {
                                return val;
                            }
                        }
                    }
                }
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.15,
                    inverseColors: false,
                    opacityFrom: 1,
                    opacityTo: 1,
                    stops: [0, 50, 65, 91]
                },
            },
            stroke: {
                dashArray: 4
            },
            colors:["#506fe4"],
            series: [{{$total_students}}],
            labels: ['@translate(Total Student)'],
        }
        var chart = new ApexCharts(
            document.querySelector("#apex-operation-student-chart"),
            options
        );
        chart.render();
    </script>
    @endsection
