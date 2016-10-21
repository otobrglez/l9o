.PHONY: all frames pngs
text="univizor"
# font=whimsy
font=script

out.gif: pngs
	convert -loop 0 frames/*.png out.gif

out.avi: pngs
	ffmpeg -framerate 1/4 -r 30 -pattern_type glob -i 'frames/*.html.png' -vf scale=900:-1 -vcodec mpeg4 out.avi

frames:
	./frames.sh $(text) $(font)

pngs: frames
	find ./frames/*.html -type f | parallel --progress -j 8 "./html2png.js {} {}.png"

clean:
	rm -rf frames/*.html*
	rm -rf out.*

fontz:
	artii -l | xargs -I{} sh -c 'echo {}; artii --font {} univizor > ./fontz/{}.txt'


out-final.gif: out.gif
	convert out.gif -crop "350x125+10+10" +repage out-final.gif
