extract() {
  case "$1" in
    *.tar.gz)  tar -xzf "$1" ;;
    *.zip)     unzip "$1" ;;
    *)         echo "unknown format: $1" ;;
  esac
}

