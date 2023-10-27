<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateTriggerB extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('
        CREATE DEFINER = CURRENT_USER TRIGGER `CharityDB`.`Beneficiaries_AFTER_INSERT` AFTER INSERT ON `Beneficiaries` FOR EACH ROW
        BEGIN
        INSERT INTO Beneficiaries_has_Supplies
        (Beneficiaries_id,Supplies_id)
        SELECT Beneficiaries.id,Supplies.id
        FROM Beneficiaries CROSS JOIN Supplies where National_ID = NEW.National_ID ;
        END
        ');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trigger');
    }
}
