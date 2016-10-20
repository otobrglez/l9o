.PHONY: all frames pngs
text="univizor"
font=whimsy

out.gif: pngs
	convert -loop 0 frames/*.png out.gif

out.avi: pngs
	./video.sh

frames:
	./frames.sh $(text) $(font)

pngs: frames
	find ./frames/*.html -type f | parallel --progress -j 8 "./html2png.js {} {}.png"

clean:
	rm -rf frames/*.html*
	rm -rf out.*

fontz:
	artii -l | xargs -I{} sh -c 'echo {}; artii --font {} univizor > ./fontz/{}.txt'
