<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDonorsHasSuppliesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Donors_has_Supplies', function (Blueprint $table) {
            $table->integer('Donors_id')->index('fk_Donors_has_Supplies_Donors_idx');
            $table->integer('Supplies_id')->index('fk_Donors_has_Supplies_Supplies1_idx');
            $table->integer('Quantity');
            $table->primary(['Donors_id', 'Supplies_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('Donors_has_Supplies');
    }
}
