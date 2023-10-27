<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHallTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Hall', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('Name', 100);
            $table->string('Location', 100);
            $table->integer('Donors_id')->index('fk_Hall_Donors1_idx');
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
        Schema::dropIfExists('Hall');
    }
}
