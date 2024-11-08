@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb', [
        'breadcrumbs' => [
            [
                'name' => __("Dashboard"),
                'url' => setRoute("user.dashboard"),
            ],
            [
                'name' => __("Profile"),
                'url' => '',
            ],
        ],
        'active' => __("Profile")
    ])
@endsection

@section('content')
<div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
    <div class="container-fluid px-0">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h2 mb-0">{{ __("Profile") }}</h1>
            </div>
        </div>
    </div>
</div>

<div class="p-3 p-xxl-5">
    <div class="container-fluid px-0">
        <div class="row">
            <!-- Profile Information -->
            <div class="col-xl-6 col-lg-6 mb-4">
                <div class="card rounded-12 shadow">
                    <div class="card-header border-bottom-0">
                        <h5 class="card-title mb-0">{{ __("Profile Information") }}</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ setRoute('user.profile.update') }}" enctype="multipart/form-data" method="POST">
                            @csrf
                            @method("PUT")
                            <div class="text-center mb-4">
                                <div class="position-relative d-inline-block">
                                    <img src="{{ $user->userImage }}" class="rounded-circle" alt="Profile Picture" width="120" height="120">
                                    <label for="profilePicUpload" class="position-absolute bottom-0 end-0 bg-primary text-white rounded-circle p-2" style="cursor: pointer;">
                                        <i class="fas fa-camera"></i>
                                    </label>
                                    <input type="file" id="profilePicUpload" name="image" accept=".png, .jpg, .jpeg" class="d-none">
                                </div>
                                <h5 class="mt-3">{{ $user->username }}</h5>
                                <p class="text-muted">{{ $user->email }}</p>
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="firstname" class="form-label">{{ __("First Name") }}<span>*</span></label>
                                    <input type="text" class="form-control" id="firstname" name="firstname" value="{{ auth()->user()->firstname ?? old('firstname') }}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="lastname" class="form-label">{{ __("Last Name") }}<span>*</span></label>
                                    <input type="text" class="form-control" id="lastname" name="lastname" value="{{ auth()->user()->lastname ?? old('lastname') }}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="country" class="form-label">{{ __("Country") }}</label>
                                    <select name="country" id="country" class="form-select select2" data-placeholder="{{ __('Select Country') }}">
                                        <!-- 国家选项将由 JavaScript 填充 -->
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">{{ __("Phone") }}</label>
                                    <div class="input-group">
                                        <span class="input-group-text" id="phoneCode">+{{ auth()->user()->mobile_code }}</span>
                                        <input type="hidden" name="phone_code" value="{{ auth()->user()->mobile_code }}">
                                        <input type="text" class="form-control" id="phone" name="phone" value="{{ old('phone', auth()->user()->mobile) }}" aria-describedby="phoneCode">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="address" class="form-label">{{ __("Address") }}</label>
                                    <input type="text" class="form-control" id="address" name="address" value="{{ old('address', auth()->user()->address->address ?? '') }}" placeholder="{{ __("Enter Address") }}">
                                </div>
                                <div class="col-md-6">
                                    <label for="city" class="form-label">{{ __("City") }}</label>
                                    <input type="text" class="form-control" id="city" name="city" value="{{ old('city', auth()->user()->address->city ?? '') }}" placeholder="{{ __("Enter City") }}">
                                </div>
                                <div class="col-md-6">
                                    <label for="state" class="form-label">{{ __("State") }}</label>
                                    <input type="text" class="form-control" id="state" name="state" value="{{ old('state', auth()->user()->address->state ?? '') }}" placeholder="{{ __("Enter State") }}">
                                </div>
                                <div class="col-md-6">
                                    <label for="zip_code" class="form-label">{{ __("Zip Code") }}</label>
                                    <input type="text" class="form-control" id="zip_code" name="zip_code" value="{{ old('zip_code', auth()->user()->address->zip ?? '') }}" placeholder="{{ __("Enter Zip Code") }}">
                                </div>
                            </div>
                            <div class="mt-4">
                                <button type="submit" class="btn btn-primary w-100">{{ __("Update") }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Change Password or Social Login Info -->
            <div class="col-xl-6 col-lg-6 mb-4">
                @if($user->social_type == 'google' || $user->social_type == 'facebook')
                <div class="card rounded-12 shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">{{ __("Social Login") }}</h5>
                        <p>{{ __("You are logged in using your") }} {{ ucfirst($user->social_type) }} {{ __("account.") }}</p>
                    </div>
                </div>
                @else
                <div class="card rounded-12 shadow">
                    <div class="card-header border-bottom-0">
                        <h5 class="card-title mb-0">{{ __("Change Password") }}</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ setRoute('user.profile.password.update') }}" method="POST">
                            @csrf
                            @method("PUT")
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="current_password" class="form-label">{{ __("Current Password") }}<span>*</span></label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="current_password" name="current_password" placeholder="{{ __("Enter Current Password") }}" required>
                                        <button class="btn btn-outline-secondary toggle-password" type="button" data-target="#current_password">
                                            <i class="fas fa-eye-slash"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label for="password" class="form-label">{{ __("New Password") }}<span>*</span></label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="{{ __("Enter New Password") }}" required>
                                        <button class="btn btn-outline-secondary toggle-password" type="button" data-target="#password">
                                            <i class="fas fa-eye-slash"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label for="password_confirmation" class="form-label">{{ __("Confirm Password") }}<span>*</span></label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="{{ __("Enter Confirm Password") }}" required>
                                        <button class="btn btn-outline-secondary toggle-password" type="button" data-target="#password_confirmation">
                                            <i class="fas fa-eye-slash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4">
                                <button type="submit" class="btn btn-primary w-100">{{ __("Change Password") }}</button>
                            </div>
                        </form>
                    </div>
                </div>
                @endif
            </div>
        </div>

        <!-- Delete Account Button -->
        <div class="row">
            <div class="col-12">
                <div class="card rounded-12 shadow">
                    <div class="card-body text-center">
                        <button class="btn btn-danger delete-btn">{{ __("Delete Account") }}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('user.partials.footer')

</div>

<!-- Delete Account Modal -->
<div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow-dark-80">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteAccountModalLabel">{{ __("Delete Account") }}</h5>
                <button type="button" class="btn btn-icon p-0" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>{{ __("Are you sure you want to delete your account? This action cannot be undone.") }}</p>
                <form action="{{ setRoute('user.delete.account') }}" method="POST" id="deleteAccountForm">
                    @csrf
                    <button type="submit" class="btn btn-danger w-100">{{ __("Delete Account") }}</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    $(document).ready(function () {
        // Initialize Select2 for country selection
        $('#country').select2({
            placeholder: "{{ __('Select Country') }}",

            ajax: {
                url: "{{ setRoute('global.countries') }}",
                dataType: 'json',
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                processResults: function (data) {
                    return {
                        results: data.map(function (item) {
                            return {
                                id: item.country,
                                text: item.country,
                                mobile_code: item.mobile_code
                            };
                        })
                    };
                }
            }
        }).on('select2:select', function (e) {
            var mobileCode = e.params.data.mobile_code;
            $('#phoneCode').text('+' + mobileCode);
            $('input[name="phone_code"]').val(mobileCode);
        });

        // Preselect country if user has one
        var selectedCountry = "{{ old('country', auth()->user()->address->country ?? '') }}";
        if (selectedCountry) {
            var option = new Option(selectedCountry, selectedCountry, true, true);
            $('#country').append(option).trigger('change');
        }

        // Toggle password visibility
        $('.toggle-password').on('click', function () {
            var target = $(this).data('target');
            var input = $(target);
            var icon = $(this).find('i');
            if (input.attr('type') === 'password') {
                input.attr('type', 'text');
                icon.removeClass('fa-eye-slash').addClass('fa-eye');
            } else {
                input.attr('type', 'password');
                icon.removeClass('fa-eye').addClass('fa-eye-slash');
            }
        });

        // Delete account confirmation
        $('.delete-btn').on('click', function () {
            $('#deleteAccountModal').modal('show');
        });
    });
</script>
@endpush
