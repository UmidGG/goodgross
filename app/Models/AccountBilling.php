<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountBilling extends Model
{
    use HasFactory;

    protected $table = 'account_billings';
    protected $guarded = [];

    public function country() {
        return $this->belongsTo(Country::class);
    }
}
