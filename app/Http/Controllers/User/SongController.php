<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Song;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SongController extends Controller
{
    public function songApi()
    {
        // Fetch all songs
        $songs = Song::all();
    
        // Initialize an empty array to store formatted song data
        $formattedSongs = [];
    
        // Loop through each song and format the data
        foreach ($songs as $song) {
            // Generate URL for song file
            $songUrl = url(Storage::url('public/song/' . $song->music));
    
            // Generate URL for song image
            $imageUrl = url(Storage::url('public/song_images/' . $song->image));
    
            // Add formatted song data to the array
            $formattedSongs[] = [
                'id' => $song->id,
                'title' => $song->title,
                'singer' => $song->singer,
                'song_url' => $songUrl,
                'image_url' => $imageUrl,
            ];
        }
    
        // Return formatted song data as JSON
        return response()->json($formattedSongs);
    }
    
    
}
