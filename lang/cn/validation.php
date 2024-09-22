<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | 该 following language lines contain 该 default error messages used by
    | 该 validator class. Some of 该se rules have multiple versions such
    | as 该 size rules. Feel free to tweak each of 该se messages here.
    |
    */

    'accepted' => '该 :attribute must be accepted.',
    'accepted_if' => '该 :attribute must be accepted when :o该r is :value.',
    'active_url' => '该 :attribute is not a valid URL.',
    'after' => '该 :attribute must be a date after :date.',
    'after_or_equal' => '该 :attribute must be a date after or equal to :date.',
    'alpha' => '该 :attribute must only contain letters.',
    'alpha_dash' => '该 :attribute must only contain letters, numbers, dashes and underscores.',
    'alpha_num' => '该 :attribute must only contain letters and numbers.',
    'array' => '该 :attribute must be an array.',
    'before' => '该 :attribute must be a date before :date.',
    'before_or_equal' => '该 :attribute must be a date before or equal to :date.',
    'between' => [
        'array' => '该 :attribute must have between :min and :max items.',
        'file' => '该 :attribute must be between :min and :max kilobytes.',
        'numeric' => '该 :attribute must be between :min and :max.',
        'string' => '该 :attribute must be between :min and :max characters.',
    ],
    'boolean' => '该 :attribute field must be true or false.',
    'confirmed' => '该 :attribute confirmation does not match.',
    'current_password' => '该 password is incorrect.',
    'date' => '该 :attribute is not a valid date.',
    'date_equals' => '该 :attribute must be a date equal to :date.',
    'date_format' => '该 :attribute does not match 该 format :format.',
    'declined' => '该 :attribute must be declined.',
    'declined_if' => '该 :attribute must be declined when :o该r is :value.',
    'different' => '该 :attribute and :o该r must be different.',
    'digits' => '该 :attribute must be :digits digits.',
    'digits_between' => '该 :attribute must be between :min and :max digits.',
    'dimensions' => '该 :attribute has invalid image dimensions.',
    'distinct' => '该 :attribute field has a duplicate value.',
    'doesnt_end_with' => '该 :attribute may not end with one of 该 following: :values.',
    'doesnt_start_with' => '该 :attribute may not start with one of 该 following: :values.',
    'email' => '该 :attribute must be a valid email address.',
    'ends_with' => '该 :attribute must end with one of 该 following: :values.',
    'enum' => '该 selected :attribute is invalid.',
    'exists' => '该 selected :attribute is invalid.',
    'file' => '该 :attribute must be a file.',
    'filled' => '该 :attribute field must have a value.',
    'gt' => [
        'array' => '该 :attribute must have more than :value items.',
        'file' => '该 :attribute must be greater than :value kilobytes.',
        'numeric' => '该 :attribute must be greater than :value.',
        'string' => '该 :attribute must be greater than :value characters.',
    ],
    'gte' => [
        'array' => '该 :attribute must have :value items or more.',
        'file' => '该 :attribute must be greater than or equal to :value kilobytes.',
        'numeric' => '该 :attribute must be greater than or equal to :value.',
        'string' => '该 :attribute must be greater than or equal to :value characters.',
    ],
    'image' => '该 :attribute must be an image.',
    'in' => '该 selected :attribute is invalid.',
    'in_array' => '该 :attribute field does not exist in :o该r.',
    'integer' => '该 :attribute must be an integer.',
    'ip' => '该 :attribute must be a valid IP address.',
    'ipv4' => '该 :attribute must be a valid IPv4 address.',
    'ipv6' => '该 :attribute must be a valid IPv6 address.',
    'json' => '该 :attribute must be a valid JSON string.',
    'lowercase' => '该 :attribute must be lowercase.',
    'lt' => [
        'array' => '该 :attribute must have less than :value items.',
        'file' => '该 :attribute must be less than :value kilobytes.',
        'numeric' => '该 :attribute must be less than :value.',
        'string' => '该 :attribute must be less than :value characters.',
    ],
    'lte' => [
        'array' => '该 :attribute must not have more than :value items.',
        'file' => '该 :attribute must be less than or equal to :value kilobytes.',
        'numeric' => '该 :attribute must be less than or equal to :value.',
        'string' => '该 :attribute must be less than or equal to :value characters.',
    ],
    'mac_address' => '该 :attribute must be a valid MAC address.',
    'max' => [
        'array' => '该 :attribute must not have more than :max items.',
        'file' => '该 :attribute must not be greater than :max kilobytes.',
        'numeric' => '该 :attribute must not be greater than :max.',
        'string' => '该 :attribute must not be greater than :max characters.',
    ],
    'max_digits' => '该 :attribute must not have more than :max digits.',
    'mimes' => '该 :attribute must be a file of type: :values.',
    'mimetypes' => '该 :attribute must be a file of type: :values.',
    'min' => [
        'array' => '该 :attribute must have at least :min items.',
        'file' => '该 :attribute must be at least :min kilobytes.',
        'numeric' => '该 :attribute must be at least :min.',
        'string' => '该 :attribute must be at least :min characters.',
    ],
    'min_digits' => '该 :attribute must have at least :min digits.',
    'multiple_of' => '该 :attribute must be a multiple of :value.',
    'not_in' => '该 selected :attribute is invalid.',
    'not_regex' => '该 :attribute format is invalid.',
    'numeric' => '该 :attribute must be a number.',
   'password' => [
    'letters' => '该 :attribute 必须包含至少一个字母。',
    'mixed' => '该 :attribute 必须包含至少一个大写字母和一个小写字母。',
    'numbers' => '该 :attribute 必须包含至少一个数字。',
    'symbols' => '该 :attribute 必须包含至少一个符号。',
    'uncompromised' => '给定的 :attribute 已出现在数据泄露记录中。请选择一个不同的 :attribute。',
],

    'present' => '该 :attribute field must be present.',
    'prohibited' => '该 :attribute field is prohibited.',
    'prohibited_if' => '该 :attribute field is prohibited when :o该r is :value.',
    'prohibited_unless' => '该 :attribute field is prohibited unless :o该r is in :values.',
    'prohibits' => '该 :attribute field prohibits :o该r from being present.',
    'regex' => '该 :attribute format is invalid.',
    'required' => '该 :attribute field is required.',
    'required_array_keys' => '该 :attribute field must contain entries for: :values.',
    'required_if' => '该 :attribute field is required when :o该r is :value.',
    'required_if_accepted' => '该 :attribute field is required when :o该r is accepted.',
    'required_unless' => '该 :attribute field is required unless :o该r is in :values.',
    'required_with' => '该 :attribute field is required when :values is present.',
    'required_with_all' => '该 :attribute field is required when :values are present.',
    'required_without' => '该 :attribute field is required when :values is not present.',
    'required_without_all' => '该 :attribute field is required when none of :values are present.',
    'same' => '该 :attribute and :o该r must match.',
    'size' => [
        'array' => '该 :attribute must contain :size items.',
        'file' => '该 :attribute must be :size kilobytes.',
        'numeric' => '该 :attribute must be :size.',
        'string' => '该 :attribute must be :size characters.',
    ],
    'starts_with' => '该 :attribute must start with one of 该 following: :values.',
    'string' => '该 :attribute must be a string.',
    'timezone' => '该 :attribute must be a valid timezone.',
    'unique' => '该 :attribute has already been taken.',
    'uploaded' => '该 :attribute failed to upload.',
    'uppercase' => '该 :attribute must be uppercase.',
    'url' => '该 :attribute must be a valid URL.',
    'uuid' => '该 :attribute must be a valid UUID.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using 该
    | convention "attribute.rule" to name 该 lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],

        'firstname' => [
        'required' => '请填写名字。',
        'regex' => '名字只能包含英文字符。',
    ],
    'lastname' => [
        'required' => '请填写姓氏。',
        'regex' => '姓氏只能包含英文字符。',
    ],

    'register_email'=>[
        'required' =>'请输入您的邮箱',
        'unique' => '您输入的邮箱已存在',
    ],

    'agree' =>[

        'required' =>'请同意我们的隐私调条款'
    ],

        
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | 该 following language lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [

        'register password' =>'密码',

        'register email' =>'注册邮箱'
       

    ],

];


