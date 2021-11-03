<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContractsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contracts', function (Blueprint $table) {
            $table->id();   
            $table->foreignId('institution_id')->nullable(); // учреждение 
           /* $table->string('institution')->nullable(); // учреждение */
            $table->string('type_contract')->nullable();   //вид договора
            $table->string('contract_basis')->nullable();    //основание для заключения
            $table->date('contract_date')->nullable(); //Дата договора
            $table->string('number_contract')->nullable(); //Номер договора
            $table->string('contractor')->nullable(); // Контрагент 
            $table->string('subject_contract')->nullable(); //Предмет договора
            $table->string('contract_amount')->nullable(); //Сумму Договора в месяц
            $table->date('contract_term_1')->nullable(); //Срок договора
            $table->date('contract_term_2')->nullable(); //Срок договора
            /*$table->string('kosgu')->nullable(); //КОСГУ
            $table->string('kosgu_amount')->nullable(); //Сумма по КОСГУ*/
            $table->text('finance')->nullable(); //Источник финансирования
            $table->string('event_title')->nullable(); //Название мероприятия
            $table->string('responsible_executor')->nullable(); //Ответственнный исполнитель
            // $table->foreignId('responsible_executor_id')->nullable();
           /* $table->text('note_sheet'); // лист замечаний*/
            /*$table->text('files'); // файлы*/
           /* $table->string('status'); // статус*/
            $table->foreignId('user_id'); // автор
           /* $table->string('coordinating'); // согласующие    */       
            $table->boolean('revision')->default(false); // доработка
            $table->boolean('approved')->default(false); // утверждено
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contracts');
    }
}
