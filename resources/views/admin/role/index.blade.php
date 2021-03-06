{{-- Users index page --}}
@extends('layouts.backend')

@section('content')
@include('layouts.headers.cards')
<div class="container-fluid mt--7 bg-color" style="margin-top: 20px !important;">
    <breadcrumb list-classes="breadcrumb-links">
      <breadcrumb-item><a href="{{ url('admin') }}">Beranda</a></breadcrumb-item> 
      <breadcrumb-item>/ Kepegawaian</breadcrumb-item> 
      <breadcrumb-item active>/ Manage Roles</a></breadcrumb-item>
    </breadcrumb>
    <div class="row">
        <div class="col">
            <div class="card shadow">
                <div class="card-header bg-transparent text-center">
                    <h1 class="">{{ __('Manage Roles') }}</h1>
                </div>
                <div class="card-body">
                	@include('admin.role.form')
                    <div class="text-center">
                        <h2>{{ __('Roles data') }}</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm ajax-table" id="roles-table">
                            <thead>
                            <tr>
                                <th></th>
                                <th>{{ __('No') }}</th>
                                <th>{{ __('Name') }}</th>
                                <th>{{ __('Guard name') }}</th>
                                <th>{{ __('Action') }}</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                          
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@include('admin.role.js')
@include('layouts.footers.auth')
@endsection
@push('css')
    <link rel="stylesheet" href="{{ asset('assets/vendor/datatables/datatables.min.css') }}">
@endpush
@push('js')
    <script src="{{ asset('assets/vendor/jquery/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/datatables/datatables.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/datatables/handlebars.js') }}"></script>
@endpush
