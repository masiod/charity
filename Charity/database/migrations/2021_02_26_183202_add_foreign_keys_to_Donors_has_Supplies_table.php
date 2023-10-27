<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDonorsHasSuppliesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('Donors_has_Supplies', function (Blueprint $table) {
            $table->foreign('Donors_id', 'fk_Donors_has_Supplies_Donors')->references('id')->on('Donors')->onUpdate('NO ACTION')->onDelete('cascade');
            $table->foreign('Supplies_id', 'fk_Donors_has_Supplies_Supplies1')->references('id')->on('Supplies')->onUpdate('NO ACTION')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('Donors_has_Supplies', function (Blueprint $table) {
            $table->dropForeign('fk_Donors_has_Supplies_Donors');
            $table->dropForeign('fk_Donors_has_Supplies_Supplies1');
        });
    }
}
