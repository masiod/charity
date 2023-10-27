<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBeneficiariesHasSuppliesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Beneficiaries_has_Supplies', function (Blueprint $table) {
            $table->integer('Beneficiaries_id')->default(101)->index('fk_Beneficiaries_has_Supplies_Beneficiaries1_idx');
            $table->integer('Supplies_id')->index('fk_Beneficiaries_has_Supplies_Supplies1_idx');
            $table->tinyInteger('Authorization')->default(0);
            $table->integer('AuthQuantity')->nullable();
            $table->integer('Quantity')->nullable();
            $table->primary(['Beneficiaries_id', 'Supplies_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('Beneficiaries_has_Supplies');
    }
}
