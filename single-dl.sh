
youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' $1
qshell account G8vPvJGMMZ_2mCLrTpHUDuuHWHZYg0JoUVpFEPHR eK6IFx3sqEg7yTRmL7VsNyx3JGSybesJlso1gy96 default
for file in *
do
    qshell rput gsh-usa "$file" "$file"
done
rm *
