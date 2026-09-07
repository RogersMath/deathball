#!/bin/sh
# npm i -g html-minifier-terser ; pip install zopflipy
html-minifier-terser --collapse-whitespace --remove-comments --remove-attribute-quotes \
  --minify-css true \
  --minify-js '{"mangle":{"toplevel":true},"compress":{"passes":4,"unsafe":true,"unsafe_arrows":true,"unsafe_math":true,"hoist_funs":true}}' \
  deathball.html -o deathball.min.html
python3 -c "
import zopfli,os
z=zopfli.ZipFile('deathball13k.zip','w',zopfli.zipfile.ZIP_DEFLATED)
z.write('deathball.min.html','index.html'); z.close()
n=os.path.getsize('deathball13k.zip')
print('zip', n, 'bytes  headroom', 13312-n)
"
