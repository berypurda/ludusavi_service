## Ludusavi service

This is a systemd service for **Steam Deck** (should work on every linux distro with the flatpak Ludusavi installed), 
which launches the command:
```
com.github.mtkennerly.ludusavi backup --force
```
on each game launch and close.

How is this useful?

I am currently using it in combination with DeckyCloudSave
so that every time I open or close a game, ludusavi backup runs, and then,
DeckyCloudSave will upload the ludusavi backup folder to the specified cloud provider.

### Installation instructions

Clone or download and extract the repo into /home/deck/Scripts

Open the terminal inside /home/deck/Scripts/ludusavi_service

Make the script executable by running this command:
```
chmod +x restore_ludusavi_service.sh
```
Run the script with this command:
```
sudo ./restore_ludusavi_service.sh
```

The service should be working now!
Be aware that the repo should be left in /home/deck/Scripts for this to work

And also be aware, that you have to re-run this after every major SteamOS update.


I am in no association with either the creator of Ludusavi or DeckyCloudSave, I just started using their products, 

which are both amazing, and I tought of a way to combine the 2.

## Shoutout to these projects:

![mtkennerly/ludusavi](https://github.com/mtkennerly/ludusavi)  
![GedasFX/decky-cloud-save](https://github.com/GedasFX/decky-cloud-save)
