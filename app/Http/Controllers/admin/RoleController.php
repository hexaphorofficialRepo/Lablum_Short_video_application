<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
      //
      public function index()
      {
          $roles = Role::all();
          return view('admin.role.index',compact('roles'));
      }
      public function store(Request $request)
      {
          $request->validate([
              'name' => 'required',
          ]);
          Role::create([
              'name' => $request->name,
              'guard_name' => 'admin',
              'created_at' => date('Y-m-d H:i:s'),
              'updated_at' => date('Y-m-d H:i:s'),
          ]);
          return redirect()->back();
      }
      public function permissionView($id)
      {
          $role =  Role::findById($id);
          $data = Permission::role($role->name)->get();
          $permissions = Permission::all();
          return view('admin.permission.index', compact('data', 'permissions', 'role'));
      }
      public function permissions($id)
      {
          $role =  Role::findById($id);
          $data = Permission::role($role->name)->get();
          $permissions = Permission::all();
          return view('permission.index', compact('data', 'permissions', 'role'));
      }
      public function update(Request $request, $id)
      {
          $permissions = $request->all();
          $permissions = array_values($permissions);
          $role       = Role::find($id);
          $permission = Permission::whereIn('id', $permissions)->get();
          $role->syncPermissions($permission);
          $users = Admin::role($role->name)->get();
          foreach ($users as $user) {
              $user->syncPermissions(Permission::role($role->name)->get());
          }
          return redirect()->back();
      }
}
