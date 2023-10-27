<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDonorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Donors', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('FirstName', 45);
            $table->string('LastName', 45);
            $table->integer('Phone')->unique('Phone_UNIQUE');
            $table->string('National_ID', 45)->unique('National_ID_UNIQUE');
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
        Schema::dropIfExists('Donors');
    }
}
