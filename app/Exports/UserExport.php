<?php

namespace App\Exports;

use App\Models\User;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class UserExport implements FromCollection, WithHeadings
{
    protected $users;

    public function __construct(Collection $users)
    {
        $this->users = $users;
    }

    public function collection()
    {
        return $this->users;
    }

    public function headings(): array
    {
    
        $columns = Schema::getColumnListing((new User())->getTable());
        
      
        $headings = [
            'user_id' => 'ID',
            'username' => 'USERNAME',
            'fname' => 'FIRST NAME',
            'lname' => 'LAST NAME',
            'email' => 'EMAIL',
            'mobile' => 'MOBILE',
            'gender' => 'GENDER',
            'bio' => 'BIOGRAPHY',
            'dob' => 'DATE OF BIRTH',
            'active' => 'ACTIVE STATUS (1 =  Active $$ 0 = Blocked)',
            'last_active' => 'LAST ACTIVE',
            'kyc_status' => 'KYC STATUS (1 = Done $$ 0 = Not Done)',
            
           
        ];

      
        return array_intersect_key($headings, array_flip($columns));
    }
}
