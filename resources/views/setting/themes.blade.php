@extends('layouts.master')
@section('title','Themes Setting')
@section('parentPageTitle', 'All')

@section('css-link')

@stop

@section('page-style')

@stop
@section('content')
    <div class="row">
        <div class="col-md-10 offset-md-1 px-3">
            <div class="card m-2">
                <div class="card-header">
                    <h2 class="card-title">@translate(Themes Setting)</h2>
                </div>
                <div class="card-body">
                    <form method="post" action="{{route('themes.store')}}" enctype="multipart/form-data">
                        @csrf


                        <label class="label">@translate(Themes color)</label>
                        <input type="hidden" name="types[]" value="THEMES_COLOR">
                        <input type="text" placeholder="@translate(Enter the data)" value="{{env('THEMES_COLOR')}}" name="THEMES_COLOR"
                               class="form-control m-2">


                        <hr class="py-2">
                        <div class="m-2 float-right">
                            <button class="btn btn-primary" type="submit">@translate(Save)</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>


@endsection



@section('js-link')

@stop

@section('page-script')
@stop


