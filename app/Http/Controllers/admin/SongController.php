<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Song;
use Illuminate\Http\Request;

class SongController extends Controller
{
    public function index(){
        $songs = Song::latest()->get();
        return view('admin.song.index',compact('songs'));
    }
    public function create(){
        return view('admin.song.create');
    }
    public function store(Request $request){
        $request->validate([
            'music' => 'required',
            'title' => 'required', 
          
        ]);
    
     
        $song = new Song();
        $song->title = $request->input('title');
        $song->singer = $request->input('singer');
    
     
        if ($request->hasFile('image')) {
          
            $imagePath = $request->file('image')->store('public/song_images');
    
            $imageName = basename($imagePath);
            $song->image = $imageName;
        }
    
     
        $musicPath = $request->file('music')->storeAs('public/song', $song->title . '.mp3');
     
        $song->music = $song->title . '.mp3';
    
        $song->save();
    
       
        return redirect()->route('admin.song.index')->with('success', 'Song added successfully');
    }


    public function edit(Song $song){
        return view('admin.song.edit',compact('song'));
    }

    public function update(Request $request,Song $song){
        $request->validate([
            'music' => 'required',
            'title' => 'required', 
        ]);
    
        // Fetch the song by its ID
     
    
        $song->title = $request->input('title');
        $song->singer = $request->input('singer');
    
        // Handle image upload
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('public/song_images');
            $imageName = basename($imagePath);
            $song->image = $imageName;
        }
    
        // Handle music upload
        if ($request->hasFile('music')) {
            $musicPath = $request->file('music')->storeAs('public/song', $song->title . '.mp3');
            $song->music = $song->title . '.mp3';
        }
    
        $song->save();
    
        return redirect()->route('admin.song.index')->with('success', 'Song updated successfully');
    }
    
    
    
}
