<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToReservationDateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('reservation_date', function (Blueprint $table) {
            $table->foreign('Beneficiaries_id', 'fk_reservation_date_Beneficiaries1')->references('id')->on('Beneficiaries')->onUpdate('NO ACTION')->onDelete('cascade');
            $table->foreign('Hall_id', 'fk_reservation_date_Hall1')->references('id')->on('Hall')->onUpdate('NO ACTION')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('reservation_date', function (Blueprint $table) {
            $table->dropForeign('fk_reservation_date_Beneficiaries1');
            $table->dropForeign('fk_reservation_date_Hall1');
        });
    }
}
