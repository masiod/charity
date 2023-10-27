<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBeneficiariesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Beneficiaries', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('FirstName', 45);
            $table->string('LastName', 45);
            $table->integer('Phone')->unique('Phone_UNIQUE');
            $table->integer('National_ID')->unique('National_ID_UNIQUE');
            $table->string('Certificate', 150);
            $table->string('Work', 100);
            $table->float('Income', 10, 0);
            $table->longText('Reason');
            $table->string('password',70);
            $table->tinyInteger('Acceptance')->default(0);
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
        Schema::dropIfExists('Beneficiaries');
    }
}
