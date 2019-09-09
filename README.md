# SpinnerView

This is a SpinnerView view for rotate 2 lateral images on circle

![Image-1](https://user-images.githubusercontent.com/16116453/64069656-77c28000-cc56-11e9-9824-1206158d7f30.jpg)

![RotateGif](https://user-images.githubusercontent.com/16116453/64567144-3ae63f80-d360-11e9-949a-3ed3d94ec3b1.gif)

<h2> Use RotateView Element </h2>

Set inner arrow size 
<pre><code> rotateView.arrowSize = CGSize(width: 30, height: 30)
</code></pre>

Set rotated images size 
<pre><code> rotateView.imagesSize = CGSize(width: 15, height: 15)
</code></pre>

Set rotated images
<pre><code> rotateView.image1 = UIImage(named: "LiteraA")
  rotateView.image2 = UIImage(named: "LiteraA")
</code></pre>
  
Set rotate radius
<pre><code> rotateView.radius = 15
</code></pre>

Init Elements
<pre><code> rotateView.initElements()
</code></pre>

Start/Stop Rotate
<pre><code> rotateView.startStopAnimation()
</code></pre>
