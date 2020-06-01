# Forces each AUR package's diff to be separately paginated on a clean screen, no matter the length
# Also removes the (sometimes quite large) built packages afterwards which would otherwise gradually accumulate
yay() {
  LESS=SR command yay "$1" && \
    rm -fv ~/.cache/yay/*/*.pkg.*
}
