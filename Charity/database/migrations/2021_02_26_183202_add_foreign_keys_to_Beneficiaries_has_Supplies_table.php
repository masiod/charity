<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToBeneficiariesHasSuppliesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('Beneficiaries_has_Supplies', function (Blueprint $table) {
            $table->foreign('Beneficiaries_id', 'fk_Beneficiaries_has_Supplies_Beneficiaries1')->references('id')->on('Beneficiaries')->onUpdate('NO ACTION')->onDelete('cascade');
            $table->foreign('Supplies_id', 'fk_Beneficiaries_has_Supplies_Supplies1')->references('id')->on('Supplies')->onUpdate('NO ACTION')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('Beneficiaries_has_Supplies', function (Blueprint $table) {
            $table->dropForeign('fk_Beneficiaries_has_Supplies_Beneficiaries1');
            $table->dropForeign('fk_Beneficiaries_has_Supplies_Supplies1');
        });
    }
}
