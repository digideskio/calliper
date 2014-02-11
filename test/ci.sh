#! /bin/sh

browsers="firefox"

if ruby --version | egrep "ruby 2.0.0" ; then
    curl "https://gist.github.com/santiycr/5139565/raw/sauce_connect_setup.sh" | bash
    browsers="$browsers chrome internet_explorer"
fi

for browser in $browsers; do
    bundle exec rake test BROWSER=$browser
    [ $? -ne 0 ] && exit 1
done