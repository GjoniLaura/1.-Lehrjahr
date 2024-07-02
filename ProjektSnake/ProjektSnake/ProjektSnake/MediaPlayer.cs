using System;


namespace ProjektSnake
{
    // This is a sound that sounds when the snake eats the food
    MediaPlayer player = new MediaPlayer(); 
    player.Open(new Uri("Assets/Eating-Sound.wav", UriKind.Relative));
    player.Play();
        
}
