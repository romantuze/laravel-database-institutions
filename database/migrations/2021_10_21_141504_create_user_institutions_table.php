<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserInstitutionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_institutions', function (Blueprint $table) {
            $table->id();   
            $table->foreignId('institution_id')->constrained()->onDelete('cascade'); //учреждение
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); //согласующий
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_institutions');
    }
}
