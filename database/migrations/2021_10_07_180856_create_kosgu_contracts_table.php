<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKosguContractsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kosgu_contracts', function (Blueprint $table) {
            $table->id();   
            $table->foreignId('contract_id')->constrained()->onDelete('cascade');; 
            $table->string('kosgu_title');
            $table->string('kosgu_amount');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kosgu_contracts');
    }
}
