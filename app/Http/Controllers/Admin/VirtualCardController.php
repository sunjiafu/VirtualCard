<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\VirtualCardApi;
use App\Models\VirtualCard;
use App\Models\VirtualCardTransaction;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;


class VirtualCardController extends Controller
{
    public function cardApi()
    {
        $page_title = __("Setup Virtual Card Api");
        $api = VirtualCardApi::first();
        return view('admin.sections.virtual-card.api',compact(
            'page_title',
            'api',
        ));
    }
    public function cardApiUpdate(Request $request){
        $validator = Validator::make($request->all(), [
            'api_method'                => 'required|in:flutterwave,sudo,stripe,strowallet,Sqpay',
            'flutterwave_secret_key'    => 'required_if:api_method,flutterwave',
            'flutterwave_secret_hash'   => 'required_if:api_method,flutterwave',
            'flutterwave_url'           => 'required_if:api_method,flutterwave',
            'sudo_api_key'              => 'required_if:api_method,sudo',
            'sudo_vault_id'             => 'required_if:api_method,sudo',
            'sudo_url'                  => 'required_if:api_method,sudo',
            'sudo_mode'                 => 'required_if:api_method,sudo',
            'card_details'              => 'required|string',
            'stripe_public_key'         => 'required_if:api_method,stripe',
            'stripe_secret_key'             => 'required_if:api_method,stripe',
            'stripe_url'                => 'required_if:api_method,stripe',
            'strowallet_public_key'     => 'required_if:api_method,strowallet',
            'strowallet_secret_key'     => 'required_if:api_method,strowallet',
            'strowallet_url'            => 'required_if:api_method,strowallet',
            'image'                     => "nullable|mimes:png,jpg,jpeg,webp,svg",
            'card_limit' => [
                'required',
                'numeric',
                Rule::in([1, 2, 3,10]),
            ],
        ]);
        if($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $request->merge(['name'=>$request->api_method]);
        $data = array_filter($request->except('_token','api_method','_method','card_details','image','card_limit'));
        $api = VirtualCardApi::first();
        $api->card_details = $request->card_details;
        $api->card_limit = $request->card_limit;
        $api->config = $data;

        if ($request->hasFile("image")) {
            try {
                $image = get_files_from_fileholder($request, "image");
                $upload_file = upload_files_from_path_dynamic($image, "card-api");
                $api->image = $upload_file;
            } catch (Exception $e) {
                return back()->with(['error' => [__('Ops! Failed To Upload Image.')]]);
            }
        }
        $api->save();

        return back()->with(['success' => [__('Card API Has Been Updated.')]]);
    }

    public function transactionLogs()
    {
        $page_title = __("Virtual Card Logs");
        $transactions = Transaction::with(
          'user:id,firstname,lastname,email,username,full_mobile',
            'currency:id,name',
        )->where('type', 'VIRTUAL-CARD')->latest()->paginate(20);

        return view('admin.sections.virtual-card.logs', compact(
            'page_title',
            'transactions'
        ));
    }

    public function show(){

        $cards = VirtualCard::all();

        return view('admin.sections.virtual-card.show',compact('cards'));
    }


    public function editcard($id){

        $card = VirtualCard::findOrFail($id);

        return view('admin.sections.virtual-card.editcard',compact('card'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'card_pan' => 'required|string',
            'cvv' => 'required|string',
            'is_active' => 'required|boolean',
        ]);

        

        $card = VirtualCard::findOrFail($id);
        $card->city = $request->city;
        $card->state = $state;
        $card->address = $address;
        $card->zip_code =$zip_code;
        $card->card_pan = $request->card_pan;
        $card->expiration =$request->expiration;
        $card->cvv = $request->cvv;
        $card->is_active = $request->is_active;
        $card->save();

        return redirect()->route('admin.virtual.card.show');
    }

    public function cardTransaction( Request $request){

        $card = null;
        $transactions = null;

        if ($request->has('card_pan')) {
            $card = VirtualCard::where('card_pan', $request->input('card_pan'))->first();
            if ($card) {
                $transactions = VirtualCardTransaction::where('card_id', $card->card_id)->get();
            } else {
                return back()->with('error', 'Card not found.');
            }
        }

        return view('admin.sections.virtual-card.trc', compact('card', 'transactions'));
    }

       // 存储新交易记录
       public function storeCardTransaction(Request $request)
       {
           // 验证请求数据
           $request->validate([
               'card_id' => 'required|integer|exists:virtual_cards,id', // 使用 card_id 验证
               'amount' => 'required|numeric',
               'currency' => 'required|string',
               'status' => 'required|string',
               'product'=>'required|string',
               'reference' => 'nullable|string',
               'gateway_reference' => 'nullable|string',
               'response_message' => 'nullable|string',
           ]);
       
           // 查找对应的卡片
           $card = VirtualCard::find($request->card_id);
       
           // 创建交易记录
           $trxId = date('Ymd') . mt_rand(1000000000, 9999999999);

            VirtualCardTransaction::create([
                'card_id' => $card->card_id,
                'user_id' => $card->user_id, // 确保 user_id 被正确设置
                'amount' => $request->amount,
                'currency' => $request->currency,
                'status' => $request->status,
                'product'=>$request->product,
                'reference' => $request->reference,
                'gateway_reference' => $request->gateway_reference,
                'response_message' => $request->response_message,
                'trx_id' => $trxId,

            ]);

            //更新卡片余额,减去交易记录
            $card->amount-=$request->amount;
            $card->save();

     // 返回成功消息
     return redirect()->back()->with('success', 'Transaction added successfully.');
    
       }
       

}
