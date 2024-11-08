@isset($transactions)
<div class="card mt-4">
    <div class="card-header bg-light">
        <h5 class="card-title mb-0">{{ __("Transaction History") }}</h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>{{ __("Date") }}</th>
                        <th>{{ __("Type") }}</th>
                        <th>{{ __("Amount") }}</th>
                        <th>{{ __("TRX") }}</th>
                        <th>{{ __("Status") }}</th>
                        <th>{{ __("Charge") }}</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($transactions as $item)
                    <tr>
                        <td>{{ dateFormat('d M Y, h:i A', @$item->created_at) }}</td>
                        <td>{{ ucwords(str_replace('_',' ',@$item->remark)) }}</td>
                        <td class="{{ $item->type == payment_gateway_const()::TYPEADDMONEY ? 'text-success' : 'text-danger' }}">
                            {{ $item->type == payment_gateway_const()::TYPEADDMONEY ? '+' : '-' }}{{ get_amount($item->request_amount,get_default_currency_code()) }}
                        </td>
                        <td>{{ @$item->trx_id }}</td>
                        <td>
                            <span class="badge {{ $item->status == 1 ? 'bg-success' : 'bg-warning' }}">
                                {{ @$item->status == 1 ? __("Success") : __("Pending") }}
                            </span>
                        </td>
                        <td>{{ get_amount(@$item->charge->total_charge,get_default_currency_code()) }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center">{{ __("No Record Found!") }}</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
{{ get_paginate($transactions) }}
@endisset
