release: make_release_zip

clean:
	rm -fv TelemachusForAll-*.zip
	rm -rfv build

get_mini_avc: make_build_dir
	mkdir -p MiniAVC-1.0.3.3
	cd MiniAVC-1.0.3.3 && \
		curl -O http://ksp.cybutek.net/miniavc/MiniAVC-1.0.3.3.zip && \
		unzip MiniAVC-1.0.3.3.zip && \
		mv MiniAVC/MiniAVC.dll ../build/GameData/TelemachusForAll && \
		mv LICENSE.txt ../build/GameData/TelemachusForAll/LICENSE.MiniAVC
	rm -rfv MiniAVC-1.0.3.3

make_build_dir:
	mkdir -p build/GameData/TelemachusForAll

make_release_zip: make_build_dir get_mini_avc
	cp -v GameData/TelemachusForAll/* build/GameData/TelemachusForAll/
	cp -v TelemachusForAll.version build/GameData/TelemachusForAll/
	cd build && zip -rm ../TelemachusForAll-0.1.1.zip *

.PHONY: clean get_mini_avc make_build_dir make_release_zip make_source_zip release
