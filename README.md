# redditTelevision
Incomplete RedditTV for tvOS9. Incomplete until YouTube. Check out the blog post at: http://jonathanstyu.github.io/redditTV/

#### How the App is Structured

The app is structured in a way similar to that of my other apps: There are two viewcontrollers: One shows a menu with a number of videos in a UICollectionView. The other is what is shown when someone actually clicks on a video. This is where we should see a video playing.

In order to make it easier to handle the download and other certain factorized logic, I created two files called UIFactory and URLFactory. The UIFactory never got a chance to do much. In my basketball app mostly what it did was to put together repetitive programmatically generated UIKit visual items like buttons. In this case all it does is generate a randomly selected background color. Because tvOS is so new, we have to do a lot of things from scratch. There are no available CocoaPods, including my normal menagerie of color utility tools. This means you gotta roll up your sleeves and bring your own beers to the party. 

The MenuViewController has the UICollectionView, which is instantiated in MenuVC-Coll.swift file. Most of the stuff in the file is ordinary and normal for UICollectionView. However, the interesting thing is the code below. 

    func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
            return true
        }
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        print("Hello!!! \(channels[indexPath.row])")
        return true
    }

The code above addresses the focus engine, the newest and most exciting thing about tvOS. Problem is that there are not a lot to read about making it work outside of the rather sparse code provided by Apple. The closest I got to it was [this blog post](http://nerds.airbnb.com/tvos-focus-engine/) from AirBnB engineering. I think it will help but the gist of what I got is that the tvOS focus engine has a bunch of additional methods that you gotta call so that you can work on the effects that you want to create when someone focuses on the particular cell. This function can then be passed down to the individual cell that is in the Collection.

    thumbnail = UIImageView()
    thumbnail.adjustsImageWhenAncestorFocused = true

So apparently now the behavior has been set that when the cell is focused on, the thumbnail image expands to indicate that the cursor is on it. Cool default behavior, Apple. 

The rest of the app is a pretty simple UICollectionView. I am coming across some sort of bug with the UICollectionViewCell is displaying the wrong thumbnail. This is likely due to the code reusing and recycling a cached image before the image is properly downloaded from the source. I am honestly just too lazy to deal with it. 

#### The Show Stopper

The reason I did not progress with this app is that it cannot play YouTube videos. The usual accepted way to display YT video in an app is to create a UIWebView and have it play the video. This is how the general YT iOS plugin works. The difference is that Apple removed UIWebView from tvOS. This is likely for performance and usage reasons. The only available video player works by using an underlying mp4 file. I don't have access to that.  

I reviewed some StackExchange answers to figure out how to get around this. I came across [this thread](http://stackoverflow.com/questions/32528624/how-to-play-youtube-content-on-tvos) that discusses using some sort of workaround that cracks open the YouTube link's stream and accesses the underlying video file. Naturally this is hella against the TOS. Then Apple finally chimed in and said: 

    There is no support for WebViews on tvOS, and so an iframe implementation will not work. TVML does not offer this capability.

As my former coworker Paul used to say all the time, "Goddammit". I am sure that at some point that YouTube is going to figure out a way to handle this but until then I am going to leave it as it is. Maybe other people can take a look at it and get something useful out of it. 
