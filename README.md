This is a simple script that I made to reduce the time it takes me to make steamGrid and banners for my personal library of games.

This script(s) assumes that the two img files are the same dimensions, and is also reliant on imagemagick.

Make sure both scripts are in the same folder, and run them based on need.



For just one img you can run the first script with the usage:

<code>./merge_images.sh \<base_image.png\> \<overlay_image.png\> \<output_image.png\></code>

For a whole folder of imgs with the same overlay you can use the second script.

<code>./batch_merge_images_auto.sh \<overlay_image.png\> \<input_folder\></code>


imagemagick can be installed from Homebrew

<code>brew install imagemagick</code>

Or for Fedora based distrobutions of Linux

<code>dnf install imagemagick</code>

Or for Debian based distrobutions of Linux. 

<code>apt install imagemagick</code>
