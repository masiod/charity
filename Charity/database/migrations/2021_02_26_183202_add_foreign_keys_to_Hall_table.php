<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToHallTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('Hall', function (Blueprint $table) {
            $table->foreign('Donors_id', 'fk_Hall_Donors1')->references('id')->on('Donors')->onUpdate('NO ACTION')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('Hall', function (Blueprint $table) {
            $table->dropForeign('fk_Hall_Donors1');
        });
    }
}
